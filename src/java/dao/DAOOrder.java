/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Order;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DBConnect;

/**
 *
 * @author Asus
 */
public class DAOOrder extends DBConnect{
    public int addOrder (Order order) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[orders]\n" +
"           ([uid]\n" +
"           ,[order_date]\n" +
"           ,[total]\n" +
"           ,[status])\n" +
"     VALUES\n" +
"           (?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?)";
        
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, order.getUserId());
            pre.setString(2, order.getDate());
            pre.setDouble(3, order.getTotal());
            pre.setInt(4, order.getStatus());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int updateOrder (Order order) {
        int n = 0;
        String sql = "UPDATE [dbo].[orders]\n" +
"   SET [uid] = ?\n" +
"      ,[order_date] = ?\n" +
"      ,[total] = ?\n" +
"      ,[status] = ?\n" +
" WHERE order_id = " + order.getId();
        
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, order.getUserId());
            pre.setString(2, order.getDate());
            pre.setDouble(3, order.getTotal());
            pre.setInt(4, order.getStatus());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int deleteOrder(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[orders]\n" +
"      WHERE order_id = " + id;
        
        try {
            ResultSet rs = this.getData("SELECT * FROM [dbo].[order_items] WHERE order_id = " + id);
            if (rs.next()) {
                DAOOrderDetail dao = new DAOOrderDetail();
                dao.deleteOrderDetail(rs.getInt("order_item_id"));
            }
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public Order getOrder(int id) {
        Order order = new Order();
        String sql = "SELECT * FROM [dbo].[orders] WHERE order_id = " + id;
        
        ResultSet rs = this.getData(sql);
        
        try {
            if (rs.next()){
                order.setId(id);
                order.setDate(rs.getString("order_date"));
                order.setTotal(rs.getDouble("total"));
                order.setUserId(rs.getInt("uid"));
                order.setStatus(rs.getInt("status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return order;
    }
    
    public Vector<Order> getAllOrder() {
        Vector<Order> listOrder = new Vector<Order>();
        String sql = "SELECT * FROM [dbo].[orders]";
        
        ResultSet rs = this.getData(sql);
        
        try {
            while (rs.next()){
                Order order = new Order();
                order.setId(rs.getInt("order_id"));
                order.setDate(rs.getString("order_date"));
                order.setTotal(rs.getDouble("total"));
                order.setUserId(rs.getInt("uid"));
                order.setStatus(rs.getInt("status"));
                listOrder.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listOrder;
    }
    
    public void displayAll() {
        Iterator it = this.getAllOrder().iterator();
        while (it.hasNext()) {
            System.out.println(it.next());
        }
    } 
    public static void main(String[] args) {
        DAOOrder dao = new DAOOrder();
//        int n = dao.addOrder(new Order(1, 1002, "3/2/2023", 3, 1));
//        
//        if (n > 0) {
//            System.out.println("inserted");
//        }
        dao.displayAll();
    }
}

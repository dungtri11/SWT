/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.OrderDetail;
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
public class DAOOrderDetail extends DBConnect {

    public int addOrderDetail(OrderDetail ord) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[order_items]\n"
                + "           ([order_id]\n"
                + "           ,[book_id]\n"
                + "           ,[quantity]\n"
                + "           ,[price])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, ord.getOrderId());
            pre.setInt(2, ord.getBookId());
            pre.setInt(3, ord.getQuantity());
            pre.setDouble(4, ord.getPrice());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateOrderDetail(OrderDetail ord) {
        int n = 0;
        String sql = "UPDATE [dbo].[order_items]\n"
                + "   SET [order_id] = ?\n"
                + "      ,[book_id] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[price] = ?\n"
                + " WHERE order_item_id = " + ord.getId();
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, ord.getOrderId());
            pre.setInt(2, ord.getBookId());
            pre.setInt(3, ord.getQuantity());
            pre.setDouble(4, ord.getPrice());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteOrderDetail(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[order_items]\n"
                + "      WHERE order_item_id = " + id;

        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public OrderDetail getOrderDetail(int id) {
        OrderDetail ord = new OrderDetail();
        String sql = "SELECT * FROM [dbo].[order_items] WHERE order_item_id = " + id;
        ResultSet rs = this.getData(sql);

        try {
            if (rs.next()) {
                ord.setId(id);
                ord.setBookId(rs.getInt("book_id"));
                ord.setOrderId(rs.getInt("order_id"));
                ord.setQuantity(rs.getInt("quantity"));
                ord.setPrice(rs.getDouble("price"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ord;
    }

    public Vector<OrderDetail> getAllOrderDetail() {
        Vector<OrderDetail> listOrderDetail = new Vector<OrderDetail>();
        String sql = "SELECT * FROM [dbo].[order_items]";

        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) {
                OrderDetail ord = new OrderDetail();
                ord.setId(rs.getInt("order_item_id"));
                ord.setBookId(rs.getInt("book_id"));
                ord.setOrderId(rs.getInt("order_id"));
                ord.setQuantity(rs.getInt("quantity"));
                ord.setPrice(rs.getDouble("price"));
                listOrderDetail.add(ord);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listOrderDetail;
    }

    

    public void displayAll() {
        Iterator it = this.getAllOrderDetail().iterator();
        while (it.hasNext()) {
            System.out.println(it.next());
        }
    }

    public static void main(String[] args) {
        DAOOrderDetail dao = new DAOOrderDetail();
//        int n = dao.addOrderDetail(new OrderDetail(1, 1, 1, 1, 14.99));
//        
//        if (n  > 0) {
//            System.out.println("inserted");
//        }
        dao.deleteOrderDetail(11);
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Order;
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
public class DAOOrder extends DBConnect {

    public int addOrder(Order order) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[orders]\n"
                + "           ([uid]\n"
                + "           ,[order_date]\n"
                + "           ,[total]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";

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

    public int updateOrder(Order order) {
        int n = 0;
        String sql = "UPDATE [dbo].[orders]\n"
                + "   SET [uid] = ?\n"
                + "      ,[order_date] = ?\n"
                + "      ,[total] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE order_id = " + order.getId();

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
        String sql = "DELETE FROM [dbo].[orders]\n"
                + "      WHERE order_id = " + id;

        try {
            ResultSet rs = this.getData("SELECT * FROM [dbo].[order_items] WHERE order_id = " + id);
            while (rs.next()) {
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

    public int checkOutOrder(int id, Integer status) {
        int n = 0;
        String sql = "UPDATE [dbo].[orders]\n"
                + "   SET [status] = " + status + "\n"
                + " WHERE order_id = " + id;

        try {

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
            if (rs.next()) {
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

    public String getOrderCode(Order order) {
        return "C" + order.getUserId() + "O" + String.format("%06d", order.getId());
    }

    public Vector<OrderDetail> getOrderDetails(int id) {
        Vector<OrderDetail> listOrderDetails = new Vector<>();
        String sql = "SELECT * FROM [dbo].[order_items] WHERE order_id = " + id;
        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) {
                OrderDetail ord = new OrderDetail();
                ord.setId(rs.getInt("order_item_id"));
                ord.setBookId(rs.getInt("book_id"));
                ord.setOrderId(rs.getInt("order_id"));
                ord.setQuantity(rs.getInt("quantity"));
                ord.setPrice(rs.getDouble("price"));
                listOrderDetails.add(ord);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listOrderDetails;
    }

    public Vector<Vector> getBillDetail(int id) {
        Vector<Vector> listItem = new Vector<>();
        String sql = "select books.title, order_items.price, order_items.quantity, (order_items.price*order_items.quantity) as subtotal\n"
                + "from books join order_items on books.book_id = order_items.book_id \n"
                + "where order_items.order_id = " + id;
        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) {
                Vector bill = new Vector();
                bill.add(rs.getString("title"));
                bill.add(rs.getDouble("price"));
                bill.add(rs.getInt("quantity"));
                bill.add(rs.getDouble("subtotal"));
                listItem.add(bill);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listItem;
    }

    public Vector<Order> getAllOrder() {
        Vector<Order> listOrder = new Vector<Order>();
        String sql = "SELECT * FROM [dbo].[orders]";

        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) {
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
        Iterator it = this.getBillDetail(1).iterator();
        while (it.hasNext()) {
            Vector v = (Vector) it.next();
            System.out.println("{" + (String) v.get(0) + "," + (double) v.get(1) + "," + (int) v.get(2) + "," + (double) v.get(3) + "}");
        }
    }

    public static void main(String[] args) {
        DAOOrder dao = new DAOOrder();
        int n = dao.deleteOrder(16);
        
        if (n > 0) {
            System.out.println("inserted");
        }
//        dao.displayAll();
    }
}

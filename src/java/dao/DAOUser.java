/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.User;
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
public class DAOUser extends DBConnect {

    public int addUser(User user) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Users]\n"
                + "           ([first_name]\n"
                + "           ,[last_name]\n"
                + "           ,[Username]\n"
                + "           ,[Password]\n"
                + "           ,[email]\n"
                + "           ,[address]\n"
                + "           ,[city]\n"
                + "           ,[district]\n"
                + "           ,[ward]\n"
                + "           ,[UserRole])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, user.getFirstName());
            pre.setString(2, user.getLastName());
            pre.setString(3, user.getUsername());
            pre.setString(4, user.getPassword());
            pre.setString(5, user.getEmail());
            pre.setString(6, user.getAddress());
            pre.setString(7, user.getCity());
            pre.setString(8, user.getDistrict());
            pre.setString(9, user.getWard());
            pre.setInt(10, user.getRole());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateUser(User user) {
        int n = 0;
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET [first_name] = ?\n"
                + "      ,[last_name] = ?\n"
                + "      ,[Username] = ?\n"
                + "      ,[Password] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[city] = ?\n"
                + "      ,[district] = ?\n"
                + "      ,[ward] = ?\n"
                + "      ,[UserRole] = ?\n"
                + " WHERE uid = " + user.getId();

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, user.getFirstName());
            pre.setString(2, user.getLastName());
            pre.setString(3, user.getUsername());
            pre.setString(4, user.getPassword());
            pre.setString(5, user.getEmail());
            pre.setString(6, user.getAddress());
            pre.setString(7, user.getCity());
            pre.setString(8, user.getDistrict());
            pre.setString(9, user.getWard());
            pre.setInt(10, user.getRole());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int deleteUser(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[Users]\n"
                + "      WHERE uid = " + id;
        try {
            ResultSet rs = this.getData("SELECT * FROM [dbo].[orders] WHERE uid = " + id);
            while (rs.next()) {
                DAOOrder dao = new DAOOrder();
                dao.deleteOrder(rs.getInt("order_id"));
            }
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public User getUser(int id) {
        User user = new User();
        String sql = "SELECT *"
                + "  FROM [dbo].[Users] WHERE uid = " + id;
        ResultSet rs = this.getData(sql);
        try {
            if (rs.next()) {
                user.setId(rs.getInt("uid"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setUsername(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                user.setCity(rs.getString("city"));
                user.setDistrict(rs.getString("district"));
                user.setWard(rs.getString("ward"));
                user.setRole(rs.getInt("UserRole"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }
    
    public Vector<User> getAllUser() {
        Vector<User> userList = new Vector<User>();
        String sql = "SELECT *"
                + "FROM [dbo].[Users]";
        
        ResultSet rs = this.getData(sql);
        
        try {
            while(rs.next()) {
                User user = new User();
                user.setId(rs.getInt("uid"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setUsername(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                user.setCity(rs.getString("city"));
                user.setDistrict(rs.getString("district"));
                user.setWard(rs.getString("ward"));
                user.setRole(rs.getInt("UserRole"));
                userList.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return  userList;
    }
    
    public void displayAll() {
        Iterator it = this.getAllUser().iterator();
        while (it.hasNext()) {
            System.out.println(it.next());
        }
    }

    public static void main(String[] args) {
        DAOUser dao = new DAOUser();
//        int n = dao.addUser(new User(2, "Nguyen", "Dung", "tridungvp", "abc123", "tridung@gmail.com", "Number 43", "Vinh Phuc", "Binh Xuyen", "Thien Ke", 1));
//        int n = dao.deleteUser(2);
//        if (n > 0) {
//            System.out.println("inserted");
//        }
//        System.out.println(dao.getUser(1002));
//        dao.displayAll();
    }
}

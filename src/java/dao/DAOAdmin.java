/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Admin;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DBConnect;

/**
 *
 * @author Asus
 */
public class DAOAdmin extends DBConnect {
    public Admin login(String username, String password) {
        Admin admin = new Admin();
        String sql = "SELECT *"
                + "  FROM [dbo].[Admin] WHERE Username = '" + username + "' AND Password = '" + password + "'";
        ResultSet rs = this.getData(sql);
        try {
            if (rs.next()) {
                admin.setUsername(rs.getString("Username"));
                admin.setPassword(rs.getString("Password"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return admin;
    }
    
    public static void main(String[] args) {
        DAOAdmin dao = new DAOAdmin();
        System.out.println(dao.login("dungntv1", "123"));
        
    }
}

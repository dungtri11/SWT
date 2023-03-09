/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Genre;
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
public class DAOGenre extends DBConnect{
    public int addGenre(Genre genre) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[genre]\n" +
"           ([genre_name]\n" +
"           ,[description]\n" +
"           ,[genre_image_url])\n" +
"     VALUES\n" +
"           (?\n" +
"           ,?\n" +
"           ,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, genre.getName());
            pre.setString(2, genre.getDescription());
            pre.setString(3, genre.getImage());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOGenre.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int updateGenre(Genre genre) {
        int n = 0;
        String sql = "UPDATE [dbo].[genre]\n" +
"   SET [genre_name] = ?\n" +
"      ,[description] = ?\n" +
"      ,[genre_image_url] = ?\n" +
" WHERE genre_id = " + genre.getId();
        
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, genre.getName());
            pre.setString(2, genre.getDescription());
            pre.setString(3, genre.getImage());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOGenre.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return n;
    }
    
    public int deleteGenre(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[genre]\n" +
"      WHERE genre_id = " + id;
        try {
            ResultSet rs = this.getData("SELECT * FROM [dbo].[books] WHERE genre_id = " + id);
            while (rs.next()) {
                DAOBook dao = new DAOBook();
                dao.deleteBook(rs.getInt("book_id"));
            }
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOGenre.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return n;
    }
    
    public Genre getGenre(int id) {
        Genre genre = new Genre();
        String sql = "SELECT * FROM [dbo].[genre] WHERE genre_id = " + id;
        ResultSet rs = this.getData(sql);
        
        try {
            if (rs.next()) {
                genre.setId(id);
                genre.setName(rs.getString("genre_name"));
                genre.setDescription(rs.getString("description"));
                genre.setImage(rs.getString("genre_image_url"));
            }
                
        } catch (SQLException ex) {
            Logger.getLogger(DAOGenre.class.getName()).log(Level.SEVERE, null, ex);
        }
        return genre;
    } 
    
    public Vector<Genre> getAllGenre() {
        Vector<Genre> listGenre = new Vector<Genre>();
        String sql = "SELECT * FROM [dbo].[genre]";
        ResultSet rs = this.getData(sql);
        try {
            while (rs.next()) {
                Genre genre = new Genre();
                genre.setId(rs.getInt("genre_id"));
                genre.setName(rs.getString("genre_name"));
                genre.setDescription(rs.getString("description"));
                genre.setImage(rs.getString("genre_image_url"));
                listGenre.add(genre);
            }
                
        } catch (SQLException ex) {
            Logger.getLogger(DAOGenre.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listGenre;
    }    
    
    public void displayAll() {
        Iterator it = this.getAllGenre().iterator();
        while (it.hasNext()) {
            System.out.println(it.next());
        }
    }
    public static void main(String[] args) {
        DAOGenre dao = new DAOGenre();
//        int n = dao.updateGenre(new Genre(1, "Comedy", "desc", "img"));
//        
//        if (n > 0) {
//            System.out.println("updated");
//        }
//        dao.displayAll();
    }
}

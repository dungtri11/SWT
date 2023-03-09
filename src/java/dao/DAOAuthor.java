/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Author;
import entity.Book;
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
public class DAOAuthor extends DBConnect{
    public int addAuthor(Author author) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[authors]\n" +
"           ([author_name]\n" +
"           ,[description]\n" +
"           ,[author_image_url])\n" +
"     VALUES\n" +
"           (?\n" +
"           ,?\n" +
"           ,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, author.getName());
            pre.setString(2, author.getDescription());
            pre.setString(3, author.getImage());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOAuthor.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int updateAuthor(Author author) {
        int n = 0;
        String sql = "UPDATE [dbo].[authors]\n" +
"   SET [author_name] = ?\n" +
"      ,[description] = ?\n" +
"      ,[author_image_url] = ?\n" +
" WHERE author_id = " + author.getId();
        
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, author.getName());
            pre.setString(2, author.getDescription());
            pre.setString(3, author.getImage());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOAuthor.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int deleteAuthor(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[authors]\n" +
"      WHERE author_id = " + id;
        try {
            ResultSet rs = this.getData("SELECT * FROM [dbo].[books] WHERE author_id = " + id);
            while (rs.next()) {
                DAOBook dao = new DAOBook();
                dao.deleteBook(rs.getInt("book_id"));
            }
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOAuthor.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return n;
    }
    
    public Author getAuthor(int id) {
        Author author = new Author();
        String sql = "SELECT * FROM [dbo].[authors] WHERE author_id = " + id;
        ResultSet rs = this.getData(sql);
        
        try {
            if (rs.next()) {
                author.setId(id);
                author.setName(rs.getString("author_name"));
                author.setDescription(rs.getString("description"));
                author.setImage(rs.getString("author_image_url"));
            }
                
        } catch (SQLException ex) {
            Logger.getLogger(DAOAuthor.class.getName()).log(Level.SEVERE, null, ex);
        }
        return author;
    }
    
    public Vector<Author> getAllAuthor() {
        Vector<Author> listAuthor = new Vector<Author>();
        String sql = "SELECT * FROM [dbo].[authors]";
        ResultSet rs = this.getData(sql);
        
        try {
            while (rs.next()) {
                Author author = new Author();
                author.setId(rs.getInt("author_id"));
                author.setName(rs.getString("author_name"));
                author.setDescription(rs.getString("description"));
                author.setImage(rs.getString("author_image_url"));
                listAuthor.add(author);
            }
                
        } catch (SQLException ex) {
            Logger.getLogger(DAOAuthor.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listAuthor;
    }
    
    public void displayAll() {
        Iterator it = this.getAllAuthor().iterator();
        while (it.hasNext()) {
            System.out.println(it.next());
        }
    }
    
    public static void main(String[] args) {
        DAOAuthor dao = new DAOAuthor();
//        int n = dao.updateAuthor(new Author(1, "Hemingway", "desc", "image"));
//        
//        if (n > 0) {
//            System.out.println("updated");
//        }
        dao.displayAll();
    }
}

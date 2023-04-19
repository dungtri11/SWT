/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

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
public class DAOBook extends DBConnect {

    public int addBook(Book book) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[books]\n"
                + "           ([title]\n"
                + "           ,[author_id]\n"
                + "           ,[genre_id]\n"
                + "           ,[price]\n"
                + "           ,[description]\n"
                + "           ,[cover_image_url])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, book.getTitle());
            pre.setInt(2, book.getAuthorId());
            pre.setInt(3, book.getGenreId());
            pre.setDouble(4, book.getPrice());
            pre.setString(5, book.getDescription());
            pre.setString(6, book.getImage());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int updateBook(Book book) {
        int n = 0;
        String sql = "UPDATE [dbo].[books]\n"
                + "   SET [title] = ?\n"
                + "      ,[author_id] = ?\n"
                + "      ,[genre_id] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[cover_image_url] = ?\n"
                + " WHERE book_id = " + book.getId();
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, book.getTitle());
            pre.setInt(2, book.getAuthorId());
            pre.setInt(3, book.getGenreId());
            pre.setDouble(4, book.getPrice());
            pre.setString(5, book.getDescription());
            pre.setString(6, book.getImage());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int deleteBook(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[books]\n"
                + "      WHERE book_id = " + id;
        try {
            ResultSet rs = this.getData("SELECT * FROM [order_items] WHERE book_id = " + id);
            while (rs.next()) {
                DAOOrderDetail dao = new DAOOrderDetail();
                dao.deleteOrderDetail(rs.getInt("order_item_id"));
            }
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Book getBook(int id) {
        Book book = new Book();
        String sql = "SELECT * FROM [dbo].[books] WHERE book_id = " + id;

        ResultSet rs = this.getData(sql);

        try {
            if (rs.next()) {
                book.setId(id);
                book.setTitle(rs.getString("title"));
                book.setAuthorId(rs.getInt("author_id"));
                book.setGenreId(rs.getInt("genre_id"));
                book.setPrice(rs.getDouble("price"));
                book.setDescription(rs.getString("description"));
                book.setImage(rs.getString("cover_image_url"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
        }

        return book;
    }

    public Vector<Book> getAllBook() {
        Vector<Book> listBook = new Vector<Book>();
        String sql = "SELECT * FROM [dbo].[books]";

        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt("book_id"));
                book.setTitle(rs.getString("title"));
                book.setAuthorId(rs.getInt("author_id"));
                book.setGenreId(rs.getInt("genre_id"));
                book.setPrice(rs.getDouble("price"));
                book.setDescription(rs.getString("description"));
                book.setImage(rs.getString("cover_image_url"));
                listBook.add(book);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listBook;
    }

    public Vector<Book> searchBook(String key, Integer author, Integer genre, String order, Double range) {
        Vector<Book> listBook = new Vector<Book>();
        if (order == null) {
            order = "";
        }
        String orderDB;
        switch (order) {
            case "price":
                orderDB = "ORDER BY price ASC";
                break;
            case "atoz":
                orderDB = "ORDER BY title ASC";
                break;
            default:
                orderDB = "";
                break;
        }
        String sql = "SELECT * FROM [dbo].[books] WHERE title LIKE \'%" + (key != null ? key : "") + "%\'"
                + (author != null ? "and author_id = " + author : "")
                + (genre != null ? "and genre_id = " + genre : "")
                + (range.doubleValue() != 0 ? "and price < " + range : "")
                + orderDB;

        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt("book_id"));
                book.setTitle(rs.getString("title"));
                book.setAuthorId(rs.getInt("author_id"));
                book.setGenreId(rs.getInt("genre_id"));
                book.setPrice(rs.getDouble("price"));
                book.setDescription(rs.getString("description"));
                book.setImage(rs.getString("cover_image_url"));
                listBook.add(book);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOBook.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listBook;
    }

    public Vector<Book> getTopRevenue() {
        Vector<Book> listRevenue = new Vector<Book>();
        String sql = "select top 3 book_id, sum(quantity*price) as 'Subtotal'\n"
                + "  from order_items\n"
                + "  group by book_id\n"
                + "  order by Subtotal desc";

        ResultSet rs = this.getData(sql);

        try {
            while (rs.next()) {
                Book book = this.getBook(rs.getInt("book_id"));
                listRevenue.add(book);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listRevenue;
    }

    public Vector<Book> getTopSeller() {
        Vector<Book> listSeller = new Vector<Book>();
        String sql = "select top 3 book_id, sum(quantity) as 'Trend'\n"
                + "  from order_items\n"
                + "  group by book_id\n"
                + "  order by Trend desc";
        ResultSet rs = this.getData(sql);
        try {
            while (rs.next()) {
                Book book = this.getBook(rs.getInt("book_id"));
                listSeller.add(book);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listSeller;
    }

    public void displayAll() {
        Iterator it = this.getTopSeller().iterator();
        while (it.hasNext()) {
            System.out.println(it.next());
        }
    }

    public static void main(String[] args) {
        DAOBook dao = new DAOBook();
//        int n = dao.addBook(new Book(1, "Old Man And The Sea", 1, 1, 14.99, "desc", "img"));
//        
//        if (n > 0) {
//            System.out.println("insert");
//        }
        dao.displayAll();
    }
}

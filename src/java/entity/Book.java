/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Asus
 */
public class Book {
    private int id;
    private String title;
    private int authorId, genreId;
    private double price;
    private String description;
    private String image;

    public Book() {
    }

    public Book(int id, String title, int authorId, int genreId, double price, String description, String image) {
        this.id = id;
        this.title = title;
        this.authorId = authorId;
        this.genreId = genreId;
        this.price = price;
        this.description = description;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public int getGenreId() {
        return genreId;
    }

    public void setGenreId(int genreId) {
        this.genreId = genreId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Book{" + "id=" + id + ", title=" + title + ", authorId=" + authorId + ", genreId=" + genreId + ", price=" + price + ", description=" + description + ", image=" + image + '}';
    }

    
    
    
}

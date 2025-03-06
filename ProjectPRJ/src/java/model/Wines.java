package model;

public class Wines {
    private int wine_id;
    private String name;
    private int category_id;
    private String country;
    private int year;
    private double price;
    private int stock_quantity;
    private String image_url;
    private String description;
    private int supplier_id;

    // Default constructor
    public Wines() {
    }

    // Parameterized constructor
    public Wines(int wine_id, String name, int category_id, String country, int year, double price, 
                 int stock_quantity, String image_url, String description, int supplier_id) {
        this.wine_id = wine_id;
        this.name = name;
        this.category_id = category_id;
        this.country = country;
        this.year = year;
        this.price = price;
        this.stock_quantity = stock_quantity;
        this.image_url = image_url;
        this.description = description;
        this.supplier_id = supplier_id;
    }

    // Getters and setters
    public int getWine_id() {
        return wine_id;
    }
    public void setWine_id(int wine_id) {
        this.wine_id = wine_id;
    }
    
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    
    public int getCategory_id() {
        return category_id;
    }
    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }
    
    public String getCountry() {
        return country;
    }
    public void setCountry(String country) {
        this.country = country;
    }
    
    public int getYear() {
        return year;
    }
    public void setYear(int year) {
        this.year = year;
    }
    
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }
    
    public int getStock_quantity() {
        return stock_quantity;
    }
    public void setStock_quantity(int stock_quantity) {
        this.stock_quantity = stock_quantity;
    }
    
    public String getImage_url() {
        return image_url;
    }
    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }
    
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    
    public int getSupplier_id() {
        return supplier_id;
    }
    public void setSupplier_id(int supplier_id) {
        this.supplier_id = supplier_id;
    }
    
    @Override
    public String toString() {
        return "Wines{" +
                "wine_id=" + wine_id +
                ", name=" + name +
                ", category_id=" + category_id +
                ", country=" + country +
                ", year=" + year +
                ", price=" + price +
                ", stock_quantity=" + stock_quantity +
                ", image_url=" + image_url +
                ", description=" + description +
                ", supplier_id=" + supplier_id +
                '}';
    }
}

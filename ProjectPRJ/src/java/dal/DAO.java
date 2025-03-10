/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Wines;
import model.Customers;
import utils.DBContext;

/**
 *
 * @author HA DUC
 */
public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Wines> getAllWines() {
        List<Wines> list = new ArrayList<>();
        String sql = "select * from Wines";
        try {
            conn = new DBContext().getConnection();
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Wines(
                        rs.getInt("wine_id"), // wine_id as int
                        rs.getString("name"), // name as String
                        rs.getInt("category_id"), // category_id as int
                        rs.getString("country"), // country as String
                        rs.getInt("year"), // year as int
                        rs.getDouble("price"), // price as double
                        rs.getInt("stock_quantity"), // stock_quantity as int
                        rs.getString("image_url"), // image_url as String
                        rs.getString("description"), // description as String
                        rs.getInt("supplier_id") // supplier_id as int
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Categories";
        try {
            conn = new DBContext().getConnection();
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Wines> getWinesByCID(String cid) {
        List<Wines> list = new ArrayList<>();
        String sql = "SELECT * FROM Wines WHERE category_id = ?;";
        try {
            conn = new DBContext().getConnection();
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, cid);  // Set the parameter BEFORE executing the query.
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Wines(
                        rs.getInt("wine_id"), // wine_id as int
                        rs.getString("name"), // name as String
                        rs.getInt("category_id"), // category_id as int
                        rs.getString("country"), // country as String
                        rs.getInt("year"), // year as int
                        rs.getDouble("price"), // price as double
                        rs.getInt("stock_quantity"), // stock_quantity as int
                        rs.getString("image_url"), // image_url as String
                        rs.getString("description"), // description as String
                        rs.getInt("supplier_id") // supplier_id as int
                ));
            }
            rs.close();
            st.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Wines getWinesByID(String id) {
        Wines wine = null;
        String sql = "SELECT wine_id, name, category_id, country, year, price, stock_quantity, image_url, description, supplier_id "
                + "FROM Wines WHERE wine_id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            // Con  vert the String id to an int before setting the parameter
            ps.setInt(1, Integer.parseInt(id));
            rs = ps.executeQuery();
            if (rs.next()) {
                wine = new Wines(
                        rs.getInt("wine_id"),
                        rs.getString("name"),
                        rs.getInt("category_id"),
                        rs.getString("country"),
                        rs.getInt("year"),
                        rs.getDouble("price"),
                        rs.getInt("stock_quantity"),
                        rs.getString("image_url"),
                        rs.getString("description"),
                        rs.getInt("supplier_id")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NumberFormatException ne) {
            System.err.println("The provided wine_id is not a valid number: " + id);
            ne.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return wine;

    }

    public Customers login(String username, String password) {
        String query = "select * from Customers\n"
                + "where email = ?\n"
                + "and password_hash = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Customers(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDate(7));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public Customers checkCustomersExists(String username) {
        String query = "select * from Customers\n"
                + "where email = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()){
                return new Customers(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDate(7));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public void register(String username, String password, String telephone) {
        String query = "insert into Customers(email,password_hash,phone,address,created_at) \n"
                + "values(?,?,?,null,getdate())";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, telephone);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
//    public static void main(String[] args) {
//        DAO dao = new DAO();

//        List<Wines> wineList = dao.getWinesByCID("1");
//        for (Wines wines : wineList) {
//            System.out.println(wines);
//        }
//    } 
}

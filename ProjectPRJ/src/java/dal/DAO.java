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
import model.Accounts;
import dal.DBContext;

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
            st.setString(1, cid); // Set the parameter BEFORE executing the query.
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
            // Con vert the String id to an int before setting the parameter
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
                        rs.getInt("supplier_id"));
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
        System.out.println("Returning wine: " + wine);
        return wine;

    }

    public Accounts login(String username, String password) {
        String query = "select * from Accounts\n"
                + "where email = ?\n"
                + "and password_hash = ?";
        try {
            System.out.println("Connecting to database for login...");
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            System.out.println("Executing query: " + ps);
            rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println("Login successful for username: " + username);
                return new Accounts(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5));
            }
            System.out.println("Login failed for username: " + username);
        } catch (SQLException e) {
            System.out.println("SQL Exception during login: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                // Handle closing errors
                ex.printStackTrace();
            }
        }
        return null;
    }

    public Accounts checkAccountExists(String username) {
        String query = "select * from Accounts\n"
                + "where email = ?";
        try {
            System.out.println("Checking if account exists for username: " + username);
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println("Account found for username: " + username);
                return new Accounts(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5));
            }
            System.out.println("No account found for username: " + username);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                // Handle closing errors
                ex.printStackTrace();
            }
        }
        return null;
    }

    public void register(String username, String password, String telephone) {
        String Accquery = "INSERT INTO Accounts (email, password_hash, phone, created_at)\n"
                + "VALUES (?, ?, ?, GETDATE());";
        String Cusquery = "INSERT INTO Customers (email, password_hash, phone, created_at)\n"
                + "VALUES (?, ?, ?, GETDATE());";
        try {
            System.out.println("Connecting to database...");
            conn = DBContext.getConnection();
            PreparedStatement ps1 = conn.prepareStatement(Accquery);
            PreparedStatement ps2 = conn.prepareStatement(Cusquery);
            ps1.setString(1, username);
            ps1.setString(2, password);
            ps1.setString(3, telephone);
            ps2.setString(1, username);
            ps2.setString(2, password);
            ps2.setString(3, telephone);
            System.out.println("Executing query: " + ps);
            ps1.executeUpdate();
            ps2.executeUpdate();
            System.out.println("User registered successfully.");
        } catch (SQLException e) {
            System.out.println("Error during registration: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                // Handle closing errors
                ex.printStackTrace();
            }
        }
    }

    public void changePassword(String username, String newPassword) {
        String Cusquery = "UPDATE Customers\n"
                + "SET password_hash = ?\n"
                + "WHERE email = ?";
        String Accquery = "UPDATE Accounts\n"
                + "SET password_hash = ?\n"
                + "WHERE email = ?";
        try {
            System.out.println("Connecting to database...");
            conn = DBContext.getConnection();
            PreparedStatement ps1 = conn.prepareStatement(Accquery);
            PreparedStatement ps2 = conn.prepareStatement(Cusquery);
            ps2.setString(1, newPassword);
            ps2.setString(2, username);
            ps1.setString(1, newPassword);
            ps1.setString(2, username);
            System.out.println("Executing query: " + ps);
            ps1.executeUpdate();
            ps2.executeUpdate();
            System.out.println("Password changed successfully.");
        } catch (SQLException e) {
            System.out.println("Error during password change: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                // Handle closing errors
                ex.printStackTrace();
            }
        }
    }
}

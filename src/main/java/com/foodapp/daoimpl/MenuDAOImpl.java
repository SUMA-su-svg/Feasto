package com.foodapp.daoimpl;

import java.sql.*;
import java.util.*;

import com.foodapp.dao.MenuDAO;
import com.foodapp.model.Menu;
import com.foodapp.util.DBConnection;

public class MenuDAOImpl implements MenuDAO {

    @Override
    public List<Menu> getMenuByRestaurantId(int restaurantId) {

        List<Menu> list = new ArrayList<>();

        try {

            String query = "SELECT * FROM menu WHERE restaurant_id=?";

            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Menu m = new Menu();

                m.setMenuId(rs.getInt("menu_id"));
                m.setRestaurantId(rs.getInt("restaurant_id"));
                m.setItemName(rs.getString("item_name"));
                m.setDescription(rs.getString("description"));
                m.setPrice(rs.getDouble("price"));
                m.setImage(rs.getString("image"));
                m.setAvailable(rs.getBoolean("is_available"));

                list.add(m);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public Menu getMenuById(int menuId) {

        Menu m = null;

        try {

            String query = "SELECT * FROM menu WHERE menu_id=?";

            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, menuId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                m = new Menu();

                m.setMenuId(rs.getInt("menu_id"));
                m.setRestaurantId(rs.getInt("restaurant_id"));
                m.setItemName(rs.getString("item_name"));
                m.setDescription(rs.getString("description"));
                m.setPrice(rs.getDouble("price"));
                m.setImage(rs.getString("image"));
                m.setAvailable(rs.getBoolean("is_available"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return m;
    }
}
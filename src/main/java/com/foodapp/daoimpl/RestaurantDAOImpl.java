package com.foodapp.daoimpl;

import java.sql.*;
import java.util.*;

import com.foodapp.dao.RestaurantDAO;
import com.foodapp.model.Restaurant;
import com.foodapp.util.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {


    public List<Restaurant> getAllRestaurants() {

        List<Restaurant> list = new ArrayList<>();

        try {

            String query = "SELECT * FROM restaurants";

            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Restaurant r = new Restaurant();

                r.setRestaurantId(rs.getInt("restaurant_id"));
                r.setName(rs.getString("name"));
                r.setAddress(rs.getString("address"));
                r.setPhone(rs.getString("phone"));
                r.setRating(rs.getDouble("rating"));
                r.setImage(rs.getString("image"));

                list.add(r);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Restaurant getRestaurantById(int id) {

        Restaurant r = null;

        try {

            String query = "SELECT * FROM restaurants WHERE restaurant_id=?";

            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1,id);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                r = new Restaurant();

                r.setRestaurantId(rs.getInt("restaurant_id"));
                r.setName(rs.getString("name"));

            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return r;
    }
}
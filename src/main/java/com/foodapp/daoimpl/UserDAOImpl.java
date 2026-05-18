package com.foodapp.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.foodapp.dao.UserDAO;
import com.foodapp.model.User;
import com.foodapp.util.DBConnection;

public class UserDAOImpl implements UserDAO {


	public void registerUser(User user) {

		try {

			String query = "INSERT INTO users(name,email,password,phone,address) VALUES(?,?,?,?,?)";
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getPhone());
			ps.setString(5, user.getAddress());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateUser(User user) {

	    try {

	        String query = "UPDATE users SET name=?, email=?, phone=?, address=? WHERE user_id=?";
	        Connection con = DBConnection.getConnection();

	        PreparedStatement ps = con.prepareStatement(query);

	        ps.setString(1, user.getName());
	        ps.setString(2, user.getEmail());
	        ps.setString(3, user.getPhone());
	        ps.setString(4, user.getAddress());
	        ps.setInt(5, user.getUserId());

	        ps.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	public User loginUser(String email, String password) {

		User user = null;

		try {

			String query = "SELECT * FROM users WHERE email=? AND password=?";
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				user = new User();
				user.setUserId(rs.getInt("user_id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));  
				user.setPhone(rs.getString("phone"));         
				user.setAddress(rs.getString("address"));  

			
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}
}
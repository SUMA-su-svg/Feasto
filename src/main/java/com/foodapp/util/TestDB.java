package com.foodapp.util;

import java.util.List;

import com.foodapp.dao.RestaurantDAO;
import com.foodapp.daoimpl.RestaurantDAOImpl;
import com.foodapp.model.Restaurant;

public class TestDB {

	public static void main(String[] args) {
		System.out.println(DBConnection.getConnection());
		
		RestaurantDAO rdao = new RestaurantDAOImpl();
		List<Restaurant> rlist = rdao.getAllRestaurants();
		
		for(Restaurant r : rlist) {
			System.out.println(r.getRestaurantId());
			System.out.println(r.getName());
		}
	}

}

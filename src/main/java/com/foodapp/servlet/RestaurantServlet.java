package com.foodapp.servlet;

import jakarta.servlet.http.HttpServlet;

import java.io.IOException;
import java.util.List;

import com.foodapp.daoimpl.RestaurantDAOImpl;
import com.foodapp.daoimpl.UserDAOImpl;
import com.foodapp.model.Restaurant;
import com.foodapp.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/restaurants")
public class RestaurantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RestaurantDAOImpl dao = new RestaurantDAOImpl();
		List<Restaurant> restaurants = dao.getAllRestaurants();

		request.setAttribute("restaurants", restaurants);

		RequestDispatcher requestDespatcher = request.getRequestDispatcher("restaurants.jsp");
		requestDespatcher.forward(request, response);
	}
}
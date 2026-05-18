package com.foodapp.servlet;

import java.io.IOException;
import java.util.List;

import com.foodapp.daoimpl.MenuDAOImpl;
import com.foodapp.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	//System.out.println("MenuServlet HIT");
        // 1️⃣ Get restaurantId from URL
        String restaurantIdStr = request.getParameter("restaurantId");

        if (restaurantIdStr == null) {
            response.sendRedirect("restaurants");
            return;
        }

        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));

        // 2️⃣ Call DAO to fetch menu items
        MenuDAOImpl dao = new MenuDAOImpl();
        List<Menu> menuList = dao.getMenuByRestaurantId(restaurantId);

        // 3️⃣ Set data to request
        request.setAttribute("menuList", menuList);
        request.setAttribute("restaurantId", restaurantId);

        // 4️⃣ Forward to JSP
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }
}
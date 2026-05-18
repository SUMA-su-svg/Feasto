package com.foodapp.servlet;

import java.io.IOException;
import java.util.List;

import com.foodapp.model.CartItem;
import com.foodapp.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 System.out.println("Checkout servlet called");  // 🔥 ADD THIS
        HttpSession session = request.getSession(false);

        // 🔐 LOGIN CHECK
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 🛒 CART CHECK
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }
}
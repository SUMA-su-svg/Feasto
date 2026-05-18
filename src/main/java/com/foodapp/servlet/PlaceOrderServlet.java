package com.foodapp.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String address = request.getParameter("address");
        String payment = request.getParameter("paymentMode");

        // 🔥 Save order logic (DB later)
        // For now just simulate

        // ✅ CLEAR CART
        session.removeAttribute("cart");
        session.removeAttribute("restaurantId");

        request.setAttribute("address", address);
        request.setAttribute("payment", payment);

        request.getRequestDispatcher("orderSuccess.jsp").forward(request, response);
    }
}
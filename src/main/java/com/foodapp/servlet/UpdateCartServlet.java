package com.foodapp.servlet;

import java.io.IOException;
import java.util.Map;

import com.foodapp.model.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/updateCart")
public class UpdateCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart =
                (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart != null && cart.containsKey(id)) {

            CartItem item = cart.get(id);

            if ("increase".equals(action)) {
                item.setQuantity(item.getQuantity() + 1);

            } else if ("decrease".equals(action)) {
                int qty = item.getQuantity() - 1;
                if (qty <= 0) {
                    cart.remove(id);
                } else {
                    item.setQuantity(qty);
                }

            } else if ("remove".equals(action)) {
                cart.remove(id);
            }
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
    }
}
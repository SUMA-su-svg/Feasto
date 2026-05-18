package com.foodapp.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.model.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        Integer sessionRestaurantId = (Integer) session.getAttribute("restaurantId");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        String action = request.getParameter("action");

        switch (action) {
            case "add":
                addItem(request, session, cart, sessionRestaurantId);
                break;

            case "update":
                updateItem(request, cart);
                break;

            case "delete":
                deleteItem(request, session, cart);
                break;

            default:
                response.sendRedirect("menu");
                return;
        }

        session.setAttribute("cart", cart);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    // ================= ADD METHOD =================
    private void addItem(HttpServletRequest request, HttpSession session,
                         List<CartItem> cart, Integer sessionRestaurantId)
            throws ServletException, IOException {

        String itemIdStr = request.getParameter("itemId");
        String priceStr = request.getParameter("price");
        String restaurantIdStr = request.getParameter("restaurantId");
        String url = request.getParameter("imageUrl");
        if (itemIdStr == null || priceStr == null || restaurantIdStr == null) {
            return;
        }

        int itemId = Integer.parseInt(itemIdStr);
        String itemName = request.getParameter("itemName");
        double price = Double.parseDouble(priceStr);
        int restaurantId = Integer.parseInt(restaurantIdStr);
       

        // 🚨 Restaurant validation
        if (sessionRestaurantId != null && sessionRestaurantId != restaurantId) {
            request.setAttribute("message",
                    "⚠️ Please clear cart before adding items from another restaurant!");
            return;
        }

        boolean found = false;

        for (CartItem item : cart) {
            if (item.getItemId() == itemId) {
                item.setQuantity(item.getQuantity() + 1);
                if (item.getImageUrl() == null) {
                    item.setImageUrl(url);
                }

                found = true;
                break;
            }
        }

        if (!found) {
        	cart.add(new CartItem(restaurantId, itemId, itemName, price, 1, url));
        }

        session.setAttribute("restaurantId", restaurantId);
        request.setAttribute("message", "✅ Item added to cart!");
    }

    // ================= UPDATE METHOD =================
    private void updateItem(HttpServletRequest request, List<CartItem> cart) {

        String itemIdStr = request.getParameter("itemId");
        String quantityStr = request.getParameter("quantity");

        if (itemIdStr == null || quantityStr == null) {
            return;
        }

        int itemId = Integer.parseInt(itemIdStr);
        int quantity = Integer.parseInt(quantityStr);

        for (CartItem item : cart) {
            if (item.getItemId() == itemId) {
                item.setQuantity(quantity);
            }
        }
    }

    // ================= DELETE METHOD =================
    private void deleteItem(HttpServletRequest request, HttpSession session,
                            List<CartItem> cart) {

        String itemIdStr = request.getParameter("itemId");

        if (itemIdStr == null) {
            return;
        }

        int itemId = Integer.parseInt(itemIdStr);

        cart.removeIf(item -> item.getItemId() == itemId);

        // If cart empty → remove restaurant lock
        if (cart.isEmpty()) {
            session.removeAttribute("restaurantId");
        }
    }
}
package com.foodapp.servlet;

import java.io.IOException;

import com.foodapp.daoimpl.UserDAOImpl;
import com.foodapp.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {


protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String email = request.getParameter("email");
    String password = request.getParameter("password");

    UserDAOImpl dao = new UserDAOImpl();

    // 🔥 Fetch full user from DB
    User user = dao.loginUser(email, password);

    if (user != null) {

        // ✅ DEBUG (check if values are coming)
        System.out.println("User Login Success");
        System.out.println("Name: " + user.getName());
        System.out.println("Email: " + user.getEmail());
        System.out.println("Phone: " + user.getPhone());
        System.out.println("Address: " + user.getAddress());

        // 🔐 Create session
        HttpSession session = request.getSession();
        session.setAttribute("user", user);   // 🔥 store FULL object

        // ✅ Redirect properly
        response.sendRedirect(request.getContextPath() + "/restaurants");

    } else {

        System.out.println("Login Failed");

        response.sendRedirect("login.jsp?error=1");
    }
}

}

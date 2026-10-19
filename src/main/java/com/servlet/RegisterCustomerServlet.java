package com.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.db.DBConnection;

public class RegisterCustomerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");

        try {
            Connection con = DBConnection.getConnection();

            // 🔥 Check if email already exists
            PreparedStatement check = con.prepareStatement(
                "SELECT * FROM customers WHERE email=?"
            );
            check.setString(1, email);
            ResultSet rs = check.executeQuery();

            if(rs.next()){
                // Email already exists
                response.getWriter().println("<h3>Email already registered!</h3>");
                return;
            }

            // Insert data
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO customers(name,email,password,phone) VALUES(?,?,?,?)"
            );

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, phone);

            ps.executeUpdate();

            // Redirect to login
            response.sendRedirect("customerLogin.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
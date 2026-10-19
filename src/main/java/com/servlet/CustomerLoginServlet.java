package com.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.db.DBConnection;

public class CustomerLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("username"); 
        String password = request.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM customers WHERE email=? AND password=?"
            );

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            	
                HttpSession session = request.getSession();
                session.setAttribute("customerName", rs.getString("name"));
                session.setAttribute("customerId", rs.getInt("id"));

                response.sendRedirect("customerDashboard.jsp");

            } else {
            	
                response.getWriter().println(
                    "<h3 style='color:red;text-align:center;'>Invalid Email or Password</h3>"
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
package com.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.*;
import java.sql.*;
import com.db.DBConnection;

public class AdminLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM admin WHERE username=? AND password=?"
            );

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                // ✅ SESSION CREATE
                HttpSession session = request.getSession();
                session.setAttribute("admin", username);

                // redirect to admin dashboard
                response.sendRedirect("adminDashboard.jsp");

            } else {

                // ❌ Invalid login
                response.getWriter().println(
                    "<h3 style='color:red;text-align:center;'>Invalid Admin Credentials</h3>"
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
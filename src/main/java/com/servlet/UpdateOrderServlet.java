package com.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.*;
import java.sql.*;
import com.db.DBConnection;

public class UpdateOrderServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");

        try{
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "UPDATE orders SET status=? WHERE id=?"
            );

            ps.setString(1, status);
            ps.setInt(2, id);

            ps.executeUpdate();

            response.sendRedirect("viewRequests.jsp");

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
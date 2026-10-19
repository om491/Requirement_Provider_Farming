package com.servlet;

	import java.io.*;
	import jakarta.servlet.*;
	import jakarta.servlet.http.*;
	import java.sql.*;
	import com.db.*;

	public class DeleteOrderServlet extends HttpServlet{

		private static final long serialVersionUID = 1L;

		protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        int id = Integer.parseInt(request.getParameter("id"));

	        try{
	            Connection con = DBConnection.getConnection();

	            PreparedStatement ps = con.prepareStatement(
	                "DELETE FROM orders WHERE id=?"
	            );

	            ps.setInt(1, id);
	            ps.executeUpdate();

	            response.sendRedirect("customerDashboard.jsp");

	        }catch(Exception e){
	            e.printStackTrace();
	        }
	    }
	}
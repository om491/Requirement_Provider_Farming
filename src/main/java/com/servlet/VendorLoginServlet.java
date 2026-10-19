package com.servlet;

import java.io.*;
import java.sql.*;
import com.db.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class VendorLoginServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

		protected void doPost(HttpServletRequest req, HttpServletResponse res) 
	    throws ServletException, IOException {

	        String email = req.getParameter("email");
	        String password = req.getParameter("password");

	        try{
	            Connection con = DBConnection.getConnection();

	            PreparedStatement ps = con.prepareStatement(
	                "SELECT * FROM vendor WHERE email=? AND password=?"
	            );

	            ps.setString(1,email);
	            ps.setString(2,password);

	            ResultSet rs = ps.executeQuery();

	            if(rs.next()){
	                HttpSession session = req.getSession();
	                session.setAttribute("user", email);

	                res.sendRedirect("vendorDashboard.jsp");
	            }else{
	                res.getWriter().println("<h3 style='color:red;text-align:center;'>Invalid Login</h3>");
	            }

	        }catch(Exception e){
	            e.printStackTrace();
	        }
	    }
	}


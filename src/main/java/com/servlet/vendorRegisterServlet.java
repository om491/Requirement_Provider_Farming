package com.servlet;
import java.io.*;
import java.sql.*;
import com.db.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class vendorRegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

		protected void doPost(HttpServletRequest req, HttpServletResponse res) 
	    throws ServletException, IOException {

	        String name = req.getParameter("name");
	        String email = req.getParameter("email");
	        String mobile = req.getParameter("mobile");
	        String password = req.getParameter("password");
	        String village = req.getParameter("village");

	        try{
	            Connection con = DBConnection.getConnection();

	            PreparedStatement ps = con.prepareStatement(
	                "INSERT INTO vendor(name,email,mobile,password,village) VALUES(?,?,?,?,?)"
	            );

	            ps.setString(1,name);
	            ps.setString(2,email);
	            ps.setString(3,mobile);
	            ps.setString(4,password);
	            ps.setString(5,village);

	            ps.executeUpdate();
	            res.sendRedirect("vendorLogin.jsp");

	        }catch(Exception e){
	            e.printStackTrace();
	        }
	    }
	}


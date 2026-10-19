package com.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.db.DBConnection;

public class PlaceOrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        int pid = Integer.parseInt(request.getParameter("product_id"));
        int qty = Integer.parseInt(request.getParameter("qty"));

        try {
            Connection con = DBConnection.getConnection();

            // ✅ GET PRICE FROM DB
            double price = 0;
            PreparedStatement ps1 = con.prepareStatement(
                "SELECT price FROM products WHERE id=?"
            );
            ps1.setInt(1, pid);
            ResultSet rs = ps1.executeQuery();

            if(rs.next()){
                price = rs.getDouble("price");
            }

            // ✅ CALCULATE TOTAL (NO ERROR NOW)
            double total = price * qty;

            // ✅ INSERT ORDER
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO orders(product_id, quantity, total, status) VALUES(?,?,?,?)",
                Statement.RETURN_GENERATED_KEYS
            );

            ps.setInt(1, pid);
            ps.setInt(2, qty);
            ps.setDouble(3, total);
            ps.setString(4, "Paid");

            ps.executeUpdate();

            // GET ORDER ID
            ResultSet rs2 = ps.getGeneratedKeys();
            int orderId = 0;

            if(rs2.next()){
                orderId = rs2.getInt(1);
            }

            // ✅ REDIRECT
            response.sendRedirect("bill.jsp?orderId=" + orderId);

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
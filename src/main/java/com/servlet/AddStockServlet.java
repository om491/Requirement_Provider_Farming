package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.db.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddStockServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {

        String product = req.getParameter("product");
        String category = req.getParameter("category");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        int price = Integer.parseInt(req.getParameter("price"));
        String description = req.getParameter("description");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO stock(product, category, quantity, price, description) VALUES(?,?,?,?,?)"
            );

            ps.setString(1, product);
            ps.setString(2, category);
            ps.setInt(3, quantity);
            ps.setInt(4, price);
            ps.setString(5, description);

            ps.executeUpdate();

            res.sendRedirect("vendorStockRegistration.jsp?success=1");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
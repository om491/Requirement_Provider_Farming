package com.servlet;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import java.sql.*;
import com.db.DBConnection;

@MultipartConfig
public class UploadProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Part file = request.getPart("image");

        String fileName = System.currentTimeMillis() + "_" + file.getSubmittedFileName();

        // ✅ IMPORTANT FIX (project images folder)
        String uploadPath = getServletContext().getRealPath("") + File.separator + "images";

        File dir = new File(uploadPath);
        if (!dir.exists()) dir.mkdirs();

        // save file
        file.write(uploadPath + File.separator + fileName);

        // DB path
        String imagePath = "images/" + fileName;

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO products(name,price,quantity,image) VALUES(?,?,?,?)"
            );

            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setInt(3, quantity);
            ps.setString(4, imagePath);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("adminDashboard.jsp");
    }
}
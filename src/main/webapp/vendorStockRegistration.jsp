<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Farming Stock</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
    background: linear-gradient(to right,#11998e,#38ef7d);
    font-family: 'Segoe UI';
}

.stock-box {
    background: white;
    padding: 30px;
    border-radius: 20px;
    margin-top: 50px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.3);
}

h2 {
    text-align: center;
    color: #2e7d32;
}

.btn-custom {
    background: #2e7d32;
    color: white;
}
</style>
</head>

<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="stock-box">
                <h2>🌾 Add Farming Stock</h2>

                <!-- SUCCESS MESSAGE -->
                <% if(request.getParameter("success") != null){ %>
                    <div class="alert alert-success text-center">
                        Stock Added Successfully ✅
                    </div>
                <% } %>

                <!-- ADD STOCK FORM -->
                <form action="<%=request.getContextPath()%>/AddStockServlet" method="post">
                    <div class="mb-3">
                        <label>Product Name</label>
                        <input type="text" name="product" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label>Category</label>
                        <select name="category" class="form-control" required>
                            <option>Seeds</option>
                            <option>Fertilizers</option>
                            <option>Pesticides</option>
                            <option>Tools</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label>Quantity</label>
                        <input type="number" name="quantity" class="form-control" min="1" required>
                    </div>

                    <div class="mb-3">
                        <label>Price (₹)</label>
                        <input type="number" name="price" class="form-control" min="1" required>
                    </div>

                    <div class="mb-3">
                        <label>Description</label>
                        <textarea name="description" class="form-control"></textarea>
                    </div>

                    <button class="btn btn-custom w-100">Add Stock</button>
                </form>

                <br>
                <a href="<%=request.getContextPath()%>/vendorDashboard.jsp" class="btn btn-secondary w-100">
                    ⬅ Back to Dashboard
                </a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
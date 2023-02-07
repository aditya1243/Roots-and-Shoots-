<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not logged in !! Login First to access checkout");
        response.sendRedirect("login.jsp");
        return;
    }


%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>

        <%@include file="components/common_css_js.jsp" %>


    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container">
            
            <div class="row mt-5">

                <div class="col-md-6">

                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center">Your Select Products</h3>
                            <div class="cart-body">

                            </div> 
                        </div>
                    </div>

                </div>

                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center">Your Details for order</h3>
                            <form>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input value="<%= user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input value="<%= user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Contact No</label>
                                    <input value="<%= user.getUserPhone()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter contact no">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Shipping Address</label>
                                    <textarea value="<%= user.getUserAddress()%>"class="form-control" id="exampleFormControlTextarea1" placeholder="Enter your Address" rows="3"></textarea>
                                </div>

                                <div class="container text-center">
                                    <button> <a href="payment.jsp" class="btn btn-outline-success">Proceed to payment</a></button>
                                    <button> <a href="product.jsp" class="btn btn-outline-primary">Continue Shopping</a></button>
                                </div>

                            </form>



                        </div>
                    </div>



                </div>

            </div>
        </div>

                                
                                
                                
        <%@include file="components/common_modals.jsp" %>
        
        <!-- Add Product js file -->
        <script src="addProduct.js"></script>
        
    </body>
</html>

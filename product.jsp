<%@page import="com.ecommerce.nursery.helper.Helper"%>
<%@page import="com.ecommerce.nursery.entity.Category"%>
<%@page import="com.ecommerce.nursery.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.nursery.entity.Product"%>
<%@page import="com.ecommerce.nursery.dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ecommerce.nursery.helper.FactoryProvider" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Page</title>
        
        <!--Bootstrap 4 link-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        <!--Product css file-->
        <link rel="stylesheet" href="css/product.css">
        
        
        
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        
        
        <%@include file="components/navbar.jsp" %>
        
        <!--All products-->
        <div class="container-fluid">

            <div class="row mt-5 mx-10">

                <%

                    String cat = request.getParameter("category");
                    //  out.println(cat);
                    ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> plist = null;

                    if (cat == null || cat.trim().equals("all")) {
                        plist = pdao.getAllProducts();
                    } else {

                        int cid = Integer.parseInt(cat.trim());
                        plist = pdao.getAllProductsById(cid);
                    }
                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategories();


                %>
                <!--Show Categories-->
                <div class="col-md-3">

                    <div class="list-group mt-4 text-center">

                        <a href="product.jsp?category=all" class="list-group-item list-group-item-action "> All Products </a>



                        <%  for (Category c : clist) {
                        %>
                        <a href="product.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action "><%= c.getCategoryTitle()%></a> 

                        <%  }
                        %>

                    </div><!-- list view div -->
                    
                    
                </div>

                <!--Show Products-->
                <div class="col-md-8">

                    <!--row-->
                    <div class="row mt-4">

                        <!--col:12-->
                        <div class="col-md-12">

                            <div class="card-columns">

                                <!--traversing products-->

                                <%
                                    for (Product p : plist) {

                                %>
                                <!--product card-->
                                <div class="card">
                                    <div class="container text-center">
                                        <span class="discount">- <%= p.getpDiscount()%>%</span>

                                        <!--                            <div class="icons">
                                                                        <a href="#" class="fas fa-heart"></a>
                                                                    </div>-->

                                        <img class="card-img-top m-2" src="images/products/<%= p.getpPhoto()%>" style="max-height: 200px; max-width: 100%; width: auto;"  alt="Card image cap">

                                    </div>

                                    <div class="card-body">

                                        <h3 class="card-title text-center"><%= p.getpName()%></h3>
                                        <p class="card-text text-center">

                                            <%= Helper.get10Words(p.getpDesc())%>

                                        </p>
                                    </div>

                                    <div class="card-footer text-center">

                                        <div class="quantity">
                                            <span> Quantity : </span>
                                            <input id="pqty" name="qty" type="number" min="1" max="100" value="1">
                                        </div>

                                        <div class="price text-center">&#8377 <%= p.getPriceAfterApplyingDiscount()%>/- <span class="text-secondary discount-label"> &#8377 <%= p.getpPrice()%></span></div>

                                        <a class="btn" style="display: inline-block;margin-top: 1rem;width: 80%; padding:.10rem 3rem;background:var(--green);color:#fff;font-size: 1.7rem;cursor: pointer;" onclick="add_to_cart(<%= p.getpId()%> , '<%= p.getpName()%>' ,<%= p.getPriceAfterApplyingDiscount() %>)" >Add to Cart</a>

                                    </div>            

                                </div>

                                <%
                                    }
                                    if (plist.size() == 0) {

                                        out.println("<h3>No Product in this category !!</h3>");

                                    }
                                %>
                            </div> 

                        </div>


                    </div>

                </div>




            </div>

           <!--End all products-->
        </div>
                            
                            
                            
                            
                            
               
<!--Common modal-->
<%@include file="components/common_modals.jsp" %>
             
        <!-- custom js file link  -->
        <script src="script.js"></script>
        
        <!--Add Product js file-->
        <script src="addProduct.js"></script>
        
    </body>

</html>
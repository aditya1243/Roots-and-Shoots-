<%@page import="java.util.Map"%>
<%@page import="com.ecommerce.nursery.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.nursery.entity.Category"%>
<%@page import="com.ecommerce.nursery.entity.User"%>
<%@page import="com.ecommerce.nursery.helper.FactoryProvider" %>
<%@page import="com.ecommerce.nursery.helper.Helper" %>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not logged in !! Login First");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("Normal")) {

            session.setAttribute("message", "You are not admin !! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }

%>
<%
                            
                                CategoryDao cdao= new CategoryDao(FactoryProvider.getFactory());
                                List<Category> list=cdao.getCategories();

//getting count
Map<String,Long> m =Helper.getCounts(FactoryProvider.getFactory());

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/common_css_js.jsp" %>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/admincss.css" />
        <title></title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container admin">
            
            <div class="container-fluid">
                <%@include file="components/message.jsp" %>
                
            </div>
                 
            
            
            
            <div class="row  mt-3">
                <!-- 1st Col -->
                <div class="col-md-4">
                    <!<!-- 1st box -->
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px"  src="images/team.png" alt="user_icon">
                            </div>
                            <h1><%= m.get("userCount")%></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>
                </div>

                <!-- 2nd Col -->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px"  src="images/list.png" alt="user_icon">
                            </div>
                            <h1 class='mt-2'><%= list.size()%></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                </div>

                <!-- 3rd Col -->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px"  src="images/product.png" alt="user_icon">
                            </div>
                            <h1><%= m.get("productCount")%></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>


            </div>

           <!-- 2nd row -->
            <div class="row mt-3">
                <!--2nd row:1st col-->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px"  src="images/keys.png" alt="keys">
                            </div>
                            <p class="mt-2">Click here to add new category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div>
                </div>

                <!--2nd row:2nd col-->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px"  src="images/plus.png" alt="product">
                            </div>
                            <p class="mt-2">Click here to add new product</p>
                            <h1 class="text-uppercase text-muted">Add Product</h1>
                        </div>
                    </div> 
                </div>

            </div>

        </div>

       
        <!--Add category modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title" id="exampleModalLongTitle">Fill category details</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory" />
                            <div class="form-group">
                                <input type="text" style="text-size:20px" class="form-control" name="catTitle" placeholder="Enter category title " required/>
                            </div>
                            <div class="form-group">
                                <textarea style="height:80px ,text-size:20px" class="form-control" name="catDescription" placeholder="Enter category description " required></textarea> 
                            </div>
                            
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Category</button>
                                 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                            
                        </form>
                    </div>
                    
                </div>
            </div>
        </div>
        

        <!--End category modal-->
        
              
        <!--Add product modal-->

        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title" id="exampleModalLongTitle">Fill product details</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            
                            <input type="hidden" name="operation" value="addproduct"></input>
                            
                            <div class="form-group">
                                <input type="text" style="text-size:20px" class="form-control" name="pName" placeholder="Enter product name " required/>
                            </div>
                            
                            <div class="form-group">
                                <textarea style="height:150px ,text-size:20px" class="form-control" name="pDesc" placeholder="Enter product description " required></textarea> 
                            </div> 
                            
                            <div class="form-group">
                                <input type="number" style="text-size:20px" class="form-control" name="pPrice" placeholder="Enter product price " required/>
                            </div>
                            
                            <div class="form-group">
                                <input type="number" style="text-size:20px" class="form-control" name="pDiscount" placeholder="Enter product discount  " required/>
                            </div>
                            
                            <div class="form-group">
                                <input type="number" style="text-size:20px" class="form-control" name="pQuantity" placeholder="Enter product quantity " required/>
                            </div>
                            
                            
                            <div class="form-group">
                                <select name="catId" class="form-control" id="">
                                    <%
                                        for(Category c:list){
                                        
                                    %>
                                    <option value="<%= c.getCategoryId() %>"> <%= c.getCategoryTitle() %> </option>
                                    <%  
                                        }
                                    %>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label for="pPic">Select Picture of Product</label><br>
                                <input type="file" id="pPic" name="pPic" required />
                            </div>
                            
                            
                            
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Product</button>
                                 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                            
                        </form>
                    </div>
                    
                </div>
            </div>
        </div>
        

        <!--End product modal-->
        
        
        
        
        <!-- JS code -->
        <script src="https://code.jquery.com/jquery-3.1.1.min.js">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js">
        </script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js">
        </script>
        <!--JS below-->


        <!--modal-->
        <script>
            $(document).ready(function () {
                $("#myModal").modal();
            });
        </script>
        
       
    </body>
</html>

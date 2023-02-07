<%@page import="com.ecommerce.nursery.entity.User"%>
<!-- header section starts  -->
<%
    User user1=(User) session.getAttribute("current-user");


    if (user1 == null) {
                
%>
<header>

    <div class="header-1">

        <div class="share" >
            <span> follow us : </span>
            <a href="#" class="fab fa-facebook-f"></a>
            <a href="#" class="fab fa-twitter"></a>
            <a href="#" class="fab fa-instagram"></a>
            <a href="#" class="fab fa-linkedin"></a>
        </div>

        <div class="call">
            <span> call us : </span>
            <a href="#">+919422301016</a>
        </div>

    </div>

    <div class="header-2">

        <a href="#" class="logo"> <i class="fas fa-seedling"></i> Roots and Shoots </a>

        <form action="" class="search-bar-container">
            <input type="search" id="search-bar" placeholder="search here...">
            <label for="search-bar" class="fas fa-search"></label>
        </form>

    </div>

    <div class="header-3">

        <div id="menu-bar" class="fas fa-bars"></div>

        <nav class="navbar">
            <a href="index.jsp#home" >home</a>
            <a href="index.jsp#category">category</a>
            <a href="#product" >product</a>
            <a href="index.jsp#deal">deal</a>
            <a href="index.jsp#contact" >contact</a>
        </nav>

        <div class="icons">
            <a href="#" data-toggle="modal" data-target="#cart" class="fas fa-shopping-cart"></a>
            <!--<a href="#" class="fas fa-heart"></a>-->
            <a href="login.jsp" class="fas fa-user-circle"></a>
        </div>

    </div>

</header>           
<%                
    }

    else if(user1.getUserType().equals("Normal")){

%>
<header>

    <div class="header-1">

        <div class="share">
            <span> follow us : </span>
            <a href="#" class="fab fa-facebook-f"></a>
            <a href="#" class="fab fa-twitter"></a>
            <a href="#" class="fab fa-instagram"></a>
            <a href="#" class="fab fa-linkedin"></a>
        </div>

        <div class="call">
            <span> call us : </span>
            <a href="#">+919422301016</a>
        </div>

    </div>

    <div class="header-2">

        <a href="#" class="logo"> <i class="fas fa-seedling"></i> Roots and Shoots </a>

        <form action="" class="search-bar-container">
            <input type="search" id="search-bar" placeholder="search here...">
            <label for="search-bar" class="fas fa-search"></label>
        </form>

    </div>

    <div class="header-3">

        <div id="menu-bar" class="fas fa-bars"></div>

        <nav class="navbar">
            <a href="index.jsp#home" >home</a>
            <a href="index.jsp#category">category</a>
            <a href="#product" >product</a>
            <a href="index.jsp#deal">deal</a>
            <a href="index.jsp#contact" >contact</a>
        </nav>

        <div class="icons">
            <a href="#" ><%= user1.getUserName() %></a>
            <a href="#" data-toggle="modal" data-target="#cart" class="fas fa-shopping-cart"></a>
            <!--<a href="#" class="fas fa-heart"></a>-->
            <a href="LogoutServlet" class="fas fa-sign-out-alt"></a>
        </div>

    </div>

</header>
<%       
             }
   
     else if(user1.getUserType().equals("Admin")){

%>
<header>
    <div class="header-2">

        <a href="#" class="logo"> <i class="fas fa-seedling"></i> Roots and Shoots </a>

        <form action="" class="search-bar-container">
            <input type="search" id="search-bar" placeholder="search here...">
            <label for="search-bar" class="fas fa-search"></label>
        </form>

    </div>
    <div class="header-3">

        <div class="icons">
            <a href="<%= user1.getUserType().equals("admin") ?"admin.jsp" : "index.jsp"%>" ><%= user1.getUserName() %></a>
            <a href="LogoutServlet" class="fas fa-sign-out-alt"></a>
        </div>

    </div>

</header>
<%
                }   
%>


<%@page import="com.ecommerce.nursery.entity.Category"%>
<%@page import="com.ecommerce.nursery.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.ecommerce.nursery.entity.Product"%>
<%@page import="com.ecommerce.nursery.dao.ProductDao"%>
<%@page import="com.ecommerce.nursery.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>R & S -Index</title>
        <%@include file="components/common_css_js.jsp" %>
       
        <!--Add Product js file-->
        <script src="addProduct.js"></script>
    </head>
    <body>
           
        <%@include file="components/navbar.jsp" %>
        <!-- home section starts  -->

<section class="home" id="home">
    <%@include file="components/message.jsp" %>
    <div class="swiper-container home-slider">

        <div class="swiper-wrapper">

            <div class="swiper-slide">
                <div class="box" style="background: url(images/slider1.jpg);">
                    <div class="content">
                        <span>upto 75% off</span>
                        <h3>plant big sale special offer</h3>
                        <a href="product.jsp" class="btn" style="display: inline-block;margin-top: 1rem;padding:.10rem 3rem;background:var(--green);color:#fff;font-size: 1.7rem;cursor: pointer;">shop now</a>
                    </div>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="box" style="background: url(images/slider2.jpg);">
                    <div class="content">
                        <span>upto 45% off</span>
                        <h3>plant make people happy</h3>
                        <a href="product.jsp" class="btn" style="display: inline-block;margin-top: 1rem;padding:.10rem 3rem;background:var(--green);color:#fff;font-size: 1.7rem;cursor: pointer;">shop now</a>
                    </div>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="box" style="background: url(images/slider3.jpg);">
                    <div class="content">
                        <span>upto 65% off</span>
                        <h3>decorate your home now</h3>
                        <a href="product.jsp" class="btn" style="display: inline-block;margin-top: 1rem;padding:.10rem 3rem;background:var(--green);color:#fff;font-size: 1.7rem;cursor: pointer;">shop now</a>
                    </div>
                </div>
            </div>

        </div>

        <div class="swiper-pagination"></div>

    </div>
</section>

<!-- home section ends -->

<!-- banner section starts  -->

<section class="banner-container">

    <div class="banner">
        <img src="images/banner1.jpg" alt="">
        <div class="content">
            <span>new arrivals</span>
            <h3>house plants</h3>
            <a href="product.jsp?category=3" class="btn" style="display: inline-block;margin-top: 1rem;padding:.10rem 3rem;background:var(--green);color:#fff;font-size: 1.7rem;cursor: pointer;">shop now</a>
        </div>
    </div>
    <div class="banner">
        <img src="images/banner2.jpg" alt="">
        <div class="content">
            <span>new arrivals</span>
            <h3>office plants</h3>
            <a href="product.jsp?category=1" class="btn" style="display: inline-block;margin-top: 1rem;padding:.10rem 3rem;background:var(--green);color:#fff;font-size: 1.7rem;cursor: pointer;">shop now</a>
        </div>
    </div>

</section>

<!-- banner section ends -->

<!-- category section starts  -->

<section class="category" id="category">

<h1 class="heading"> shop by category </h1>

<div class="box-container">

    <div class="box">
        <img src="images/cat1.jpg" alt="">
        <div class="content">
            <h3>bonsai</h3>
            <a href="product.jsp?category=4" class="btn" style="display: inline-block;margin-top: 1rem;width: 70%;padding:.8rem 3rem;background:var(--green);color:#fff;font-size: 1.2rem;cursor: pointer;margin-bottom: 1.3rem;">shop now</a>
        </div>
    </div>
    <div class="box">
        <img src="images/cat2.jpg" alt="">
        <div class="content">
            <h3>plants for house</h3>
            <a href="product.jsp?category=3" class="btn" style="display: inline-block;margin-top: 1rem;width: 70%;padding:.8rem 3rem;background:var(--green);color:#fff;font-size: 1.2rem;cursor: pointer;margin-bottom: 1.3rem;">shop now</a>
        </div>
    </div>
    <div class="box">
        <img src="images/cat3.jpg" alt="">
        <div class="content">
            <h3>plants for office</h3>
            <a href="product.jsp?category=1" class="btn" style="display: inline-block;margin-top: 1rem;width: 70%;padding:.8rem 3rem;background:var(--green);color:#fff;font-size: 1.2rem;cursor: pointer;margin-bottom: 1.3rem;">shop now</a>
        </div>
    </div>
    <div class="box">
        <img src="images/cat4.jpg" alt="">
        <div class="content">
            <h3>Fruit plants</h3>
            <a href="product.jsp?category=5" class="btn" style="display: inline-block;margin-top: 1rem;width: 70%; padding:.8rem 3rem;background:var(--green);color:#fff;font-size: 1.2rem;cursor: pointer;margin-bottom: 1.3rem;">shop now</a>
        </div>
    </div>

</div>

</section>

<!-- category section ends -->

<!-- product section starts  -->

<section class="product" id="product">

<h1 class="heading"> new products </h1>

<div class="box-container">
<%
                            
                    String cat = request.getParameter("category");
                    //  out.println(cat);
                    ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> plist = null;

                    if (cat == null || cat.trim().equals("all")) {
                        plist = pdao.getAllProducts();
                    }
                                    for (int i=0;i<6;i++) {
                                            Product p = plist.get(i);
    
                                %>
    <div class="box">
        <span class="discount">- <%= p.getpDiscount()%>%</span>
        <div class="icons">
            <a href="#" class="fas fa-heart"></a>
            <a href="#" class="fas fa-share"></a>
            <a href="#" class="fas fa-eye"></a>
        </div>
        <img style="height: 30rem" src="images/products/<%= p.getpPhoto()%>" alt=""/>
        <h3><%= p.getpName()%></h3>
        <div class="stars">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="far fa-star"></i>
        </div>
        <div class="quantity">
            <span> quantity : </span>
            <input name="qty" type="number" min="1" max="100" value="1">
           
        </div>
        <div class="price">&#8377 <%= p.getPriceAfterApplyingDiscount()%>/- <span>&#8377 <%= p.getpPrice()%></span></div>
        <a  class="btn" style="display: inline-block;margin-top: 1rem;width: 90%;  padding:.10rem 3rem;background:var(--green);color:#fff;font-size: 18px;cursor: pointer;" onclick="add_to_cart(<%= p.getpId()%> , '<%= p.getpName()%>', <%= p.getPriceAfterApplyingDiscount()%>)">add to cart</a>
    </div>
   
<%
                                    }

%>
</div>

</section>

<!-- product section ends -->

<!-- .icons section starts  -->

<section class="icons-container">

    <div class="icon">
        <img src="images/icon1.png" alt="">
        <div class="content">
            <h3>free shipping</h3>
            <p>Free shipping on order</p>
        </div>
    </div>
    <div class="icon">
        <img src="images/icon2.png" alt="">
        <div class="content">
            <h3>100% Money Back</h3>
            <p>You’ve 30 days to Return</p>
        </div>
    </div>
    <div class="icon">
        <img src="images/icon3.png" alt="">
        <div class="content">
            <h3>Payment Secure</h3>
            <p>100% secure payment</p>
        </div>
    </div>
    <div class="icon">
        <img src="images/icon4.png" alt="">
        <div class="content">
            <h3>Support 24/7</h3>
            <p>Contact us anytime</p>
        </div>
    </div>

</section>

<!-- .icons section ends -->

<!-- deal section starts  -->

<section class="deal" id="deal">

    <h1 class="heading"> deal of the day </h1>

    <div class="row">

        <div class="content">
            <h3 class="title">don't miss the deal</h3>
            <p>Our Nursery is a leading horticulture and landscaping expert. Based in Banglore, we are passionate horticulturists offering property owners the best quality of plants, gardening accessories, and related products with landscape related services. Supported by an experienced team, we have gained a strong presence across Maharashtra, Karnataka and Goa.</p>
            <div class="count-down">
                <div class="box">
                    <h3 id="day">00</h3>
                    <span>day</span>
                </div>
                <div class="box">
                    <h3 id="hour">00</h3>
                    <span>hour</span>
                </div>
                <div class="box">
                    <h3 id="minute">00</h3>
                    <span>minute</span>
                </div>
                <div class="box">
                    <h3 id="second">00</h3>
                    <span>second</span>
                </div>
            </div>
            <a href="product.jsp" class="btn" style="display: inline-block;margin-top: 1rem;padding:.8rem 3rem;background:var(--green);color:#fff;font-size: 1.7rem;cursor: pointer;">check out deal</a>
        </div>

        <div class="image">
            <img src="images/deal-img.jpg" alt="">
        </div>

    </div>

</section>

<!-- deal section ends -->

<!-- contact section starts  -->

<section class="contact" id="contact">

<h1 class="heading">get in touch</h1>

<div class="row">

    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6723873.300460669!2d73.79271375878317!3d11.881748982522007!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bb8cd17b47b2399%3A0x5d811a056691a3a8!2sRoots%20and%20Shoots%20-%20A%20Botanical%20Studio!5e0!3m2!1sen!2sin!4v1643012268656!5m2!1sen!2sin" width="600" height="450" style="border:0;" ></iframe>
    <form action="">

        <div class="inputBox">
            <input type="text" required>
            <label>name</label>
        </div>
        <div class="inputBox">
            <input type="email" required>
            <label>email</label>
        </div>
        <div class="inputBox">
            <input type="number" required>
            <label>number</label>
        </div>
        <div class="inputBox">
            <textarea required name="" id="" cols="30" rows="10"></textarea>
            <label>message</label>
        </div>

        <input type="submit" value="send message" class="btn" style="display: inline-block;margin-top: 1rem;padding:.8rem 3rem;background:var(--green);color:#fff;font-size: 1.7rem;cursor: pointer;">

    </form>

</div>

</section>

<!-- contact section ends -->



<!-- footer section starts  -->

<section class="footer">

    <div class="box-container">

        <div class="box">
            <h3>about us</h3>
            <p>Our Nursery is a leading horticulture and landscaping expert. Based in Banglore, we are passionate horticulturists offering property owners the best quality of plants, gardening accessories, and related products with landscape related services. Supported by an experienced team, we have gained a strong presence across Maharashtra, Karnataka and Goa.</p>
        </div>
        <div class="box">
            <h3>branch locations</h3>
            <a href="#">Banglore</a>
        </div>
        <div class="box">
            <h3>quick links</h3>
            <a href="#home">home</a>
            <a href="#category">category</a>
            <a href="#product">product</a>
            <a href="#deal">deal</a>
            <a href="#contact">contact</a>
        </div>
        <div class="box">
            <h3>follow us</h3>
            <a href="#">facebook</a>
            <a href="#">twitter</a>
            <a href="#">instagram</a>
            <a href="#">linked</a>
        </div>

    </div>

    <h1 class="credit">all rights reserved! </h1>
    
</section>

<!-- footer section ends -->

<!-- scroll top button  -->
<a href="#home" class="scroll-top fas fa-angle-up"></a>




<!--Common modal-->
<%@include file="components/common_modals.jsp" %>


<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<script src="addProduct.js"></script>
<!-- custom js file link  -->
 <script src="script.js"></script>
    </body>
</html>

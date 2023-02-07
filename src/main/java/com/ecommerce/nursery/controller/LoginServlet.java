
package com.ecommerce.nursery.controller;

import com.ecommerce.nursery.dao.UserDao;
import com.ecommerce.nursery.entity.User;
import com.ecommerce.nursery.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
           
            try{
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                
                UserDao userDao = new UserDao(FactoryProvider.getFactory());
                User user = userDao.getUserByEmailAndPassword(email, password);
                //System.out.println(user);
                HttpSession httpsession = request.getSession();
                if(user == null){
                    //out.println("<h1> Invalid details </h1>");
                    httpsession.setAttribute("message", "Invalid details !! Try with another one");
                    response.sendRedirect("login.jsp");
                    return;
                }
                else{
                    //out.println("<h1>Welcome "+user.getUserName()+"</h1>");
                    
                    httpsession.setAttribute("current-user",user);
                    if(user.getUserType().equals("Admin")){
                        response.sendRedirect("admin.jsp");
                    }
                    else if(user.getUserType().equals("Normal")){
                        response.sendRedirect("index.jsp");
                    }
                    else{
                        out.println("we have not identified user type");
                    }
                }
            }
            catch(Exception e){
                e.printStackTrace();
            }
            
            
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

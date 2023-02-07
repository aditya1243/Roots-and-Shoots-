
package com.ecommerce.nursery.controller;

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
import net.bytebuddy.utility.RandomString;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            try{
               String userName=request.getParameter("user_name");
               String userEmail=request.getParameter("user_email");
               String userPassword=request.getParameter("user_password");
               String userPhone=request.getParameter("user_phone");
               String userAddress=request.getParameter("user_address");
               
               if(userName.trim().length()>3){
                   User user = new User(userName, userEmail, userPassword, userPhone, userAddress,"Normal");
                   int userId;
                    Session hibernateSession = FactoryProvider.getFactory().openSession();
                    Transaction tx = hibernateSession.beginTransaction();
                    
                    userId = (int) hibernateSession.save(user);
                    tx.commit();
                    HttpSession  httpsession = request.getSession();
                    httpsession.setAttribute("message", "Registration successful !!");
                    response.sendRedirect("login.jsp");
                    
               }
               else{
                   Session hibernateSession = FactoryProvider.getFactory().openSession();
                    Transaction tx = hibernateSession.beginTransaction();
                HttpSession  httpsession = request.getSession();
                    httpsession.setAttribute("message", "name lenght should be min 3!!");
                    response.sendRedirect("login.jsp");
                
               }
               
               
               
                String randomCode = RandomString.make(64);
                user.setVerificationcode(randomCode);
                
                
               
                    
                   
                    return;
            }
            catch(HibernateException e){
                e.printStackTrace();
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Order;

/**
 *
 * @author v
 */
public class ProcessOrder extends HttpServlet {
    
    String couponCode;
    
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        
        // Retrieves couponCode value.
        couponCode = config.getInitParameter("couponCode");
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setStatus(HttpServletResponse.SC_OK);
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Connection", "keep-alive");
        response.setHeader("Content-Language", "en-US");
        
        // Retrieving parameters from form.
        String flavor = request.getParameter("flavor");
        double price = Double.valueOf(request.getParameter("price"));
        String size = request.getParameter("size");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String inputCouponCode = request.getParameter("coupon");
        
        double discountRate;
        
        // Setting discount if inputCouponCode is valid.
        if (couponCode.equals(inputCouponCode)) {
            discountRate = 10;
        }
        else {
            discountRate = 0;
        }
        
        // Creating object according to form details if parameters are valid.
        if (quantity <= 0) {
            throw new java.lang.IllegalArgumentException();
        }
        else {
            Order newOrder = new Order(flavor, price, size, quantity, inputCouponCode, discountRate);
        
            request.setAttribute("newOrder", newOrder);
            RequestDispatcher view = request.getRequestDispatcher("order.jsp");
            
            // Use forward since the order.jsp doesn't need to be further modified by ProcessOrder
            view.forward(request, response);
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

package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Milktea;
import service.MilkteaService;

/**
 *
 * @author maxim
 */
public class MenuFlavors extends HttpServlet {
    private MilkteaService milkteaService;
    
    public void init() {
        milkteaService = new MilkteaService();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Milktea monthlyMilktea = (Milktea) getServletContext().getAttribute("monthlyMilktea");
        
        // Prevents monthlyMilktea from duplicating
        if (monthlyMilktea != null && milkteaService.findMilkteaByName(monthlyMilktea.getName()) == null) {
            milkteaService.addMilktea(monthlyMilktea);
        }
        
        getServletContext().setAttribute("updatedMilkteaService", milkteaService);
        response.sendRedirect("menu.jsp");
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

package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Milktea;
import service.MilkteaService;

public class MilkteaSelect extends HttpServlet {
    String flavorWithFreebie;
    
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        
        // Retrieves the flavor with a freebie.
        flavorWithFreebie = config.getInitParameter("flavorWithFreebie");
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flavor = request.getParameter("flavor");
        flavor.replaceAll("%20", "");
        MilkteaService milkteaService = (MilkteaService) getServletContext().getAttribute("updatedMilkteaService");
        Milktea mt = milkteaService.findMilkteaByName(flavor);
        
        if (flavorWithFreebie.equals(mt.getName())) {
            mt.setFreebie("Metal straw");
        }
        
        // Performs invalid page checks.
        if (mt == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
        else {
            request.setAttribute("milktea", mt);
            RequestDispatcher view =
                request.getRequestDispatcher("result.jsp");
            
            // Use include so that the result.jsp can still be modified by milktea select if needed
            view.include(request, response);
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

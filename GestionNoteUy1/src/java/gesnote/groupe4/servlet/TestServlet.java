/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe4.servlet;

import gesnote.groupe4.modeles.DashboardDao;
import gesnote.groupe4.parameters.PvParUeParameter;
import gesnote.groupe4.modeles.ReportDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MBOUOPDA MICHAEL
 */
@WebServlet(urlPatterns = {"/groupe4"})
public class TestServlet extends HttpServlet {

    @EJB
    ReportDao reportDao = new ReportDao();

    @EJB
    DashboardDao dashboardDao = new DashboardDao();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TestServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TestServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String action = request.getParameter("a");
        String format = request.getParameter("f");

        PvParUeParameter param = new PvParUeParameter();
        // param.setCodeFiliere(request.getParameter("annee"));
        param.setAnneeAcademique("2015-2016");
        // param.setCodeFiliere(request.getParameter("codeFiliere"));
        param.setCodeFiliere("info");
        // param.setCodeFiliere(request.getParameter("codeUe"));
        param.setCodeUe("inf401");
        // param.setCodeFiliere(request.getParameter("idSemestre"));
        param.setIdSemestre(1);
        // param.setCodeFiliere(request.getParameter("niveau"));
        param.setNiveau("M1");

        String webInRealPath = this.getServletContext().getRealPath("WEB-INF");

        switch (action) {
            case "ppu":
                if (format != null && format.equals("e")) {
                    reportDao.pvParUeInExcel(webInRealPath, response, param);
                } else {
                    reportDao.pvParUeInPdf(webInRealPath, response, param);
                }
                break;
            case "fa":
                reportDao.ficheAcaInPdf(webInRealPath, response, "2015-2016", "12U0168");
                break;
            case "lapm":
                if (format != null && format.equals("e")) {
                    reportDao.listAdmisParMatInExcel(webInRealPath, response, "2015-2016", 16, 9);
                } else {
                    reportDao.listAdmisParMatInPdf(webInRealPath, response, "2015-2016", 16, 9);
                }
                break;
            case "lnapm":
                if (format != null && format.equals("e")) {
                    reportDao.listNonAdmisParMatInExcel(webInRealPath, response, "2015-2016", 1, 1);
                } else {
                    reportDao.listNonAdmisParMatInPdf(webInRealPath, response, "2015-2016", 1, 1);
                }
                break;
            case "lcd":
                if (format != null && format.equals("e")) {
                    reportDao.listChefDeptInExcel(webInRealPath, response);
                } else {
                    reportDao.listChefDeptInPdf(webInRealPath, response);
                }
                break;
            case "le":
                if (format != null && format.equals("e")) {
                    reportDao.listEtudiantInExcel(webInRealPath, response, 8, "2015-2016");
                } else {
                    reportDao.listEtudiantInPdf(webInRealPath, response,  8, "2015-2016");
                }
                break;
            case "lcj":
                if (format != null && format.equals("e")) {
                    reportDao.listChefJuryInExcel(webInRealPath, response, "2015-2016");
                } else {
                    reportDao.listChefJuryInPdf(webInRealPath, response, "2015-2016");
                }
                break;
            case "led":
                if (format != null && format.equals("e")) {
                    reportDao.listEnseignementDeptInExcel(webInRealPath, response, "2015-2016", 1);
                } else {
                    reportDao.listEnseignementDeptInExcel(webInRealPath, response, "2015-2016", 1);
                }
                break;
            default:
                // dashboard
                request.setAttribute("listRequetesATraiter", dashboardDao.listRequete("en_cours", 10));
                request.setAttribute("requeteNonTraiter", dashboardDao.nbreRequeteNonTraiter("info"));
                request.setAttribute("inscritsParMatiere", dashboardDao.inscritsParMatiere("2015-2016", 4));
                this.getServletContext().getRequestDispatcher("/WEB-INF/groupe4/dashboard.jsp").forward(request, response);
                break;
        }
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe5.servlet;

import entities.Enseignant;
import gesnote.groupe5.modeles.DeliberationModel;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
@WebServlet(name = "DeliberationServlet", urlPatterns = {"/deliberation"})
public class DeliberationServlet extends HttpServlet {

    @EJB
    DeliberationModel modele = new DeliberationModel();

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
        HttpSession session = request.getSession();
        Enseignant presidentJury = (Enseignant) session.getAttribute("jury");
        String param = request.getParameter("type");
        request.setAttribute("title", "Délibération");
        if(presidentJury == null){
            System.out.println("Le président du jury est offline");
            this.getServletContext().getRequestDispatcher("/WEB-INF/groupe5/deliberations.jsp").forward(request, response);
        }else{
            if(param == null){
                System.out.println("Le président du jury est online");
                this.getServletContext().getRequestDispatcher("/WEB-INF/groupe5/deliberations.jsp").forward(request, response);
            }else{
                String jsonText = "";
                switch(param){
                    case "getPV":
                        double mgpMin = Double.valueOf(request.getParameter("mgpMin"));
                        double nbEchecMax = Double.valueOf(request.getParameter("nbEchecMax"));
                        int idClasse = presidentJury.getEnseignantClasseJuryList().get(0).getIdclasse().getIdclasse();
                        
                        List<Map<String, String>> admisSansCriteres = modele.getEtudiantAdmisNotCritere5(idClasse);
                        List<Map<String, String>> admisAvecCriteres = modele.getEtudiantAdmisWithCritere5(idClasse, mgpMin, nbEchecMax);
                        List<Map<String, String>> nonAdmis = modele.getEtudiantEchecWithCritere5(idClasse, mgpMin, nbEchecMax);
                        
                        String tableHTMLAdmis = modele.getHTMLTableForPVAdmisNotCritere5(admisSansCriteres);
                        String tableHTMLDelib = modele.getHTMLTableForPVAdmisWithCritere5(admisAvecCriteres);
                        String tableHTMLEchec = modele.getHTMLTableForPVEchecWithCritere5(nonAdmis);
                        System.out.println("admis = " + tableHTMLAdmis);
                        System.out.println("repeche = " + tableHTMLDelib);
                        System.out.println("echec = " + tableHTMLEchec);
                        jsonText = modele.getJsonFormHTMLTable5(tableHTMLAdmis, tableHTMLDelib, tableHTMLEchec);
                        response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");
                        response.getWriter().write(jsonText);
                        break;
                    case "sendNote":
                        boolean result = modele.saveFinalPV5(request);
                        response.getWriter().write(String.valueOf(result));
                        break;
                }
                
                
            }
            
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
        
    }

}

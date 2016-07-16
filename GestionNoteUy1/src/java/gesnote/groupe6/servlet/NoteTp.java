/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.servlet;

import entities.EtudiantExam;
import entities.Matiere;
import gesnote.groupe6.modeles.EtudiantExamFacade;
import gesnote.groupe6.modeles.InscriptionFacade;
import gesnote.groupe6.modeles.MatiereFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Vector;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author FOQUO
 */
@WebServlet(name = "NoteTp", urlPatterns = {"/noteTP"})
public class NoteTp extends HttpServlet {
     @EJB
    InscriptionFacade IF;
    @EJB
    EtudiantExamFacade EEF;
    @EJB
    MatiereFacade MF;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
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
          String code =(String )request.getParameter("matiere");
        Vector <Matiere> listeMatiere=(Vector)request.getSession().getAttribute("listeEnsMat");
        Matiere matiere=MF.getMatiere(code);
         List<EtudiantExam> etud=(List)EEF.findNotes(matiere.getIdmatiere(), "tp");
        
        request.setAttribute("etud", etud);
       
        
        this.getServletContext().getRequestDispatcher("/WEB-INF/groupe7/Notes_Etudiants_tp.jsp").forward(request, response);
    
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    

}

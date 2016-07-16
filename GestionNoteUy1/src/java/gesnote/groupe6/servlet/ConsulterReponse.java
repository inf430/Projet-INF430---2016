/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.servlet;

import entities.Etudiant;
import entities.Reponse;
import entities.Requete;
import gesnote.groupe6.modeles.ReponseFacade;
import gesnote.groupe6.modeles.RequeteFacade;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ConsulterReponse", urlPatterns = {"/consulter_reponse"})
public class ConsulterReponse extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @EJB
   RequeteFacade RF;

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
        
        Etudiant etudiant =(Etudiant)request.getSession().getAttribute("etudiant");
        Vector <Requete> listeRequete= RF.trouverListeRequete(etudiant);
        
        request.setAttribute("listeRequete ", listeRequete);
        request.getSession().setAttribute("listeRequete", listeRequete);
        
        this.getServletContext().getRequestDispatcher("/WEB-INF/groupe7/requeteEtudiant.jsp").forward(request, response);
       
        //Vector<Reponse> listeReponse= (Vector)RF.recupererListeReponse( e);     
        
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
   
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.servlet;

import entities.Enseignant;
import entities.Matiere;
import entities.Reponse;
import entities.Requete;
import gesnote.groupe6.modeles.ReponseFacade;
import gesnote.groupe6.modeles.RequeteFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(name = "EnregistrerReponse", urlPatterns = {"/enregistrerReponse"})
public class EnregistrerReponse extends HttpServlet {
@EJB
    ReponseFacade RF;
@EJB
    RequeteFacade REF;
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
        
        String code = (String) request.getParameter("observation");
        Requete requete = (Requete) request.getSession().getAttribute("requete");
          requete.setReponse(new Reponse());
        
            requete.getReponse().setContenu(code);
            requete.getReponse().setMatricule((Enseignant)request.getSession().getAttribute("enseignant"));
            requete.getReponse().setIdrequete(requete);
            
             SimpleDateFormat d = new  SimpleDateFormat("dd-mm-yyyy");
          String datete = d.format(new Date());
          requete.getReponse().setDateReponse(datete);
        
        
        requete.setEtat("traite");
        RF.insert(requete.getReponse());
       // REF.insert(requete);
        request.setAttribute("enseignant", (Enseignant)request.getSession().getAttribute("enseignant"));
                 request.setAttribute("listeEnsMat",(Vector)request.getSession().getAttribute("listeEnsMat") );     
            
       this.getServletContext().getRequestDispatcher("/WEB-INF/Accueil.jsp").forward(request, response);
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

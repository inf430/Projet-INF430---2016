/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.servlet;

import entities.Enseignant;
import entities.EnseignantMat;
import entities.Etudiant;
import entities.Matiere;
import entities.Requete;
import gesnote.groupe6.modeles.EnseignantMatFacade;
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
@WebServlet(name = "enregistrerServlet", urlPatterns = {"/enregistrerRequete"})
public class enregistrerServlet extends HttpServlet {

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
    @EJB
    EnseignantMatFacade EMF;

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
        /* Récupération des champs du formulaire. */
           String objet = request.getParameter( "objet" ) ;
            String motif = request.getParameter( "motif" ) ;
            Matiere matiere=(Matiere)request.getSession().getAttribute("matiererequete");
            Etudiant etudiant=(Etudiant)request.getSession().getAttribute("etudiant");
            Requete requete=new Requete();
            requete.setIdmatiere(matiere);
            requete.setMatricule(etudiant);
            requete.setContenu(motif);
            requete.setObjet(objet);
            requete.setEtat("en cours");
           SimpleDateFormat d = new  SimpleDateFormat("dd-mm-yyyy");
          String datete = d.format(new Date());
           requete. setDateRequete(datete);
           RF.trouverRequete(requete);
           
             request.setAttribute("listeMatiere",(Vector)request.getSession().getAttribute("listeMatiere"));
                request.setAttribute("etudiant",(Etudiant) request.getSession().getAttribute("etudiant"));
           
           this.getServletContext().getRequestDispatcher("/WEB-INF/Accueil.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
   /* Récupération des champs du formulaire. */
          
}

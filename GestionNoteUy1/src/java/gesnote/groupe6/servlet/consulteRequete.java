/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.servlet;

import entities.Matiere;
import entities.Requete;
import gesnote.groupe6.modeles.MatiereFacade;
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
@WebServlet(name = "consulteRequeteServelet", urlPatterns = {"/consulteRequete"})
public class consulteRequete extends HttpServlet {

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
    MatiereFacade MF;
    
    
    
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
      String code=(String)request.getParameter("matiere");
       Matiere matier=new Matiere();
      /*
     Vector <Matiere> listeMatiere=(Vector)request.getSession().getAttribute("listeEnsMat");
     Matiere matier=new Matiere();
     for(Matiere m:listeMatiere){
         if(m.getCode().equals(code)){
             matier=m;
             break;
         }
     }
     */
        matier=MF.getMatiere(code);
                
            
     Vector <Requete> listeRequete=RF.recupererRequete(matier);
     
     request.getSession().setAttribute("listeRequete",listeRequete);
     request.setAttribute("listeRequete", listeRequete);
     this.getServletContext().getRequestDispatcher("/WEB-INF/groupe7/requete.jsp").forward(request, response);
     
    }
    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.servlet;

import entities.Etudiant;
import entities.EtudiantClasse;
import entities.Matiere;
import gesnote.groupe6.modeles.ChefDptDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELMAS
 */
@WebServlet(name = "ConsulterListeEtudClasse", urlPatterns = {"/ConsulterListeEtudClasse"})
public class ConsulterListeEtudClasse extends HttpServlet {
    @EJB
    ChefDptDao dao = new ChefDptDao();
  

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String classe = (String) request.getParameter("classe");
        request.setAttribute("classe", classe);
         List<Etudiant> etuds = new ArrayList<>();
         List<Matiere> matsDpt = dao.getMatDpt();
         
        etuds = dao.getListeEtudClasse(classe);
        request.setAttribute("etuds", etuds);
        this.getServletContext().getRequestDispatcher("/WEB-INF/Consultations/listeEtudClasse.jsp")
                  .forward(request, response); 
    }

}

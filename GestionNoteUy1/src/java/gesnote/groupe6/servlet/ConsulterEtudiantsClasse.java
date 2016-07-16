/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.servlet;

import entities.Etudiant;
import entities.Matiere;
import gesnote.groupe6.modeles.ChefDptDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.ArrayList;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JOSPIN
 */
@WebServlet(name = "ConsulterEtudiantsClasse", urlPatterns = {"/ConsulterEtudiantsClasse"})
public class ConsulterEtudiantsClasse extends HttpServlet {
    @EJB
    ChefDptDao dao = new ChefDptDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dao.setIdEcd(request);
        String classe = (String) request.getParameter("classe");
        List<Etudiant> etuds = new ArrayList<>();
        List<String> classesDpt = dao.getClasses();
        etuds = dao.getListeEtudClasse(classe);
        List<Matiere> matsDpt = dao.getMatDpt();
        
        request.setAttribute("matsDpt", matsDpt);
        request.setAttribute("classe", classe);
        request.setAttribute("classesDpt", classesDpt);
        request.setAttribute("etuds", etuds);  
        this.getServletContext().getRequestDispatcher("/WEB-INF/groupe7/Liste_Etudiants_Classe.jsp")
                  .forward(request, response); 
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.servlet;

import entities.EtudiantExam;
import entities.Matiere;
import gesnote.groupe6.modeles.ChefDptDao;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ConsulterPVDept", urlPatterns = {"/ConsulterPVDept"})
public class ConsulterPVDept extends HttpServlet {
    @EJB
    ChefDptDao dao = new ChefDptDao();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         dao.setIdEcd(request);
        String typeExam = request.getParameter("typeExam");
        String codeMat = request.getParameter("matiere");
         
        List<EtudiantExam> etudExams = (List<EtudiantExam>)dao.getEtudExam(codeMat, typeExam);
        System.out.print(codeMat);
        /**  Matières er classes du dept à transmettre 
         * pour affichage dans le mebu du chef**/
        List<String> classesDpt = dao.getClasses();
        List<Matiere> matsDpt = dao.getMatDpt();
       
        request.setAttribute("etudExams", etudExams);
        request.setAttribute("matsDpt", matsDpt);
        request.setAttribute("classesDpt", classesDpt);
        this.getServletContext().getRequestDispatcher("/WEB-INF/groupe7/Notes_Etudiants.jsp")
                  .forward(request, response); 
    }


}

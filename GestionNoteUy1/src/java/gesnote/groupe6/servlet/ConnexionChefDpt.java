
package gesnote.groupe6.servlet;

import entities.Personne;
import gesnote.groupe6.modeles.ChefDptDao;
import entities.EnseignantChefDepartement;
import entities.EtudiantExam;
import entities.Examen;
import entities.Matiere;
import entities.Ue;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "ConnexionChefDpt", urlPatterns = {"/Connexion_chefDpt"})
public class ConnexionChefDpt extends HttpServlet {
   @EJB
   ChefDptDao dao = new ChefDptDao();
   
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        EnseignantChefDepartement  chefDpt = new EnseignantChefDepartement(1);
        
        HttpSession session = request.getSession();
        session.setAttribute("chefDpt", chefDpt);
        
        List<String> classes = new ArrayList<>();
        dao.setIdEcd(request);
        classes = dao.getClasses();
       Integer idDpt = dao.getIdDpt();
       
       List<Ue> ues = new ArrayList<>();
       ues = dao.getUeDpt();
       
       List<Matiere> mats = new ArrayList<>();
       mats = dao.getMatDpt();
       
       List<Examen> exams = new ArrayList<>();
       exams = dao.getExamMatiere();
       
       String codeMat = (String) request.getAttribute("codeMat");
       String typeExam = (String)request.getAttribute("typeExam");
       List<EtudiantExam> etudExams = new ArrayList<>();
       etudExams = dao.getEtudExam(codeMat, typeExam);
       
        request.setAttribute("etudExams", etudExams);
        request.setAttribute("exams", exams);
        request.setAttribute("ues", ues);
        request.setAttribute("idDpt", idDpt);
        request.setAttribute("classes", classes);
        request.getSession().getAttribute("chefDpt");
        
        this.getServletContext().getRequestDispatcher("/WEB-INF/Consultations/menuChefDpt.jsp")
                  .forward(request, response); 
        }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
    }

    
}

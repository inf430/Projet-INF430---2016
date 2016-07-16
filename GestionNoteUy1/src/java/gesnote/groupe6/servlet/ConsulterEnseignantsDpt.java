
package gesnote.groupe6.servlet;

import entities.Enseignant;
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
 * @author JOSPIN
 */
@WebServlet(name = "ConsulterEnseignantsDpt", urlPatterns = {"/ConsulterEnseignantsDpt"})
public class ConsulterEnseignantsDpt extends HttpServlet {

   @EJB
   ChefDptDao dao = new ChefDptDao();
   
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  
       dao.setIdEcd(request);
       String code = dao.getCodeDpt();
       List<Enseignant> listEns = dao.getListeEnsDpt(code);
       List<String> classesDpt = dao.getClasses();
       List<Matiere> matsDpt = dao.getMatDpt();
       
       request.setAttribute("listEns", listEns);
      //session.setAttribute("type", "chefDepartement");
                request.setAttribute("classesDpt", classesDpt);
                request.setAttribute("matsDpt", matsDpt);
       
        this.getServletContext().getRequestDispatcher("/WEB-INF/groupe7/Liste_Enseignants_dpt.jsp")
                  .forward(request, response); 
    }
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}

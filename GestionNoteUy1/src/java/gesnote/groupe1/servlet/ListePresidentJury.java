/**
 * @author groupe1
 */
package gesnote.groupe1.servlet;

import gesnote.groupe1.modeles.AdminDao;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ListePresidentJury", urlPatterns = {"/liste_president_jury"})
public class ListePresidentJury extends HttpServlet {

    @EJB
    AdminDao dao = new AdminDao();

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
        HttpSession session = request.getSession();
        if (session.getAttribute("login") != null) {
            if (request.getParameter("menu") != null) {
                request.setAttribute("menu", request.getParameter("menu"));
            }
            String login = (String) request.getSession().getAttribute("login");
            request.setAttribute("liste_president_jury", dao.getListePresidentJury(login));
            this.getServletContext().getRequestDispatcher("/WEB-INF/groupe1/liste_president_jury.jsp").forward(request, response);
        } else {
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }

    }

}

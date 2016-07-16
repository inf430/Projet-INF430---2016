/**
 * @author groupe1
 */
package gesnote.groupe1.servlet;

import entities.Enseignant;
import gesnote.groupe1.modeles.AdminDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 *
 * @author Groupe 1
 */
@WebServlet(name = "ListeMatieresEnsChef", urlPatterns = {"/liste-matieres-ens-chef"})
public class ListeMatieresEnsChefServlet extends HttpServlet {

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
            String login_ens = (String) request.getParameter("login");
            request.setAttribute("ens", dao.getEnseignantByLogin(login_ens));
            Enseignant chef = dao.getEnseignantByLogin((String) request.getSession().getAttribute("login"));
            request.setAttribute("liste_matieres", dao.getListeMatieresDep(chef.getIddepartement()));
            request.setAttribute("liste_mat_ens", dao.getListeMatEns(login_ens));
            request.setAttribute("mat", dao.getEnseignantByLogin(login_ens).getMatricule());
            this.getServletContext().getRequestDispatcher("/WEB-INF/groupe1/Accueil.jsp").forward(request, response);
        } else {
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }

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
        HttpSession session = request.getSession();
        if (session.getAttribute("login") != null) {
            JSONParser parser = new JSONParser();
            JSONObject objetjson;
            JSONArray parametres;
            int idmatiere;
            String matricule;
            try {
                Object object = parser.parse(request.getParameter("params"));
                objetjson = dao.objectToJSONObject(object);
                if (objetjson == null) {
                    parametres = dao.objectToJSONArray(object);
                    JSONObject jsonobject = (JSONObject) parametres.get(0);
                    JSONObject params = (JSONObject) jsonobject.getJSONObject("params");
                    idmatiere = params.getInt("idmatiere");
                    matricule = params.getString("matricule");
                } else {
                    JSONObject params = (JSONObject) objetjson.getJSONObject("params");
                    idmatiere = params.getInt("idmatiere");
                    matricule = params.getString("matricule");
                }

                JSONObject jsonobject = new JSONObject();
                jsonobject.put("resultat", dao.associate_mat_ens(idmatiere, matricule) ? 1 : 0);

                PrintWriter writer = response.getWriter();
                writer.write(jsonobject.toString());

            } catch (ParseException | JSONException ex) {
                Logger.getLogger(ConnectServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

}

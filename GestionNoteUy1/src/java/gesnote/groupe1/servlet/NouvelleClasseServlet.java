/**
 * @author groupe1
 */
package gesnote.groupe1.servlet;

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

@WebServlet(name = "NouvelleClasseServlet", urlPatterns = {"/nouvelleclasse"})
public class NouvelleClasseServlet extends HttpServlet {

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
            if (request.getParameter("params") != null) {
                JSONParser parser = new JSONParser();
                JSONObject objetjson;
                JSONArray parametres;
                int idfiliere;
                String niveau;
                String nom;
                try {
                    Object object = parser.parse(request.getParameter("params"));
                    objetjson = dao.objectToJSONObject(object);
                    if (objetjson == null) {
                        parametres = dao.objectToJSONArray(object);
                        JSONObject jsonobject = (JSONObject) parametres.get(0);
                        JSONObject params = (JSONObject) jsonobject.getJSONObject("params");
                        idfiliere = params.getInt("idfiliere");
                        niveau = params.getString("niveau");
                        nom = params.getString("nom");
                    } else {
                        JSONObject params = (JSONObject) objetjson.getJSONObject("params");
                        idfiliere = params.getInt("idfiliere");
                        niveau = params.getString("niveau");
                        nom = params.getString("nom");
                    }

                    JSONObject jsonobject = new JSONObject();
                    jsonobject.put("resultat", dao.addClass(idfiliere, niveau, nom) ? 1 : 0);

                    PrintWriter writer = response.getWriter();
                    writer.write(jsonobject.toString());

                } catch (ParseException | JSONException ex) {
                    Logger.getLogger(ConnectServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                if (request.getParameter("menu") != null) {
                    request.setAttribute("menu", request.getParameter("menu"));
                }
                request.setAttribute("liste_filieres", dao.getListeFilieres());
                request.setAttribute("liste_niveaux", dao.getListeNiveaux());
                this.getServletContext().getRequestDispatcher("/WEB-INF/Accueil.jsp").forward(request, response);
            }
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
        JSONParser parser = new JSONParser();
        JSONObject objetjson;
        JSONArray parametres;
        int idfiliere;
        String niveau;
        String nom;
        try {
            Object object = parser.parse(request.getParameter("params"));
            objetjson = dao.objectToJSONObject(object);
            if (objetjson == null) {
                parametres = dao.objectToJSONArray(object);
                JSONObject jsonobject = (JSONObject) parametres.get(0);
                JSONObject params = (JSONObject) jsonobject.getJSONObject("params");
                nom = params.getString("nom");
            } else {
                JSONObject params = (JSONObject) objetjson.getJSONObject("params");
                nom = params.getString("nom");
            }

            JSONObject jsonobject = new JSONObject();
            jsonobject.put("resultat", dao.checkClasse(nom) ? 1 : 0);

            PrintWriter writer = response.getWriter();
            writer.write(jsonobject.toString());

        } catch (ParseException | JSONException ex) {
            Logger.getLogger(ConnectServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}

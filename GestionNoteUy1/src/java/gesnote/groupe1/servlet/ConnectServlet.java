/**
 * @Author groupe1
 */
package gesnote.groupe1.servlet;

import entities.*;
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

@WebServlet(urlPatterns = {"/connexion"})
public class ConnectServlet extends HttpServlet {

    @EJB
    AdminDao dao = new AdminDao();

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONParser parser = new JSONParser();
        JSONObject objetjson;
        JSONArray parametres;
        String login = null;
        String password = null;
        try {
            Object object = parser.parse(request.getParameter("params"));
            objetjson = dao.objectToJSONObject(object);
            if (objetjson == null) {
                parametres = dao.objectToJSONArray(object);
                JSONObject jsonobject = (JSONObject) parametres.get(0);
                JSONObject params = (JSONObject)jsonobject.getJSONObject("params");
                login = (String) params.getString("login");
                password = dao.getMD5((String) params.getString("password"));
            } else {
                JSONObject params = (JSONObject)objetjson.getJSONObject("params");
                login = (String) params.getString("login");
                password = dao.getMD5((String) params.getString("password"));
            }
        } catch (ParseException | JSONException ex) {
            Logger.getLogger(ConnectServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (!dao.exist(login, password)) {
            PrintWriter writer = response.getWriter();
            JSONObject jsonobject = new JSONObject();
            try {
                jsonobject.put("reponse", "login ou password incorrect");
            } catch (JSONException ex) {
                Logger.getLogger(ConnectServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            writer.write(jsonobject.toString());
        } else {
            HttpSession session = request.getSession();
            Personne personne = dao.getPersonne(login, password);
            session.setAttribute("login", personne.getLogin());
            session.setAttribute("id", personne.getIdpersonne());
            session.setAttribute("type", personne.getStatut());
            response.sendRedirect(request.getContextPath() + "Accueil.jsp");
        }
    }

}

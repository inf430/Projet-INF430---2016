/**
 * @author groupe1
 */
package gesnote.groupe1.servlet;

import entities.Administratif;
import entities.Droit;
import gesnote.groupe1.modeles.AdminDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author groupe 1
 */
@WebServlet(urlPatterns = {"/rightperson"})
public class RightPersonServlet extends HttpServlet {

    @EJB
    AdminDao dao = new AdminDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        /*if (session.getAttribute("login") != null) {

        } else {
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }*/
        this.getServletContext().getRequestDispatcher("/WEB-INF/groupe1/associate_right_person.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        /*if (session.getAttribute("login") != null) {

        } else {
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }*/
        JSONParser parser = new JSONParser();
        JSONObject objetjson;
        JSONArray parametres;
        String dateDebut;
        int id_droit;
        String login;
        String dateFin;
        Administratif login_ad;

        try {
            Object object = parser.parse(request.getParameter("params"));
            objetjson = dao.objectToJSONObject(object);
            if (objetjson == null) {
                parametres = dao.objectToJSONArray(object);
                JSONObject jsonobject = (JSONObject) parametres.get(0);
                JSONObject params = (JSONObject) jsonobject.getJSONObject("params");
                login = params.getString("login");
                id_droit = params.getInt("droit");
                dateDebut = params.getString("debut");
                dateFin = params.getString("fin");
                login_ad = (Administratif) request.getAttribute("administratif");
            } else {
                JSONObject params = (JSONObject) objetjson.getJSONObject("params");
                login = params.getString("login");
                id_droit = params.getInt("droit");
                dateDebut = params.getString("debut");
                dateFin = params.getString("fin");
                login_ad = (Administratif) request.getAttribute("administratif");
            }

            JSONObject jsonobject = new JSONObject();

            if (dao.checkEnseignantHasDroit(login, id_droit)) {
                jsonobject.put("resultat", 2);
            } else {
                jsonobject.put("resultat", ("parfait".equals(dao.associateRightTeacher(login, id_droit, dateDebut, dateFin, login_ad))) ? 1 : 0);
            }
            PrintWriter writer = response.getWriter();
            writer.write(jsonobject.toString());

        } catch (ParseException | JSONException ex) {
            Logger.getLogger(ConnectServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

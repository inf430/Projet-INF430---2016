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

@WebServlet(name = "AddChefDepartementServlet", urlPatterns = {"/addchefdepartement"})
public class AddChefDepartementServlet extends HttpServlet {

    @EJB
    AdminDao dao = new AdminDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("login") != null) {
            if (request.getParameter("menu") != null) {
                request.setAttribute("menu", request.getParameter("menu"));
            }
            if (request.getParameter("params") != null) {
                JSONParser parser = new JSONParser();
                JSONObject params;
                JSONObject objetjson;
                JSONArray parametres;
                String matricule;
                int iddept;

                try {
                    Object object = parser.parse(request.getParameter("params"));
                    objetjson = dao.objectToJSONObject(object);
                    if (objetjson == null) {
                        parametres = dao.objectToJSONArray(object);
                        JSONObject jsonobject = (JSONObject) parametres.get(0);
                        params = (JSONObject) jsonobject.getJSONObject("params");
                        matricule = params.getString("matricule");
                        iddept = params.getInt("departement");
                    } else {
                        params = (JSONObject) objetjson.getJSONObject("params");
                        matricule = params.getString("matricule");
                        iddept = params.getInt("departement");
                    }
                    JSONObject jsonobject = new JSONObject();
                    jsonobject.put("resultat", dao.checkEnseignantChefDepartement(matricule, iddept) ? 1 : 0);
                    PrintWriter writer = response.getWriter();
                    writer.write(jsonobject.toString());
                } catch (ParseException | JSONException ex) {
                    Logger.getLogger(ListeEnseignantDeptServelt.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                this.getServletContext().getRequestDispatcher("/WEB-INF/Accueil.jsp").forward(request, response);
            }
        } else {
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("login") != null) {
            JSONParser parser = new JSONParser();
            JSONObject params;
            JSONObject objetjson;
            JSONArray parametres;
            String matricule;
            int iddept;

            try {
                Object object = parser.parse(request.getParameter("params"));
                objetjson = dao.objectToJSONObject(object);
                if (objetjson == null) {
                    parametres = dao.objectToJSONArray(object);
                    JSONObject jsonobject = (JSONObject) parametres.get(0);
                    params = (JSONObject) jsonobject.getJSONObject("params");
                    matricule = params.getString("matricule");
                    iddept = params.getInt("departement");
                } else {
                    params = (JSONObject) objetjson.getJSONObject("params");
                    matricule = params.getString("matricule");
                    iddept = params.getInt("departement");
                }
                JSONObject jsonobject = new JSONObject();
                jsonobject.put("resultat", dao.nommerChefDepartement(matricule, iddept) ? 1 : 0);
                PrintWriter writer = response.getWriter();
                writer.write(jsonobject.toString());
            } catch (ParseException | JSONException ex) {
                Logger.getLogger(ListeEnseignantDeptServelt.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }

    }

}

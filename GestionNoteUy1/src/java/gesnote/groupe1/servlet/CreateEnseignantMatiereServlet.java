/**
 * @author groupe1
 */
package gesnote.groupe1.servlet;

import entities.Enseignant;
import entities.EnseignantMat;
import entities.Matiere;
import gesnote.groupe1.modeles.AdminDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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

@WebServlet(name = "CreateEnseignantMatiereServlet", urlPatterns = {"/createenseignantmatiere"})
public class CreateEnseignantMatiereServlet extends HttpServlet {

    @EJB
    AdminDao dao = new AdminDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        if (session.getAttribute("login") != null) {
        if (request.getParameter("params") != null) {
            JSONParser parser = new JSONParser();
            JSONObject objetjson;
            JSONArray parametres;
            String matricule;
            int idclasse;
            int idmatiere;
            try {
                Object object = parser.parse(request.getParameter("params"));
                objetjson = dao.objectToJSONObject(object);
                if (objetjson == null) {
                    parametres = dao.objectToJSONArray(object);
                    JSONObject jsonobject = (JSONObject) parametres.get(0);
                    JSONObject params = (JSONObject) jsonobject.getJSONObject("params");
                    matricule = params.getString("matricule");
                    idclasse = params.getInt("idclasse");
                    idmatiere = params.getInt("idmatiere");
                } else {
                    JSONObject params = (JSONObject) objetjson.getJSONObject("params");
                    matricule = params.getString("matricule");
                    idclasse = params.getInt("idclasse");
                    idmatiere = params.getInt("idmatiere");
                }

                JSONObject jsonobject = new JSONObject();
                jsonobject.put("resultat", dao.addEnseignantMatiere(matricule, idclasse, idmatiere) ? 1 : 0);
                PrintWriter writer = response.getWriter();
                writer.write(jsonobject.toString());

            } catch (ParseException | JSONException ex) {
                Logger.getLogger(ConnectServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (request.getParameter("menu") != null) {
            request.setAttribute("menu", request.getParameter("menu"));
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/Accueil.jsp").forward(request, response);
        //}else{
        //this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        //}
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//         HttpSession session = request.getSession();
//        if (session.getAttribute("login") != null) {
        JSONParser parser = new JSONParser();
        JSONObject objetjson;
        JSONArray parametres;
        String matricule;
        int idclasse;
        int idmatiere;
        try {
            Object object = parser.parse(request.getParameter("params"));
            objetjson = dao.objectToJSONObject(object);
            if (objetjson == null) {
                parametres = dao.objectToJSONArray(object);
                JSONObject jsonobject = (JSONObject) parametres.get(0);
                JSONObject params = (JSONObject) jsonobject.getJSONObject("params");
                matricule = params.getString("matricule");
                idclasse = params.getInt("idclasse");
                idmatiere = params.getInt("idmatiere");
            } else {
                JSONObject params = (JSONObject) objetjson.getJSONObject("params");
                matricule = params.getString("matricule");
                idclasse = params.getInt("idclasse");
                idmatiere = params.getInt("idmatiere");
            }
            Enseignant ens = dao.getEnseignatByPk(matricule);
            Matiere mat = dao.getMatiereByPK(idmatiere);
            boolean trouver = false;
            JSONObject jsonobject = new JSONObject();

            List<EnseignantMat> listEns = mat.getEnseignantMatList();
            for (EnseignantMat ensmat : listEns) {
                if (ensmat.getMatricule().equals(ens)) {
                    trouver = true;
                }
            }
            if (trouver) {
                jsonobject.put("resultat", 2);
            } else {
                jsonobject.put("resultat", dao.addEnseignantMatiere(matricule, idclasse, idmatiere) ? 1 : 0);
            }
            PrintWriter writer = response.getWriter();
            writer.write(jsonobject.toString());

        } catch (ParseException | JSONException ex) {
            Logger.getLogger(ConnectServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
//        } else {
//            this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
//        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>

}

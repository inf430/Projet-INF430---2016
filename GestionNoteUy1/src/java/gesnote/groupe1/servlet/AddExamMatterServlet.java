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

@WebServlet(urlPatterns = {"/addexammatter"})
public class AddExamMatterServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        if ( session.getAttribute("login") != null ){
            
        }else{
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
        }
        if ( request.getParameter("menu") != null ){
            request.setAttribute("menu",request.getParameter("menu"));
        }
        if (request.getParameter("params") != null) {
            JSONParser parser = new JSONParser();
            JSONObject objetjson;
            JSONArray parametres;
            int matiere;
            int examen;
            try {
                Object object = parser.parse(request.getParameter("params"));
                objetjson = dao.objectToJSONObject(object);
                if (objetjson == null) {
                    parametres = dao.objectToJSONArray(object);
                    JSONObject jsonobject = (JSONObject) parametres.get(0);
                    JSONObject params = (JSONObject) jsonobject.getJSONObject("params");
                    matiere = params.getInt("matiere");
                    examen = params.getInt("examen");
                } else {
                    JSONObject params = (JSONObject) objetjson.getJSONObject("params");
                    matiere = params.getInt("matiere");
                    examen = params.getInt("examen");

                }

                JSONObject jsonobject = new JSONObject();
                jsonobject.put("resultat", dao.existAssocMatiereExam(matiere, examen) ? 1 : 0);
                PrintWriter writer = response.getWriter();
                writer.write(jsonobject.toString());

            } catch (ParseException | JSONException ex) {
                Logger.getLogger(ConnectServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            this.getServletContext().getRequestDispatcher("/WEB-INF/Accueil.jsp").forward(request, response);
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
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if ( session.getAttribute("login") != null ){
            JSONParser parser = new JSONParser();
        JSONObject objetjson;
        JSONArray parametres;
        int matiere;
        int examen;
        int pourcentage;
        try {
            Object object = parser.parse(request.getParameter("params"));
            objetjson = dao.objectToJSONObject(object);
            if (objetjson == null) {
                parametres = dao.objectToJSONArray(object);
                JSONObject jsonobject = (JSONObject) parametres.get(0);
                JSONObject params = (JSONObject) jsonobject.getJSONObject("params");
                matiere = params.getInt("matiere");
                examen = params.getInt("examen");
                pourcentage = params.getInt("pourcentage");
            } else {
                JSONObject params = (JSONObject) objetjson.getJSONObject("params");
                matiere = params.getInt("matiere");
                examen = params.getInt("examen");
                pourcentage = params.getInt("pourcentage");

            }

            JSONObject jsonobject = new JSONObject();
            jsonobject.put("resultat", dao.associateExamMatter(matiere, examen, pourcentage) ? 1 : 0);
            PrintWriter writer = response.getWriter();
            writer.write(jsonobject.toString());

        } catch (ParseException | JSONException ex) {
            Logger.getLogger(ConnectServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        }else{
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
        }
    }

}

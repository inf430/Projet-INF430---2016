/**
 * @author groupe1
 */
package gesnote.groupe1.servlet;

import entities.Matiere;
import gesnote.groupe1.modeles.AdminDao;
import gesnote.groupe4.modeles.DashboardDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

@WebServlet(urlPatterns = {"/matiereue"})
public class AddNewMatiere extends HttpServlet {

    @EJB
    AdminDao dao = new AdminDao();
    
    @EJB
    DashboardDao dashboardDao = new DashboardDao();

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
        if (session.getAttribute("login") != null) {
            if (request.getParameter("menu") != null) {
                request.setAttribute("menu", request.getParameter("menu"));
            }
            if (request.getParameter("params") != null) {
                JSONParser parser = new JSONParser();
                JSONObject objetjson;
                JSONArray parametres;
                int matiere;
                String codeUe;
                try {
                    Object object = parser.parse(request.getParameter("params"));
                    objetjson = dao.objectToJSONObject(object);
                    if (objetjson == null) {
                        parametres = dao.objectToJSONArray(object);
                        JSONObject jsonobject = (JSONObject) parametres.get(0);
                        JSONObject params = (JSONObject) jsonobject.getJSONObject("params");
                        matiere = params.getInt("matiere");
                        codeUe = params.getString("code");
                    } else {
                        JSONObject params = (JSONObject) objetjson.getJSONObject("params");
                        matiere = params.getInt("matiere");
                        codeUe = params.getString("code");

                    }

                    JSONObject jsonobject = new JSONObject();
                    jsonobject.put("resultat", dao.existAssocMatUe(codeUe, matiere) ? 1 : 0);
                    PrintWriter writer = response.getWriter();
                    writer.write(jsonobject.toString());
                } catch (ParseException | JSONException ex) {
                    Logger.getLogger(AddNewMatiere.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if (request.getParameter("ue") != null) {
                String codeUe = request.getParameter("ue");
                ArrayList<Matiere> listeMatiere = dao.getMatiereUe(codeUe);
                request.setAttribute("listeMatiere", listeMatiere);
                request.setAttribute("ue", codeUe);
                this.getServletContext().getRequestDispatcher("/WEB-INF/Accueil.jsp").forward(request, response);
            } else {
                
                request.setAttribute("listRequetesATraiter", dashboardDao.listRequete("en_cours", 10));
                request.setAttribute("requeteNonTraiter", dashboardDao.nbreRequeteNonTraiter("info"));
                request.setAttribute("inscritsParMatiere", dashboardDao.inscritsParMatiere("2015-2016", 4));
                this.getServletContext().getRequestDispatcher("/WEB-INF/Accueil.jsp").forward(request, response);
            }
        } else {
                request.setAttribute("listRequetesATraiter", dashboardDao.listRequete("en_cours", 10));
                request.setAttribute("requeteNonTraiter", dashboardDao.nbreRequeteNonTraiter("info"));
                request.setAttribute("inscritsParMatiere", dashboardDao.inscritsParMatiere("2015-2016", 4));
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
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("login") != null) {
            JSONParser parser = new JSONParser();
            JSONObject objetjson;
            JSONArray parametres;
            int matiere;
            String codeUe;
            int credit;
            try {
                Object object = parser.parse(request.getParameter("params"));
                objetjson = dao.objectToJSONObject(object);
                if (objetjson == null) {
                    parametres = dao.objectToJSONArray(object);
                    JSONObject jsonobject = (JSONObject) parametres.get(0);
                    JSONObject params = (JSONObject) jsonobject.getJSONObject("params");
                    matiere = params.getInt("matiere");
                    codeUe = params.getString("code");
                    credit = params.getInt("credit");
                } else {
                    JSONObject params = (JSONObject) objetjson.getJSONObject("params");
                    matiere = params.getInt("matiere");
                    codeUe = params.getString("code");
                    credit = params.getInt("credit");

                }

                JSONObject jsonobject = new JSONObject();
                jsonobject.put("resultat", dao.associateUematiere(matiere, codeUe, credit) ? 1 : 0);
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

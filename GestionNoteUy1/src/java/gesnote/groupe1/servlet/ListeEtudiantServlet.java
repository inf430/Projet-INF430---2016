/**
 * @author groupe1
 */
package gesnote.groupe1.servlet;

import entities.Classe;
import entities.Departement;
import entities.EtudiantClasse;
import entities.Filiere;
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

@WebServlet(name = "ListeEtudiantsServlet", urlPatterns = {"/liste-etudiants"})
public class ListeEtudiantServlet extends HttpServlet {

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
            this.getServletContext().getRequestDispatcher("/WEB-INF/Accueil.jsp").forward(request, response);
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
            JSONObject params;
            JSONObject objetjson;
            JSONArray parametres;
            String objet;
            int idDept;
            int idFiliere;
            int idclasse;

            try {
                Object object = parser.parse(request.getParameter("params"));
                objetjson = dao.objectToJSONObject(object);
                if (objetjson == null) {
                    parametres = dao.objectToJSONArray(object);
                    JSONObject jsonobject = (JSONObject) parametres.get(0);
                    params = (JSONObject) jsonobject.getJSONObject("params");
                    objet = params.getString("objet");
                } else {
                    params = (JSONObject) objetjson.getJSONObject("params");
                    objet = params.getString("objet");
                }
                JSONObject jsonobject = new JSONObject();

                if (null != objet) {
                    switch (objet) {
                        case "departement":
                            List<Departement> listedep = dao.getListeDepartement();
                            for (int i = 0; i < listedep.size(); i++) {
                                JSONObject courant = new JSONObject();
                                courant.put("id", listedep.get(i).getIddepartement());
                                courant.put("libelle", listedep.get(i).getLibelle());
                                jsonobject.put("" + i, courant);
                            }
                            break;
                        case "filiere":
                            idDept = params.getInt("iddept");
                            List<Filiere> listefil = dao.getListeFilieres(idDept);
                            for (int i = 0; i < listefil.size(); i++) {
                                JSONObject courant = new JSONObject();
                                courant.put("id", listefil.get(i).getIdfiliere());
                                courant.put("libelle", listefil.get(i).getLibelle());
                                jsonobject.put("" + i, courant);
                            }

                            break;
                        case "classe":
                            idFiliere = params.getInt("idfiliere");
                            List<Classe> listeclasse = dao.getListeClasses(idFiliere);

                            int p = 0;
                            for (Classe classe : listeclasse) {
                                JSONObject courant = new JSONObject();
                                courant.put("id", classe.getIdclasse());
                                courant.put("nom", classe.getNom());
                                jsonobject.put("" + p, courant);
                                p++;
                            }
                            break;
                        case "etudiant":
                            idclasse = params.getInt("idclasse");
                            List<EtudiantClasse> liste_et = dao.getListeEtudiantsClasse(idclasse);

                            int cpt = 0;
                            for (EtudiantClasse ec : liste_et) {
                                JSONObject courant = new JSONObject();
                                courant.put("matricule", ec.getMatricule().getMatricule());
                                courant.put("nom", ec.getMatricule().getIdpersonne().getNom());
                                courant.put("prenom", ec.getMatricule().getIdpersonne().getPrenom());
                                courant.put("datenaiss", ec.getMatricule().getIdpersonne().getDatenaiss());
                                courant.put("lieunaiss", ec.getMatricule().getIdpersonne().getLieunaiss());
                                courant.put("numtel", ec.getMatricule().getIdpersonne().getNumtel());
                                courant.put("sexe", ec.getMatricule().getIdpersonne().getSexe());
                                jsonobject.put("" + cpt, courant);
                                cpt++;
                            }
                            break;
                        default:
                            break;
                    }
                }

                PrintWriter writer = response.getWriter();
                writer.write(jsonobject.toString());
            } catch (ParseException | JSONException ex) {
                Logger.getLogger(ListeEtudiantServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }

    }

}

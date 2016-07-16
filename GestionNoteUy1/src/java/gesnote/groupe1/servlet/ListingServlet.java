/**
 * @author groupe1
 */
package gesnote.groupe1.servlet;

import entities.*;
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
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@WebServlet(name = "ListingServlet", urlPatterns = {"/listing"})
public class ListingServlet extends HttpServlet {

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
        JSONObject params;
        String objet;
        int iddep = 0;
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
                        List<Filiere> listefil = dao.getListeFiliere();
                        for (int i = 0; i < listefil.size(); i++) {
                            JSONObject courant = new JSONObject();
                            courant.put("id", listefil.get(i).getIdfiliere());
                            courant.put("code", listefil.get(i).getCode());
                            jsonobject.put("" + i, courant);
                        }

                        break;
                    case "type":
                        List<Semestre> listetyp = dao.getListeSemestre();
                        for (int i = 0; i < listetyp.size(); i++) {
                            JSONObject courant = new JSONObject();
                            courant.put("id", listetyp.get(i).getIdsemestre());
                            courant.put("libelle", listetyp.get(i).getSemestre());
                            jsonobject.put("" + i, courant);
                        }

                        break;

                    case "examen":
                        List<Examen> listeexam = dao.getListeExamen();
                        for (int i = 0; i < listeexam.size(); i++) {
                            JSONObject courant = new JSONObject();
                            courant.put("id", listeexam.get(i).getIdexamen());
                            courant.put("type", listeexam.get(i).getTypeExam());
                            jsonobject.put("" + i, courant);
                        }

                        break;

                    case "matiere":
                        List<Matiere> listemat = dao.getListeMatiere();
                        for (int i = 0; i < listemat.size(); i++) {
                            JSONObject courant = new JSONObject();
                            courant.put("id", listemat.get(i).getIdmatiere());
                            courant.put("code", listemat.get(i).getCode());
                            jsonobject.put("" + i, courant);
                        }

                        break;

                    case "semestre":
                        List<Semestre> listesem = dao.getListeSemestre();
                        for (int i = 0; i < listesem.size(); i++) {
                            JSONObject courant = new JSONObject();
                            courant.put("id", listesem.get(i).getIdsemestre());
                            courant.put("libelle", listesem.get(i).getSemestre());
                            jsonobject.put("" + i, courant);
                        }
                        break;
                    case "ue":
                        List<Ue> listeue = dao.getListeUe();
                        for (int i = 0; i < listeue.size(); i++) {
                            JSONObject courant = new JSONObject();
                            courant.put("code", listeue.get(i).getCode());
                            courant.put("libelle", listeue.get(i).getLibelle());
                            jsonobject.put("" + i, courant);
                        }
                        break;
                    case "login":
                        List<Personne> listepersonne = dao.getListePersonne();
                        int i = 0;
                        for (Personne personne : listepersonne) {
                            JSONObject courant = new JSONObject();
                            courant.put("login", personne.getLogin());
                            courant.put("nom", personne.getNom());
                            courant.put("prenom", personne.getPrenom());
                            jsonobject.put("" + i, courant);
                            i++;
                        }
                        break;
                    case "role":
                        List<Role> listerole = dao.getListeRole();
                        int j = 0;
                        for (Role role : listerole) {
                            JSONObject courant = new JSONObject();
                            courant.put("id", role.getIdrole());
                            courant.put("role", role.getRole());
                            jsonobject.put("" + j, courant);
                            j++;
                        }
                        break;
                    case "droit":
                        List<Droit> listedroit = dao.getListeDroit();
                        int d = 0;
                        for (Droit droit : listedroit) {
                            JSONObject courant = new JSONObject();
                            courant.put("id", droit.getIddroit());
                            courant.put("nom", droit.getNom());
                            jsonobject.put("" + d, courant);
                            d++;
                        }
                        break;
                    case "etudiant":
                        List<Etudiant> listeetudiant = dao.getListeEtudiant();
                        int k = 0;
                        for (Etudiant etudiant : listeetudiant) {
                            JSONObject courant = new JSONObject();
                            courant.put("matricule", etudiant.getMatricule());
                            courant.put("nom", etudiant.getIdpersonne().getNom());
                            courant.put("prenom", etudiant.getIdpersonne().getPrenom());
                            jsonobject.put("" + k, courant);
                            k++;
                        }
                        break;
                    case "classe":
                        List<Classe> listeclasse = dao.getListeClasse();
                        int p = 0;
                        for (Classe classe : listeclasse) {
                            JSONObject courant = new JSONObject();
                            courant.put("nom", classe.getNom());
                            courant.put("id", classe.getIdclasse());
                            jsonobject.put("" + p, courant);
                            p++;
                        }
                        break;
                    case "ensdep":
                        iddep = params.getInt("departement");
                        List<Enseignant> listeens = dao.getEnseignantsByDepartement(iddep);
                        for (int m = 0; m < listeens.size(); m++) {
                            JSONObject courant = new JSONObject();
                            courant.put("matricule", listeens.get(m).getMatricule());
                            courant.put("nom", listeens.get(m).getIdpersonne().getNom());
                            courant.put("prenom", listeens.get(m).getIdpersonne().getPrenom());
                            jsonobject.put("" + m, courant);
                        }

                        break;
                    case "clasdep":
                        iddep = params.getInt("departement");
                        List<Classe> listeclas = dao.getClassesByDepartement(iddep);
                        for (int l = 0; l < listeclas.size(); l++) {
                            JSONObject courant = new JSONObject();
                            courant.put("idclasse", listeclas.get(l).getIdclasse());
                            courant.put("nom", listeclas.get(l).getNom());
                            jsonobject.put("" + l, courant);
                        }

                        break;
                    case "matclas":
                        iddep = params.getInt("departement");
                        //ici la variable iddep contient la classe 
                        List<Matiere> listemats = dao.getMatieresByClass(iddep);
                        for (int o = 0; o < listemats.size(); o++) {
                            JSONObject courant = new JSONObject();
                            courant.put("idmatiere", listemats.get(o).getIdmatiere());
                            courant.put("code", listemats.get(o).getCode());
                            jsonobject.put("" + o, courant);
                        }

                        break;
                    default:
                        break;
                }
            }

            PrintWriter writer = response.getWriter();
            writer.write(jsonobject.toString());

        } catch (ParseException | JSONException ex) {
            Logger.getLogger(ConnectServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}

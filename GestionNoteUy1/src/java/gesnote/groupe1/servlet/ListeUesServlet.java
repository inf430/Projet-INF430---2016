/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe1.servlet;

import entities.Classe;
import entities.Departement;
import entities.Filiere;
import entities.UeClasse;
import gesnote.groupe1.modeles.AdminDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.List;
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

@WebServlet(urlPatterns = {"/liste"})
public class ListeUesServlet extends HttpServlet {

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
            this.getServletContext().getRequestDispatcher("/WEB-INF/Accueil.jsp").forward(request, response);
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
                        case "ue":
                            idclasse = params.getInt("idclasse");
                            List<UeClasse> listeues = dao.getUeClasseByIdClasse(idclasse);

                            int cpt = 0;
                            for (UeClasse ue : listeues) {
                                JSONObject courant = new JSONObject();
                                courant.put("code", ue.getCode().getCode());
                                courant.put("libelle", ue.getCode().getLibelle());
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
                Logger.getLogger(ListeUesServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }

    }

}

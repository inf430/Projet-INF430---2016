/**
 * @Author groupe1
 */
package gesnote.groupe1.servlet;

import entities.*;
import gesnote.groupe1.modeles.AdminDao;
import gesnote.groupe4.modeles.DashboardDao;
import gesnote.groupe4.modeles.ReportDao;
import gesnote.groupe6.modeles.ChefDptDao;
import gesnote.groupe6.modeles.ConsulterDecanatDao;
import gesnote.groupe6.modeles.EJB_Inscription;
import gesnote.groupe6.modeles.EnseignantFacade;
import gesnote.groupe6.modeles.EnseignantMatFacade;
import gesnote.groupe6.modeles.EtudiantDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Vector;
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

    @EJB
    ReportDao reportDao = new ReportDao();

    @EJB
    DashboardDao dashboardDao = new DashboardDao();
    
    
    
    @EJB
    EnseignantMatFacade EMF;
     @EJB
     EtudiantDao ED;
     @EJB
    ChefDptDao chefDao = new ChefDptDao();
      
         @EJB
    ConsulterDecanatDao consulterDecanatDao = new ConsulterDecanatDao();
    @EJB
    EJB_Inscription ei;
    @EJB
    EnseignantFacade EF;
    

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
        JSONParser parser = new JSONParser();
        JSONObject jsonobject1 = new JSONObject();
        PrintWriter writer = response.getWriter();
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
                JSONObject params = (JSONObject) jsonobject.getJSONObject("params");
                login = (String) params.getString("login");
                password = dao.getMD5((String) params.getString("password"));
            } else {
                JSONObject params = (JSONObject) objetjson.getJSONObject("params");
                login = (String) params.getString("login");
                password = dao.getMD5((String) params.getString("password"));
            }
        } catch (ParseException | JSONException ex) {
            Logger.getLogger(ConnectServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (!dao.exist(login, password)) {
            try {
                jsonobject1.put("reponse", "login ou password incorrect");
            } catch (JSONException ex) {
                Logger.getLogger(ConnectServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            try {
                jsonobject1.put("reponse", "correct");
            } catch (JSONException ex) {
                Logger.getLogger(ConnectServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        writer.write(jsonobject1.toString());
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
        String login = request.getParameter("login");
        String password = dao.getMD5(request.getParameter("password"));

        HttpSession session = request.getSession();

        request.setAttribute("listRequetesATraiter", dashboardDao.listRequete("en_cours", 10));
        request.setAttribute("requeteNonTraiter", dashboardDao.nbreRequeteNonTraiter("info"));
        request.setAttribute("inscritsParMatiere", dashboardDao.inscritsParMatiere("2015-2016", 4));
//        this.getServletContext().getRequestDispatcher("/WEB-INF/groupe4/dashboard.jsp").forward(request, response);

        if (dao.isAdmin(login, password)) {
            Administrateur admin = dao.getAdmin(login, password);
            session.setAttribute("login", admin.getLogin());
            session.setAttribute("id", admin.getIdadmin());
            this.getServletContext().getRequestDispatcher("/WEB-INF/groupe1/Accueil_admin.jsp").forward(request, response);
        } else {
            Personne personne = dao.getPersonne(login, password);
            session.setAttribute("login", personne.getLogin());
            session.setAttribute("id", personne.getIdpersonne());
            session.setAttribute("type", personne.getStatut());
            session.setAttribute("nom", personne.getNom());
            session.setAttribute("prenom", personne.getPrenom());
            
                             /** Ajout du groupe6 pour gérer le chef de département **/
            EnseignantChefDepartement chief = dao.getChief(login, password);
            if (chief != null) {
                
                session.setAttribute("type", "chefDepartement");
                session.setAttribute("chefDpt", chief);
                chefDao.setIdEcd(request);
                List<String> classesDpt = chefDao.getClasses();
                List<Matiere> matsDpt = chefDao.getMatDpt();
                System.out.print(classesDpt.get(0));
                request.setAttribute("classesDpt", classesDpt);
                request.setAttribute("matsDpt", matsDpt);
            }else{
                switch (personne.getStatut()) {
                    case "etudiant":
                        session.setAttribute("etudiant", personne.getEtudiant());
                        Etudiant etudiant=ED.trouverEtudiant(personne.getIdpersonne());

                        Vector<Inscription> list = ei.Liste_Inscription_Etudiant(etudiant);
                          Vector <Matiere> listeMatiere=new Vector();
                          for(Inscription m:list){
                              listeMatiere.add(m.getIdmatiere());

                          }

                       request.getSession().setAttribute("etudiant", etudiant);
                       request.getSession().setAttribute("listeMatiere", listeMatiere);
                       request.setAttribute("listeMatiere", listeMatiere);
                       request.setAttribute("etudiant", etudiant);
                
                        break;
                    case "enseignant":
                        session.setAttribute("enseignant", personne.getEnseignant());
                        
                        Enseignant enseignant =EF.trouverEnseignant(personne.getIdpersonne());
                        Vector<EnseignantMat> lis=EMF.chercherEnseignantMat(enseignant);
                        Vector<Matiere> listeEnsMat=new Vector();
                        for(EnseignantMat m:lis){
                            listeEnsMat.add(m.getIdmatiere());
                        }

                        session.setAttribute("listeEnsMat",listeEnsMat );
                         request.setAttribute("listeEnsMat",listeEnsMat );
                        
                        if(dao.checkPresidentJury(personne.getEnseignant().getMatricule())){
                            session.setAttribute("jury", personne.getEnseignant());
                            session.setAttribute("type", "jury");
                        }
                        break;
                    default:
                        session.setAttribute("administratif", personne);
                        
                        Vector<Filiere> filieres = (Vector)consulterDecanatDao.findFiliereAll();
                        Vector<Niveau> niveaux = (Vector)consulterDecanatDao.findNiveauAll();
                        Vector<Matiere> matieres = (Vector)consulterDecanatDao.findMatiereAll();
                        Vector<AnneeAcademique> anneeAcademiques = (Vector)consulterDecanatDao.findAnneeAcademiqueAll();
                        Vector<Departement> departements = (Vector)consulterDecanatDao.findDepartementAll();
                        session.setAttribute("filieres",filieres);
                        session.setAttribute("niveaux",niveaux);
                        session.setAttribute("annees",anneeAcademiques);
                        session.setAttribute("matieres",matieres);
                        session.setAttribute("departements",departements);

                        break;
                }
            }
            this.getServletContext().getRequestDispatcher("/WEB-INF/Accueil.jsp").forward(request, response);
        }

    }

}

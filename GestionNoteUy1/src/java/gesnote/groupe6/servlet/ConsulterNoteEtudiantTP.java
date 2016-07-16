/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.servlet;

import static com.mchange.v2.c3p0.impl.C3P0Defaults.password;
import entities.Etudiant;
import entities.EtudiantExam;
import entities.Inscription;
import entities.Matiere;
import entities.MatiereUe;
import entities.Personne;
import entities.UeClasse;
import gesnote.groupe1.modeles.AdminDao;
import gesnote.groupe6.modeles.AnneeAcademiqueFacade;
import gesnote.groupe6.modeles.ChefDptDao;
import gesnote.groupe6.modeles.ClasseFacade;
import gesnote.groupe6.modeles.ConsulterDecanatDaoNouvo;
import gesnote.groupe6.modeles.DepartementFacade;
import gesnote.groupe6.modeles.EJB_Inscription;
import gesnote.groupe6.modeles.EnseignantFacade;
import gesnote.groupe6.modeles.EnseignantMatFacade;
import gesnote.groupe6.modeles.EtudiantDaoNouvo;
import gesnote.groupe6.modeles.EtudiantExamFacade;
import gesnote.groupe6.modeles.EtudiantFacade;
import gesnote.groupe6.modeles.FiliereFacade;
import gesnote.groupe6.modeles.MatiereFacade;
import gesnote.groupe6.modeles.MatiereUeFacade;
import gesnote.groupe6.modeles.NiveauFacade;
import gesnote.groupe6.modeles.UeClasseFacade;
import gesnote.groupe6.modeles.UeFacade;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import javax.ejb.EJB;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static sun.security.jgss.GSSUtil.login;

/**
 *
 * @author Colombo
 */
@WebServlet(name = "ConsulterNoteEtudiantTP", urlPatterns = {"/ConsulterNoteEtudiantTP"})
public class ConsulterNoteEtudiantTP extends HttpServlet {

     @EJB
    AdminDao dao = new AdminDao();
    @EJB
    ChefDptDao chefDao = new ChefDptDao();
     @EJB
    EnseignantMatFacade EMF;
     @EJB
     EtudiantDaoNouvo ED;
      @EJB
    FiliereFacade ff;
    @EJB
    NiveauFacade nf;
    @EJB
    UeClasseFacade ueclf;
    @EJB
    DepartementFacade depf;
    @EJB
    AnneeAcademiqueFacade acf;
    
    @EJB
    ConsulterDecanatDaoNouvo cdd;
         
    @EJB
    EJB_Inscription ei;
      @EJB
   ConsulterDecanatDaoNouvo consulterDecanatDao;
    
   @EJB
   ClasseFacade cf;
   @EJB
   UeFacade uef;
   @EJB
   EnseignantFacade ef;
   @EJB
   EtudiantFacade etudf;
   @EJB
   MatiereFacade mf;
   @EJB
   MatiereUeFacade mef;
   @EJB
   EtudiantExamFacade etudexf;
 
   @EJB
   DepartementFacade deptf;
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

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
        
        //EtudiantExam CC = new EtudiantExam(3); /* ici 3 représente idexamen pour CC*/
           
           //Vector<EtudiantExam> list = et.Liste_Note_Etudiant(CC);
           //MatiereUe matue = (MatiereUe)mef.findByCodeUe(ueCode);
            //UeClasse uecl = (UeClasse)ueclf.findByCodeUe(ueCode);
            //List<EtudiantExam> etudex = (List<EtudiantExam>)etudexf.findNotes(uecl.getIdclasse().getIdclasse(), matue.getIdmatiere().getIdmatiere(), listerId,annee);
            //request.setAttribute("uecl",uecl);
            //request.setAttribute("etudex",etudex);
            //request.setAttribute("annee",annee);
            //request.setAttribute("listerId",listerId);
            //request.setAttribute("matue",matue);
            //  String login = request.getParameter("login");
        //String password = dao.getMD5(request.getParameter("password"));
        //HttpSession session = request.getSession();
          //  Personne personne = dao.getPersonne(login, password);
            //session.setAttribute("login", personne.getLogin());
            //session.setAttribute("id", personne.getIdpersonne());
          // session.setAttribute("type", personne.getStatut());
         // int id=(int) request.getAttribute("id");
              Etudiant etudiant=ED.trouverEtudiant(1);
                
                    Vector<Inscription> list = ei.Liste_Inscription_Etudiant(etudiant);
                   Vector <Matiere> listeMatiere=new Vector();
                   for(Inscription m:list){
                       listeMatiere.add(m.getIdmatiere());
                   }
                   
                   request.getSession().setAttribute("etudiant", etudiant);
                request.getSession().setAttribute("listeMatiere", listeMatiere);
                request.setAttribute("listeMatiere", listeMatiere);
                request.setAttribute("etudiant", etudiant);
            
           String matiere=request.getParameter("matiere");
           //String matiere="inf401";
           Integer matiereId=cdd.findIdMatiere(matiere);
           
           //out.println("matiereId="+matiereId);
           List<EtudiantExam> liste = cdd.findNote(matiereId,"tp");
           request.setAttribute("liste", liste);
           
            this.getServletContext().getRequestDispatcher( "/WEB-INF/groupe7/Notes_Etudiants_dec_chris.jsp").forward( request, response ) ;
      
    }

   

    

}

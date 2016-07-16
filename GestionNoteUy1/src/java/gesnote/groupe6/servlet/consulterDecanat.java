/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.servlet;

import static com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type.Int;
import entities.AnneeAcademique;
import entities.Classe;
import entities.Departement;
import entities.Enseignant;
import entities.Etudiant;
import entities.EtudiantExam;
import entities.Matiere;
import entities.MatiereUe;
import entities.Ue;
import entities.UeClasse;
import gesnote.groupe6.modeles.ConsulterDecanatDao;
import gesnote.groupe6.modeles.MatiereFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Vector;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sun.rmi.runtime.Log;

/**
 *
 * @author Eddy
 */
@WebServlet(name = "consulterDecanat", urlPatterns = {"/consulterDecanat"})
public class consulterDecanat extends HttpServlet {
  
   @EJB
   ConsulterDecanatDao consulterDecanatDao;
   
   private static final String CC = "cc";
   private static final String TP = "tp";
   private static final String NORMALE = "normale";
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
        String filiereCode = request.getParameter("filiere");
        String niveau = request.getParameter("niveau");
        String listerId = request.getParameter("lister");
        int matiereId = Integer.parseInt(request.getParameter("matiere"));
        String codeDept = request.getParameter("departement");
        String annee = request.getParameter("annee");
        //Integer matiereId = Integer.parseInt(request.getParameter("matiere")) ;
        Classe classe = (Classe)consulterDecanatDao.findClasseByFiliereIdAndNiveau(filiereCode, niveau);
//        Matiere matiere = (Matiere)mf.findById(matiereId);
        if(listerId.equals("1")){
            //lister les enseignants
            Vector<Enseignant> enseignants = (Vector)consulterDecanatDao.findEnseignantByDeptCode(codeDept);
            Departement departement = (Departement)consulterDecanatDao.findDepartementByDeptCode(codeDept);
            request.setAttribute("enseignants",enseignants);
            request.setAttribute("departement",departement);
            //request.setAttribute("listerId",listerId);
            this.getServletContext().getRequestDispatcher( "/WEB-INF/groupe7/Liste_Enseignants_dec.jsp").forward( request, response ) ;
            //Lister les enseignants
        }else if(listerId.equals("2")){
            //Lister les etudiants
            Vector<Etudiant> etudiants = (Vector)consulterDecanatDao.findEtudiantByClasseIdAnnee(classe.getIdclasse(),annee);
            request.setAttribute("etudiants",etudiants);
            request.setAttribute("classe",classe);
            request.setAttribute("annee",annee);
            request.setAttribute("listerId",listerId);
            this.getServletContext().getRequestDispatcher( "/WEB-INF/groupe7/Liste_Etudiants_dec.jsp").forward( request, response ) ;
        
        }else if(listerId.equals("3")){
            //Lister les matieres
            List<MatiereUe> matues = (List<MatiereUe>)consulterDecanatDao.findMatiereUeByClasseIdAnnee(classe.getIdclasse(),annee);
            request.setAttribute("matues",matues);
            request.setAttribute("classe",classe);
            request.setAttribute("annee",annee);
            request.setAttribute("listerId",listerId);
            this.getServletContext().getRequestDispatcher("/WEB-INF/groupe7/Liste_Matieres_dec.jsp").forward( request, response );
        
        }else if(listerId.equals("cc")||listerId.equals("tp")){
            //lister les notes de cc ou tp
            Matiere mat = (Matiere)consulterDecanatDao.findMatiereById(matiereId);
            List<EtudiantExam> etudex = (List<EtudiantExam>)consulterDecanatDao.findNotes(classe.getIdclasse(), matiereId, listerId,annee);
            request.setAttribute("classe",classe);
            request.setAttribute("etudex",etudex);
            request.setAttribute("annee",annee);
            request.setAttribute("type",listerId);
            request.setAttribute("mat",mat);
            this.getServletContext().getRequestDispatcher( "/WEB-INF/groupe7/Notes_Etudiants_dec.jsp").forward( request, response );
        }else if(listerId.equals("pv_par_matiere")){
            //lister les pv par matieres
            Matiere mat = (Matiere)consulterDecanatDao.findMatiereById(matiereId);
            List<EtudiantExam> notesExams = (List<EtudiantExam>)consulterDecanatDao.findNotes(classe.getIdclasse(), matiereId, NORMALE,annee);
            List<EtudiantExam> notesCCs = (List<EtudiantExam>)consulterDecanatDao.findNotes(classe.getIdclasse(), matiereId, CC,annee);
            request.setAttribute("classe",classe);
            request.setAttribute("mat",mat);
            request.setAttribute("notesExams",notesExams);
            request.setAttribute("notesCCs",notesCCs);
            request.setAttribute("annee",annee);
            request.setAttribute("type",listerId);
            this.getServletContext().getRequestDispatcher( "/WEB-INF/groupe7/PV_Etudiants_dec.jsp").forward( request, response );
        }else if(listerId.equals("pv_recap")){
            
        }else if(listerId.equals("4")){
            
        }else{
            
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

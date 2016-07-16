/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe5.servlet;

import com.google.gson.Gson;
import entities.Classe;
import entities.Enseignant;
import entities.Matiere;
import gesnote.groupe5.modeles.ModifCCModel;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dorian NJAMI
 */
@WebServlet(name = "ModificationServlet", urlPatterns = {"/modifCC"})
public class ModificationCCServlet extends HttpServlet {

    @EJB
    ModifCCModel modelCC = new ModifCCModel();
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
        Enseignant ens = (Enseignant) session.getAttribute("enseignant");
        String param = request.getParameter("type");
        request.setAttribute("title", "Modification des notes de CC");
        
        if(ens == null){
            ens = (Enseignant) session.getAttribute("jury");
        } 
        
        if(ens == null){
            
            this.getServletContext().getRequestDispatcher("/WEB-INF/groupe5/notesCC.jsp").forward(request, response);
        }
        else
        {
            if(param == null){
                List<Classe> classeEnseignants = modelCC.getClasseForEnseignant5(ens.getMatricule());
                System.out.println("nbClasses =" + classeEnseignants.size());
                request.setAttribute("classes", classeEnseignants);
                List<Matiere> mesMatieres = modelCC.getMatiereForEnseignantInClass5(ens.getMatricule(), classeEnseignants.get(0).getIdclasse());
                request.setAttribute("matieres", mesMatieres);
                this.getServletContext().getRequestDispatcher("/WEB-INF/groupe5/notesCC.jsp").forward(request, response);
            }else{
                String json = null;
                String idClasse, matricule;
                int idMatiere;
                switch(param){
                    case "getMatiere":
                        idClasse = request.getParameter("classe");
                        List<Matiere> mesMatieres = modelCC.getMatiereForEnseignantInClass5(ens.getMatricule(), Integer.valueOf(idClasse));
                        json = modelCC.getJsonForMatieresCCFromList5(mesMatieres);
                        break;
                    case "getNoteCC":
                        //idClasse = request.getParameter("classe");
                        matricule = request.getParameter("matricule");
                        idMatiere = Integer.parseInt(request.getParameter("matiere"));
                        Map<String, String> notes;
                        notes = modelCC.getNoteCCOfEtudiantInMatiere5(matricule, idMatiere);
                        System.out.println("note =" + notes.size());
                        String tableHTML = modelCC.getHTMLTableForNoteCCEtudiant5(notes);
                        System.out.println("html = " + tableHTML);
                        json = modelCC.getJsonFormHTMLTable5(tableHTML);
                        break;
                    case "save":
                        matricule = request.getParameter("matricule");
                        idMatiere = Integer.parseInt(request.getParameter("matiere"));
                        float note = Float.parseFloat(request.getParameter("note"));
                        System.out.println("matricule = " + matricule + " & idMatiere = " + idMatiere + " & note = " + note);
                        boolean result = modelCC.saveNoteCCOfEtudiantInMatiere5(matricule, idMatiere, note);
                        json = modelCC.getJsonFormHTMLTable5(String.valueOf(result));
                        break;
                }
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            }
            
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
    }


}

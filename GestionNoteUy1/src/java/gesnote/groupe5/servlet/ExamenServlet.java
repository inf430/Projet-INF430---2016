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
import gesnote.groupe5.modeles.ClasseModel;
import gesnote.groupe5.modeles.EvaluationModel;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author HP
 */
@WebServlet(name = "ExamenServlet", urlPatterns = {"/examen"})
public class ExamenServlet extends HttpServlet {

    @EJB
    EvaluationModel modelEval = new EvaluationModel();
    
    @EJB
    ClasseModel modelClasse = new ClasseModel();

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
        Enseignant presidentJury = (Enseignant) session.getAttribute("jury");
        String param = request.getParameter("type");
        request.setAttribute("title", "Modification des notes d'examen");
        if(presidentJury == null){
            System.out.print("Pas de jury");
            this.getServletContext().getRequestDispatcher("/WEB-INF/groupe5/examen_rattrapage.jsp").forward(request, response);
        }else{
             System.out.print("Connecté");
           if(param == null){
                Classe classeJury = modelClasse.getActualClasseOfJury(presidentJury);
                List<Matiere> mesMatieres = modelEval.getListOfMatieresInClass5(classeJury.getIdclasse());
                request.setAttribute("matieres", mesMatieres);
                this.getServletContext().getRequestDispatcher("/WEB-INF/groupe5/examen_rattrapage.jsp").forward(request, response);
            }else{
                
                String jsonText = null;
                switch(param){
                    case "getNotes":
                        int idMatiere = Integer.valueOf(request.getParameter("idMatiere"));
                        int idClasse = modelClasse.getActualClasseOfJury(presidentJury).getIdclasse();
                        List<Map<String, String>> mesNotes = modelEval.getAllNoteExamInMatiereForClass5(idMatiere, idClasse);
                        String tableHTML = modelEval.getHTMLTableForNoteExam5(mesNotes);
                        jsonText = modelEval.getJsonFormHTMLTable5(tableHTML);
                        response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");
                        response.getWriter().write(jsonText);
                        break;
                    case "sendNote":
                        boolean result = modelEval.saveNoteExamInMatiereForClass5(request);

                        response.getWriter().write(String.valueOf(result));

                        /*response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");

                        response.getWriter().write(new Gson().toJson(donnees));*/
                        break;
                }
                
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
        System.out.println("nb etudiant = " + request.getParameter("nb"));
        boolean result = modelEval.saveNoteExamInMatiereForClass5(request);
        
        Map<String, Boolean> donnees = new HashMap<>();
        donnees.put("result", result);
        
        response.getWriter().write(String.valueOf(result));

        /*response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        response.getWriter().write(new Gson().toJson(donnees));*/
    }

   
}

/*
 cette servlet recupere les données du formulaire requete et les enregistre dans la bd
@Djoko
 */
package gesnote.groupe6.servlet;

import entities.Etudiant;
import entities.Matiere;
import entities.Requete;
import gesnote.groupe6.modeles.MatiereFacade;
import gesnote.groupe6.modeles.RequeteFacade;

import java.io.IOException;
import java.util.List;
import java.util.Vector;
import javax.ejb.EJB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Armand
 */
@WebServlet(name = "SaisirRequeteEtudiantServlet", urlPatterns = {"/SaisirRequete"})
public class SaisirRequeteEtudiantServlet extends HttpServlet {
@EJB
RequeteFacade rf;
@EJB
MatiereFacade mf;
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
        this.getServletContext().getRequestDispatcher("/WEB-INF/groupe6/saisirRequeteEtudiant.jsp").forward(request, response);
    
       
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
            Requete r = new Requete( ) ;
            /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
           /* Récupération des champs du formulaire. */
           //String objet = request.getParameter( "objet" ) ;
           // String motif = request.getParameter( "motif" ) ;
            String code =  request.getParameter("matiere") ;
            Vector <Matiere> lis=(Vector)request.getSession().getAttribute("listeMatiere");
            Matiere mat=new Matiere();
            for(Matiere m:lis){
                if(m.getCode().equals(code)){
                    mat=m;
                    break;
                }
            }
          request.getSession().setAttribute("matiererequete", mat);
          request.setAttribute("etudiant",(Etudiant)request.getSession().getAttribute("etudiant"));
           
           /*          
           Matiere m = (Matiere) mf.getlistmatiere(code).get(0);
            
             Exécution d'une requête d'écriture 
            if ( motif!= null && m!= null && objet != null ) {
                rf.requete(et, m, objet, motif);
               }
*/
             //request.setAttribute("motif",code);
            this.getServletContext().getRequestDispatcher("/WEB-INF/groupe7/saisirRequete.jsp").forward(request, response);    
       
            
    }

  
}

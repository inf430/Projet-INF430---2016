 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.modeles;

import entities.Classe;
import entities.EnseignantChefDepartement;
import entities.Etudiant;
import entities.EtudiantExam;
import entities.Examen;
import entities.Matiere;
import entities.MatiereExam;
import entities.MatiereUe;
import entities.Ue;
import entities.UeClasse;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Colombo
 */

@Stateless
public class EtudiantDao {
    @PersistenceContext(unitName = "GestionNoteUy1PU")
    private EntityManager em;

    public void persist(Object object) {
        em.persist(object);
    }
    
  
    public Integer getIdEcd(HttpServletRequest request){
        Integer idEcd = ( (EnseignantChefDepartement) request.getSession()
                .getAttribute("chefDpt")).getIdenseignantchefdepartement();
        
        return idEcd;
    }
    
    
    public Integer getIdDpt(HttpServletRequest request){
        Integer idEcd = this.getIdEcd(request);
        String sql = "SELECT ecd.iddepartement.iddepartement FROM EnseignantChefDepartement ecd "
                       + "where ecd.idenseignantchefdepartement = :id_ecd ";
         Query req = em.createQuery(sql);
        Integer ecd = this.getIdEcd(request);
        req.setParameter("id_ecd", idEcd);
        Integer idDpt = (Integer) req.getSingleResult();
        
        return idDpt;
    }
    
    
      public List<String> getClasses(HttpServletRequest request){
        Integer idDpt = this.getIdDpt(request);
        String sql = "SELECT c  FROM Classe c "
                       + "where c.idfiliere.iddepartement.iddepartement = :id_dpt ";
        Query req = em.createQuery(sql);
        req.setParameter("id_dpt", idDpt);
        List<Classe> cls = req.getResultList();
        
        List<String> classes = new ArrayList<>();
        for(Classe cl: cls){
            classes.add(cl.getNom());
        }
        
        return classes;
    }
    
    
    
    public List<Ue> getUeDpt(HttpServletRequest request){
        Integer idDpt = this.getIdDpt(request);
        String sql = "SELECT uc FROM UeClasse uc "
                    + "where uc.idclasse.idfiliere.iddepartement.iddepartement=:id_dpt "; 
         Query req = em.createQuery(sql);
        req.setParameter("id_dpt", idDpt );
        
        List<UeClasse> ueClasses = req.getResultList();
        List<Ue> ues = new ArrayList<>();
        for(UeClasse uc: ueClasses){
            ues.add(uc.getCode());
        }
        return ues;    
    }
    
    
    
    public List<Matiere> getMatDpt(HttpServletRequest request){
        List<Ue> ues = this.getUeDpt(request);
        String sql = "SELECT mu FROM MatiereUe mu "
                    + "where mu.code IN :ues "; 
        Query req = em.createQuery(sql);
        req.setParameter("ues", ues );
        
        List<MatiereUe> matUes = req.getResultList();
        List<Matiere> mats = new ArrayList<>();
        for(MatiereUe mu: matUes){
            mats.add( mu.getIdmatiere() );
        }
        
        return mats;
    }
    
    
    public List<Examen> getExamMatiere(HttpServletRequest request){
        List<Matiere> mats = this.getMatDpt(request);
        String sql = "SELECT me FROM MatiereExam me "
                    + "where me.idmatiere IN :mats ";
        Query req = em.createQuery(sql);
        req.setParameter("mats", mats );
        
        List<MatiereExam> matExams = req.getResultList();
        List<Examen> exams = new ArrayList<>();
        for(MatiereExam me: matExams){
            exams.add( me.getIdexamen());
        }
        
        return exams;
    }
    
     public List<EtudiantExam> getEtudExam(HttpServletRequest request){
        List<Examen> exams = this.getExamMatiere(request);
        String sql = "SELECT ee FROM EtudiantExam ee "
                    + "where ee.idexamen IN :exams ";
        Query req = em.createQuery(sql);
        req.setParameter("exams", exams );
        
        List<EtudiantExam> etudExams = req.getResultList();
       return etudExams;   
    }
     
     public Etudiant trouverEtudiant(int i){
         String sql="SELECT e FROM Etudiant e where e.idpersonne.idpersonne=:id";
         Query requete=em.createQuery(sql);
         requete.setParameter("id", i);
         try{
             return (Etudiant)requete.getSingleResult();
         }catch(NoResultException e){
             
         }
         return null;
     }
    
}

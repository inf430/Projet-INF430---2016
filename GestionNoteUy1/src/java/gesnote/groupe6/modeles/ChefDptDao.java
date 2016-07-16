
package gesnote.groupe6.modeles;

import entities.Classe;
import javax.ejb.Stateless;
import java.util.List;
import entities.Personne;
import entities.EnseignantChefDepartement;
import entities.Enseignant;
import entities.Personne;
import entities.Etudiant;
import entities.EtudiantClasse;
import entities.EtudiantExam;
import entities.Examen;
import entities.Matiere;
import entities.MatiereExam;
import entities.MatiereUe;
import entities.Ue;
import entities.UeClasse;
import java.util.ArrayList;
import java.util.Vector;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaQuery;
import javax.servlet.http.HttpServletRequest;


/**
 *
 * @author JOSPIN
 */
@Stateless
public class ChefDptDao {

    @PersistenceContext(unitName = "GestionNoteUy1PU")
    private EntityManager em;
    private Integer idEcd = 0;

    public ChefDptDao() {
    }
    
    public void persist(Object object) {
        em.persist(object);
    }
    public void setIdEcd(HttpServletRequest request){
        this.idEcd = ( (EnseignantChefDepartement) request.getSession()
                .getAttribute("chefDpt")).getIdenseignantchefdepartement();
        
    }
    
    public Integer getIdDpt(){
        String sql = "SELECT ecd.iddepartement.iddepartement FROM EnseignantChefDepartement ecd "
                       + "where ecd.idenseignantchefdepartement = :id_ecd ";
         Query req = em.createQuery(sql);
        req.setParameter("id_ecd", this.idEcd);
        Integer idDpt = (Integer) req.getSingleResult();
        
        return idDpt;
    }
    
    
    public String getCodeDpt(){
        String sql = "SELECT ecd.iddepartement.code FROM EnseignantChefDepartement ecd "
                       + "where ecd.idenseignantchefdepartement = :id_ecd ";
        Query req = em.createQuery(sql);
        req.setParameter("id_ecd", this.idEcd);
        String codeDpt = (String) req.getSingleResult();
        return codeDpt;
    }
    
    
     public List<String> getClasses(){
        String sql = "SELECT c  FROM Classe c "
                       + "where c.idfiliere.iddepartement.iddepartement = :id_dpt ";
        Query req = em.createQuery(sql);
        req.setParameter("id_dpt", this.getIdDpt());
        List<Classe> cls = req.getResultList();
        
        List<String> classes = new ArrayList<>();
        for(Classe cl: cls){
            classes.add(cl.getNom());
        }
        
        return classes;
    }
    
    
    public List<Enseignant> getListeEnsDpt(String codeDpt){
        String sql = "SELECT e FROM Enseignant e where e.iddepartement.code=:code ";
        Query req = em.createQuery(sql);
        req.setParameter("code", codeDpt);
        List<Enseignant> enseignants = req.getResultList();
        return enseignants;
    }
    
    public List<Etudiant> getListeEtudClasse(String nomClasse){
        String sql = "SELECT ec FROM EtudiantClasse ec "
                    + "where ec.idclasse.nom = :classe "; 
                     
        Query req = em.createQuery(sql);
        req.setParameter("classe", nomClasse );
       
        List<EtudiantClasse> etudClasses = req.getResultList();
        List<Etudiant> etuds = new ArrayList<>();
        for(EtudiantClasse ec: etudClasses){
            etuds.add(ec.getMatricule());
        }
        
        return etuds;
    }
    
    public List<Ue> getUeDpt(){
        String sql = "SELECT uc FROM UeClasse uc "
                    + "where uc.idclasse.idfiliere.iddepartement.iddepartement=:id_dpt "; 
         Query req = em.createQuery(sql);
        req.setParameter("id_dpt", this.getIdDpt() );
        
        List<UeClasse> ueClasses = req.getResultList();
        List<Ue> ues = new ArrayList<>();
        for(UeClasse uc: ueClasses){
            ues.add(uc.getCode());
        }
        return ues;    
    }
    
    public List<Matiere> getMatDpt(){
        List<Ue> ues = this.getUeDpt();
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
    
    public List<Examen> getExamMatiere(){
        List<Matiere> mats = this.getMatDpt();
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
    
    
    public List<EtudiantExam> getEtudExam(String codeMat, String typeExam){
       // List<Examen> examsDpt = this.getExamMatiere();
       String sql = "SELECT ee FROM EtudiantExam ee ";
                  
        Query req = em.createQuery(sql);
       // req.setParameter("type_exam", typeExam );
      
     List<EtudiantExam> etudExams = (List<EtudiantExam>) req.getResultList();
     List<EtudiantExam> eeFiltres = new ArrayList<>();
        for(EtudiantExam ee: etudExams){
            
           if(ee.getIdmatiereexam().getIdmatiere().getCode() != null 
              && ee.getIdmatiereexam().getIdmatiere().getCode().equals(codeMat)){
           
                    eeFiltres.add(ee);
           //        System.out.println(ee.getIdmatiere().getCode());
             //  }  
           }
        }
        
       // System.out.println(etudExams.get(0).getIdmatiere().getCode());
        return eeFiltres;   
    }
    
}

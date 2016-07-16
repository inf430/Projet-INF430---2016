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
import entities.Inscription;
import entities.Matiere;
import entities.MatiereExam;
import entities.MatiereUe;
import entities.Ue;
import entities.UeClasse;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
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
public class EtudiantDaoNouvo {
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
     
     //Trouver l'étudiant à partir de son idpersonne
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
     
    //Obtenir la classe de l'étudiant
    /* public Integer trouverClasseEtudiant(){
         Etudiant etud = this.trouverEtudiant(i);
         String sql="SELECT etc FROM EtudiantClasse etc where etc.";
         
         return 1;
     }*/
    
     //Fonction pour obtenir les notes
     
     //Fonction liste des matières
     public List<Matiere> getMatiere(String code_matiere){
          //int idpers= (int)request.getSession().getAttribute("idpersonne");
          String mat= null;
          String sql="SELECT m.idmatiere FROM Matiere m where m.code=:code_matiere";
          Query req=em.createQuery(sql);
          req.setParameter("mat",mat);
          List<Matiere> ListeMatiere = req.getResultList();
          return ListeMatiere;
     }
     
     //Fonction pour la liste des Examens
     public List<Examen> getExamen(String code_matiere, String type_examen){
        // String code_matiere = request.getSession().getAttribute("code_matiere");
          List<Matiere> ListeMatiere = this.getMatiere(code_matiere);
          
          String sql="SELECT ex.idexamen FROM Examen ex,MatiereExam mat  where ex.type_exam=:type_examen and mat.idmatiere IN :ListeMatiere";
          Query req=em.createQuery(sql);
          req.setParameter("ListeMatiere",ListeMatiere);
          
          List<MatiereExam> examen = req.getResultList();
          List<Examen> MatExam = new ArrayList<>();
          for(MatiereExam e: examen){
              MatExam.add(e.getIdexamen());
          }
          
          return MatExam;
     } 
     
    /* public List<MatiereExam>getIdMatiereexamNote(String code_matiere, String type_examen){
         List<Examen> MatExam = this.getExamen(code_matiere, type_examen);
         String sql="SELECT mat.idmatiereexam FROM MatiereExam mat, Matiere m where mat.idexamen IN :MatExam";
         Query req=em.createQuery(sql);
         req.setParameter("MatExam",MatExam);
         List<MatiereExam> EtudExam = req.getResultList();
         List<EtudiantExam> MatExamen = new ArrayList<>();
         for(MatiereExam ee: EtudExam){
            MatExamen.add(ee.getIdmatiereexam());
         }
         return MatExamen;
     }*/
             
  /*  public List<EtudiantExam>getEtudExamNote(String code_matiere, String type_examen){
        List<MatiereExam> MatExamen = this.getIdMatiereexam(code_matiere, type_examen);
        String sql="SELECT et FROM EtudiantExam et where et.idmatiereexam IN :MatExamen";
        Query req=em.createQuery(sql);
        req.setParameter("MatExamen",MatExamen);
        List<MatiereExam> EtudExamNote = req.getResultList();
        List<EtudiantExam> MatExamenNote = new ArrayList<>();
        for(MatiereExam ee: EtudExamNote){
            MatExamenNote.add(ee.getIdmatiereexam());
        }
        
        return MatExamenNote;
    }   */
    
     //Fonction qui donne la note de tous les étudiants
    /* public List<EtudiantExam> getNote(HttpServletRequest request){
        
         String sql="SELECT et FROM EtudiantExam et";
         Query req=em.createQuery(sql);
         
         //req.setParameter("idpers",idpers);
         List<EtudiantExam> note = req.getResultList();
         return note;
                  
     }
     
     
       public List<MatiereExam> getNoteMatiere(HttpServletRequest request){
         List<EtudiantExam> list= this.getNote(request);
         String sql="SELECT mat.idmatiereexam FROM MatiereExam mat, Matiere m";
         Query req=em.createQuery(sql);
         
         req.setParameter("idpers",idpers);
         List<EtudiantExam> note = req.getResultList();
         return note;
                  
     }*/
     
     
    public List<EtudiantExam> NoteEtudiant(String code_matiere, String type_examen){
         
        
        String sql="SELECT et FROM EtudiantExam et where et.idmatiereexam IN(SELECT mat.idmatiereexam FROM MatiereExam mat, Matiere m where "
                 + "((mat.idexamen IN(SELECT ex.idexamen FROM Examen ex where ex.type_exam =:type_examen)) and mat.idmatiere IN(SELECT m.idmatiere from Matiere m where m.code =:code_matiere)));";
     
         Query req = em.createQuery(sql);
         req.setParameter("code_matiere", code_matiere);
         //req.setParamater("type_examen", type_examen);
         
         
         List<EtudiantExam> note = req.getResultList();
         return note;
      
    }
    
    public List<Inscription> ListeEtudiant(String code_mat){
        String sql="SELECT i FROM Inscription i, Matiere m where i.idmatiere.code=:code_mat";
        Query req = em.createQuery(sql);
        req.setParameter("code_mat",code_mat);
        List<Inscription> liste_inscription = req.getResultList();
        return liste_inscription;
        
    }
    
    //Fonction pour retorner idmatiere
    public Integer findIdMatiere(String code_ue, String annee){
        Integer Idmatiere=null;
        try{
        String sql="SELECT idmatiere FROM MatiereUe where code=:code_ue and annee=:annee";
        Query req = em.createQuery(sql);
        req.setParameter("Idmatiere",Idmatiere);
        Idmatiere =(Integer) req.getSingleResult();
        return Idmatiere;
        }catch(Exception ex){
            return null;
        }
    }
    
    //Fonction retournant idclasse
    public Integer findIdClasse(String classe){
        Integer Niveau=null;
        try{
        String sql="SELECT idclasse FROM Classe where niveau=:classe";
        Query req=em.createQuery(sql);
        req.setParameter("Niveau", Niveau);
        Niveau = (Integer) req.getSingleResult();
        return Niveau;
        }catch(Exception ex){
            return null;
        }
    }
    
    //Fonction qui cherche l'étudiant par classe
     public Vector<Etudiant> findEtudiantByClasseIdAnnee(int classeId,String anneeAc){
        try{
            String sql = "select etud from Etudiant etud,EtudiantClasse etudcl "
                    + "where etud.matricule=etudcl.matricule.matricule "
                    + "and etudcl.idclasse.idclasse=:classeId "
                    + "and etudcl.annee.annee=:anneeAc";
            Query query = em.createQuery(sql);
            query.setParameter("classeId",classeId);
            query.setParameter("anneeAc",anneeAc);
            return (Vector)query.getResultList();
        }catch(Exception ex){
            return null;
        }
     }
    
    /**
     *
     * @param Idclasse
     * @param Idmatiere
     * @param type
     * @param annee
     * @return
     */
    public List<EtudiantExam> findNotes(int Idclasse,int Idmatiere,String type,String annee){
        try{
        
            String sql="SELECT et FROM EtudiantExam et";
            Query req=em.createQuery(sql);
            List<EtudiantExam> etudExams = req.getResultList();
            
            List<EtudiantExam> exams=new ArrayList<>();
            
            Vector<Etudiant> etudiants = (Vector)findEtudiantByClasseIdAnnee(Idclasse,annee);
            for(int i=0;i<etudExams.size();i++){
                if(etudiants.contains(etudExams.get(i).getMatricule())){
                    if(etudExams.get(i).getIdmatiereexam().getAnnee().getAnnee().equals(annee)){
                        if(etudExams.get(i).getIdmatiereexam().getIdmatiere().getIdmatiere().equals(Idmatiere)){
                            if(etudExams.get(i).getIdmatiereexam().getIdexamen().getTypeExam().equals(type)){
                                exams.add(etudExams.get(i));
                            }
                        }
                    }
                }
            }
            return exams;
        }catch(Exception ex){
            return null;
        }
     }
}        
    
    




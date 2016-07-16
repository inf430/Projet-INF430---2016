/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.modeles;

import entities.EtudiantExam;
import entities.Examen;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Eddy
 */
@Stateless
public class EtudiantExamFacade extends AbstractFacade<EtudiantExam> {

    @PersistenceContext(unitName = "GestionNoteUy1PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EtudiantExamFacade() {
        super(EtudiantExam.class);
    }
    
 
    
    public List<EtudiantExam> findNotes(int classeId,int matiereId,String type,String annee){
        try{
            String sql = "SELECT etud_ex FROM EtudiantClasse etud_cl,EtudiantExam etud_ex"
                    + "WHERE etud_ex.idmatiereexam.idmatiere.idmatiere = :matiereId "
                    + "AND etud_ex.idmatiereexam.idexamen.typeExam = :type "
                    + "AND etud_cl.matricule.matricule  = etud_ex.matricule.matricule "
                    + "AND etud_cl.idclasse.idclasse = :classeId";
            Query query = getEntityManager().createQuery(sql);
            query.setParameter("type",type);
            query.setParameter("matiereId",matiereId);
            query.setParameter("classeId",classeId);
            List<EtudiantExam> etudexams = query.getResultList();
            List<EtudiantExam> exams = new ArrayList<>();
            for(EtudiantExam etudex:etudexams){
                exams.add(etudex);
            }
            return exams;
        }catch(Exception ex){
            return null;
        }
        
    }
    
    
     public Vector<EtudiantExam> trouverEtudiantExam(){
        String sql="select  et from EtudiantExam et ";
        Query requete=em.createQuery(sql);
        try{
            return (Vector)requete.getResultList();
        }catch(NoResultException e){
           return null; 
        }
        
        
    }
     
     public List<EtudiantExam> findNotes(int matiereId,String type){
        try{
            String sql = "SELECT etud_ex FROM EtudiantExam etud_ex";
            Query query = em.createQuery(sql);
            List<EtudiantExam> etudexams = query.getResultList();
            
            List<EtudiantExam> exams = new ArrayList<>();
          
            
            for(int i=0;i<etudexams.size();i++){
               
                    
                        if(etudexams.get(i).getIdmatiereexam().getIdmatiere().getIdmatiere().equals(matiereId)){
                            if(etudexams.get(i).getIdmatiereexam().getIdexamen().getTypeExam().equals(type)){
                                exams.add(etudexams.get(i));
                            }
                        }
                    
                
            }
            return exams;
        }catch(Exception ex){
            return null;
        }
    }
    
}

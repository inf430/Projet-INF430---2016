/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.modeles;

import entities.Matiere;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Armand
 */
@Stateless
public class MatiereFacade extends AbstractFacade<Matiere> {

    @PersistenceContext(unitName = "GestionNoteUy1PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
     public Matiere findById(int matiereId){
        try{
           return  getEntityManager().find(Matiere.class, matiereId);
        }catch(Exception ex){
            return null;
        }
    }
    public List<Matiere> getlistmatiere(String code1) {
     // try{
          String sql = "select m from Matiere m";
                       //+ " where m.code=:code1";
       Query rq= em.createQuery(sql);
      //rq.setParameter("code1",code1);
      
         return rq.getResultList();
          
       /** }catch (NoResultException e){
            return null;
        }**/
    
        
      }
    
    public Matiere getMatiere(String code){
         String sql = "select m from Matiere m where m.code=:code";
        Query rq= em.createQuery(sql);
        rq.setParameter("code",code);
        try{
            
            Matiere m=(Matiere)rq.getSingleResult();
            
            return m;
        }catch (NoResultException e){
            return null;
        }
        
        
    }
      public MatiereFacade() {
        super(Matiere.class);
    }
    
    
}

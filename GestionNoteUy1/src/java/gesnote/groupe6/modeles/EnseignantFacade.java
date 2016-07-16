/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.modeles;

import entities.Enseignant;
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
public class EnseignantFacade extends AbstractFacade<Enseignant> {

    @PersistenceContext(unitName = "GestionNoteUy1PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EnseignantFacade() {
        super(Enseignant.class);
    }
    
    public Vector<Enseignant> findByClasseId(int classeId){
        try{
            String sql = "select ens from Enseignant ens,EnseignantClasseJury ensclj where ens.matricule=ensclj.matricule.matricule and ensclj.idclasse.idclasse=:classeId";
            Query query = getEntityManager().createQuery(sql);
            query.setParameter("classeId",classeId);
            return (Vector)query.getResultList();
        }catch(Exception ex){
            return null;
        }
    }
    
    public Vector<Enseignant> findByDeptCode(String depCode){
        try{
            String sql = "select ens from Enseignant ens where ens.iddepartement.code=:depCode";
            Query query = getEntityManager().createQuery(sql);
            query.setParameter("depCode",depCode);
            return (Vector)query.getResultList();
        }catch(Exception ex){
            return null;
        }
    }
    
    
    public Enseignant trouverEnseignant(int i){
        String sql="select e from Enseignant e where e.idpersonne.idpersonne=:id";
        Query rq=em.createQuery(sql);
        rq.setParameter("id", i);
        try{
           return (Enseignant)rq.getSingleResult();
        }catch(NoResultException e){
          return null;  
        }
        
        
    }
    
}

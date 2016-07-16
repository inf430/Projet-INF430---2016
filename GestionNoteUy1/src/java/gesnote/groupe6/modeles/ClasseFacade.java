/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.modeles;

import entities.Classe;
import java.util.Vector;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Eddy
 */
@Stateless
public class ClasseFacade extends AbstractFacade<Classe> {

    @PersistenceContext(unitName = "GestionNoteUy1PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ClasseFacade() {
        super(Classe.class);
    }
    
    public Vector<Classe> findAll(){
        String sql = "select c from Classe c";
        Vector<Classe> list = new Vector();
        try{
            list = (Vector)getEntityManager().createQuery(sql).getResultList();
        }catch(Exception ex){
            list = null;
        }
        return list;
    }
    
    public Classe findByFiliereIdAndNiveau(String filiereCode, String niveau){
        try{
            String sql = "select c from Classe c where c.idfiliere.code = :filiereCode and c.niveau.niveau = :niveau";
            //String sql = "select c from Classe c";
            Query query = em.createQuery(sql);
            query.setParameter("niveau",niveau);
            query.setParameter("filiereCode",filiereCode);
            return (Classe)query.getSingleResult();
        }catch(Exception ex){
            return null;
        }
    }
}

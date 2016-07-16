/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.modeles;

import entities.Classe;
import entities.Ue;
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
public class UeFacade extends AbstractFacade<Ue> {

    @PersistenceContext(unitName = "GestionNoteUy1PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UeFacade() {
        super(Ue.class);
    }
    
    public Vector<Ue> findUeByClasseAnnee(int classeId,String annee){
        try{
            String sql = "select u from Ue u, UeClasse uec "
                    + "where u.code=uec.code.code "
                    + "and uec.idclasse.idclasse = :classeId";
            //String sql = "select u from Ue u";
            Query query = em.createQuery(sql);
            query.setParameter("classeId",classeId);
            return (Vector)query.getResultList();
        }catch(Exception ex){
            return null;
        }
    }
}

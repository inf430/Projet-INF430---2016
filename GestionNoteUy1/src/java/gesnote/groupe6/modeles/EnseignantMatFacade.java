/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.modeles;

import entities.Enseignant;
import entities.EnseignantMat;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author HP
 */
@Stateless
public class EnseignantMatFacade extends AbstractFacade<EnseignantMat> {

    @PersistenceContext(unitName = "GestionNoteUy1PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EnseignantMatFacade() {
        super(EnseignantMat.class);
    }
    public Vector<EnseignantMat> chercherEnseignantMat(Enseignant enseignant){
        Vector<EnseignantMat> list=new Vector<>();
        String rq="select e from EnseignantMat e where e.matricule.matricule=:matricule ";
        Query requete=getEntityManager().createQuery(rq);
        requete.setParameter("matricule",enseignant.getMatricule() );
        try {
       list = (Vector) requete.getResultList();
       } catch ( NoResultException e ) {
        return null;
        } 
        
        return list;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.modeles;

import entities.Etudiant;
import entities.Inscription;
import entities.Matiere;
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
 * @author HP
 */
@Stateless
public class InscriptionFacade extends AbstractFacade<Inscription> {

    @PersistenceContext(unitName = "GestionNoteUy1PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public InscriptionFacade() {
        super(Inscription.class);
    }
    
    public Vector<Etudiant> trouveInscriptionMatier(String code){
        Vector<Inscription> listIns=new Vector();
        String rq="SELECT distinct i FROM Inscription i WHERE i.idmatiere.code=:code";
        Query requete=em.createQuery(rq);
        requete.setParameter("code", code);
        try {
       listIns = (Vector) requete.getResultList();
       Vector <Etudiant> listeEtud=new Vector();
       for(Inscription i:listIns){
           listeEtud.add(i.getMatricule());
       }
       
       return listeEtud;
       } catch ( NoResultException e ) {
        return null;
        } 
        
        
    }
   
    
}

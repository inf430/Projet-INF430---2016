/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.modeles;

import entities.Etudiant;
import entities.Inscription;
import java.util.Vector;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Table;
import javax.ejb.EJBException;

/**
 *
 * @author Colombo
 */
@Stateless
@Table(name="Inscription")
public class EJB_Inscription {
    @PersistenceContext(name="GestionNoteUy1PU")
    private EntityManager em;
    
    public Vector<Inscription>  Liste_Inscription_Etudiant(Etudiant etud) throws EJBException{     
        String sql = "select i from Inscription i where i.matricule.matricule = :matricule";
        javax.persistence.Query requete = em.createQuery(sql);
        Vector list=new Vector();
        requete.setParameter("matricule",etud.getMatricule());
        try{
        list=(Vector) requete.getResultList();
        }
        catch(NoResultException e){
            return null;
                }
        catch(Exception e){
            throw new EJBException(e);
        }
        return list;
    }
    
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe1.modeles;

import entities.Personne;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaQuery;

/**
 *
 * @author HP
 */
@Stateless
public class AdminDao {
    @PersistenceContext( unitName = "GestionNoteUy1PU" )
    private EntityManager em;
    
    public boolean connection( String login, String password){
        //Attention : l'orthographe de la table est celui de l'entitié Personne (qui se trouve dans le paquage entities)
        String sql = "SELECT u FROM Personne u where u.login =:login AND u.password =:password";
        
        Query  requete = em.createQuery(sql);
        requete.setParameter("login", login);
        requete.setParameter("password", password);
        
      
        try{
            Personne p = null;
            p = (Personne) requete.getSingleResult();
            System.out.println("Une personne a été trouvée");
            return true;
        }catch( NoResultException e){
            e.printStackTrace();
            System.out.println("Aucun enregistrement correspondant");
        }
        return false;
    }
}


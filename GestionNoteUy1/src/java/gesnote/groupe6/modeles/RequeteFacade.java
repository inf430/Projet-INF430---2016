/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.modeles;

import entities.Etudiant;
import entities.Matiere;
import entities.Reponse;
import entities.Requete;

import static java.sql.DriverManager.println;
import java.text.SimpleDateFormat;
import java.util.Date;

import java.util.List;
import java.util.Vector;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import sun.util.calendar.Gregorian;


/**
 *
 * @author Armand
 */
@Stateless
public class RequeteFacade extends AbstractFacade<Requete> {
    
    
    
   
    @PersistenceContext(unitName = "GestionNoteUy1PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
        
    }
    public void trouverRequete(Requete r){
      
        try{
            em.flush();
             em.persist(r);
             em.flush();
        }catch (NoResultException e){
            println(" erreur de l'envoie");
        }
       
      
    }
    public List<Requete> getListeRequete(Etudiant et){
        
        Query rq= em.createQuery(" select r from Requete r where r.matricule.matricule=:mat");
        rq.setParameter("mat",et.getMatricule());
       
          try{
            return rq.getResultList();
        }catch (NoResultException e){
            return null;
        }
    }
    public RequeteFacade() {
        super(Requete.class);
    }
    
    public Vector <Requete> recupererRequete(Matiere matier){
        String sql="select r from Requete r where r.idmatiere.idmatiere=:matiere";
        Query query=em.createQuery(sql);
        query.setParameter("matiere" ,matier.getIdmatiere());
        System.out.print(matier.getIdmatiere());
        
        try{
            return (Vector)query.getResultList();
        }catch(NoResultException e){
            return null;
        }
        
       
    }
    
    public void insert(Requete r){
        String sql="update requete r set etat=traiter where r.idrequete=:r";
        
        Query query=em.createQuery(sql);
        query.setParameter("r", r.getIdrequete());
        query.executeUpdate();
    }
    public Vector <Requete> trouverListeRequete( Etudiant etudiant){
        String sql="select r from Requete r where r.matricule.matricule=:matricule";
        Query query=em.createQuery(sql);
        query.setParameter("matricule" ,etudiant.getMatricule());
       
        
        try{
            return (Vector)query.getResultList();
        }catch(NoResultException e){
            return null;
        }
    }
    
}

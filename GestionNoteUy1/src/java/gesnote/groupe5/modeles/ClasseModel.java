/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe5.modeles;

import entities.Classe;
import entities.Enseignant;
import java.util.List;
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
public class ClasseModel {
    @PersistenceContext( unitName = "GestionNoteUy1PU" )
    private EntityManager em;
    
    public List<Classe> getClasseForEnseignant5(String matricule){
        //String sql = "SELECT class FROM Classe class, IN(class.ueClasseList) ue, IN(ue.matiereUeList) matiere, IN(matiere. JOIN WHERE";
        
        try{
            Query requette = em.createQuery("SELECT clas FROM Classe clas, IN(clas.enseignantClasseJuryList) jury  WHERE jury.matricule.matricule =:matricule AND jury.annee.etat='en_cours'");
            requette.setParameter("matricule", matricule);
            List<Classe> mesClasses = (List<Classe>) requette.getResultList();
            return mesClasses;
        }catch(NoResultException e){
            return null;
        }
    }
    
    public Classe getActualClasseOfJury(Enseignant prJury) {
        Query requette = em.createQuery("SELECT jury.idclasse FROM EnseignantClasseJury jury JOIN jury.matricule ens JOIN jury.annee an WHERE ens.matricule=?1 AND an.etat=?2");
        
        requette.setParameter(1, prJury.getMatricule());
        requette.setParameter(2,"en_cours");
        
        try {
           Classe c= new Classe();
           c=(Classe)requette.getSingleResult();
           return c;
        } catch (NoResultException e) {
            e.printStackTrace();
            return null;
        }
       
    }
}

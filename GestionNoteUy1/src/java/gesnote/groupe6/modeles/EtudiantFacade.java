/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.modeles;

import entities.Etudiant;
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
public class EtudiantFacade extends AbstractFacade<Etudiant> {

    @PersistenceContext(unitName = "GestionNoteUy1PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EtudiantFacade() {
        super(Etudiant.class);
    }
    
    public Vector<Etudiant> findEtudiantByClasseIdAnnee(int classeId,String annee){
        try{
            String sql = "select etud from Etudiant etud,EtudiantClasse etudcl "
                    + "where etud.matricule=etudcl.matricule.matricule "
                    + "and etudcl.idclasse.idclasse=:classeId";
            Query query = getEntityManager().createQuery(sql);
            query.setParameter("classeId",classeId);
            return (Vector)query.getResultList();
        }catch(Exception ex){
            return null;
        }
    }
    
}

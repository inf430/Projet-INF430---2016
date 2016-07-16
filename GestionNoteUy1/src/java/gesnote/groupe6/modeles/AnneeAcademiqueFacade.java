/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.modeles;

import entities.AnneeAcademique;
import entities.Classe;
import java.util.List;
import java.util.Vector;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Eddy
 */
@Stateless
public class AnneeAcademiqueFacade extends AbstractFacade<AnneeAcademique>{

    @PersistenceContext(unitName = "GestionNoteUy1PU")
    private EntityManager em;

    public AnneeAcademiqueFacade() {
        super(AnneeAcademique.class);
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    public Vector<AnneeAcademique> findAll(){
        try{
            String sql = "select a from AnneeAcademique a";
            return (Vector)getEntityManager().createQuery(sql).getResultList();
        }catch(Exception ex){
            return null;
        }
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.modeles;

import entities.Departement;
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
public class DepartementFacade extends AbstractFacade<Departement> {

    @PersistenceContext(unitName = "GestionNoteUy1PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DepartementFacade() {
        super(Departement.class);
    }
    public Departement findByDeptCode(String deptCode){
        try{
            String sql = "select d from Departement d where d.code = :deptCode";
            Query query = getEntityManager().createQuery(sql);
            query.setParameter("deptCode",deptCode);
            return (Departement)query.getSingleResult();
        }catch(Exception ex){
            return null;
        }
    }
    public Departement findByDeptId(int deptId){
        try{
            return (Departement)getEntityManager().find(Departement.class, deptId);
        }catch(Exception ex){
            return null;
        }
    }
    public Vector<Departement> findAll(){
        try{
            String sql = "select dep from Departement dep";
            return (Vector)getEntityManager().createQuery(sql).getResultList();
        }catch(Exception ex){
            return null;
        }
    }
    
}

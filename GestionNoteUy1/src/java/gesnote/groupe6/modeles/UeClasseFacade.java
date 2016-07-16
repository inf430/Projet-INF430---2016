/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.modeles;

import entities.Ue;
import entities.UeClasse;
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
public class UeClasseFacade extends AbstractFacade<UeClasse> {

    @PersistenceContext(unitName = "GestionNoteUy1PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UeClasseFacade() {
        super(UeClasse.class);
    }
    
    public UeClasse findByCodeUe(String codeUe){
       UeClasse ueClasse = new UeClasse();
        try{
          
            String sqll = "select u from Ue u where u.code = :codeUe";
            Query query = getEntityManager().createQuery(sqll);
            query.setParameter("codeUe",codeUe);
            Ue ue = (Ue)query.getSingleResult();
            String sql = "select m from UeClasse m ";
                    //+ "where m.code = :ue";
                    
            Query queryy = getEntityManager().createQuery(sql);
          //  query.setParameter("ue",ue);
          Vector<UeClasse> matues = (Vector)queryy.getResultList();
          for(int i=0;i<matues.size();i++){
              if(matues.get(i).getCode().getCode().equals(codeUe)){
                  ueClasse = matues.get(i);
              }
          }
        }catch(Exception ex){
            ueClasse = null;          
        }
        return ueClasse;
    }
    public Vector<UeClasse> findAll(){
        try{
            String sql = "select ue_classe from UeClasse ue_classe";
            return (Vector)getEntityManager().createQuery(sql).getResultList();
        }catch(Exception ex){
            return null;
        }
        
    }
    
}

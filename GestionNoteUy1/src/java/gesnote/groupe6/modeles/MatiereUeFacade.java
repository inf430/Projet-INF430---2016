/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.modeles;

import entities.MatiereUe;
import entities.Ue;
import java.util.List;
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
public class MatiereUeFacade extends AbstractFacade<MatiereUe> {

    @PersistenceContext(unitName = "GestionNoteUy1PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MatiereUeFacade() {
        super(MatiereUe.class);
    }
    
    public MatiereUe findByCodeUe(String codeUe){
        MatiereUe matiereUe = new MatiereUe();
        try{
          
            String sqll = "select u from Ue u where u.code = :codeUe";
            Query query = getEntityManager().createQuery(sqll);
            query.setParameter("codeUe",codeUe);
            Ue ue = (Ue)query.getSingleResult();
            String sql = "select m from MatiereUe m ";
                    //+ "where m.code = :ue";
                    
            Query queryy = getEntityManager().createQuery(sql);
          //  query.setParameter("ue",ue);
          Vector<MatiereUe> matues = (Vector)queryy.getResultList();
          for(int i=0;i<matues.size();i++){
              if(matues.get(i).getCode().getCode().equals(codeUe)){
                  matiereUe = matues.get(i);
              }
          }
        }catch(Exception ex){
            matiereUe = null;          
        }
        return matiereUe;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe4.modeles;

import com.google.gson.Gson;
import entities.Requete;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author MBOUOPDA MICHAEL
 */
@Stateless
public class DashboardDao {

    @PersistenceContext(unitName = "GestionNoteUy1PU")
    private EntityManager em;

    private String toJson(List<ChartData> chartDatas) {

        ArrayList<Object> arrayList = new ArrayList<>();

        for (ChartData cd : chartDatas) {
            HashMap<String, Object> hashMap = new HashMap<>();
            hashMap.put("label", cd.getLabel());
            hashMap.put("y", cd.getY());
            arrayList.add(hashMap);
        }

        Gson gson = new Gson();

        return gson.toJson(arrayList);
    }

    private String executeAndReturnJson(String sql) {
        Query q = em.createNativeQuery(sql, ChartData.class);
        List<ChartData> chartDatas = q.getResultList();
        return toJson(chartDatas);
    }

    public String inscritsParMatiere(String aneaca, int idClasse) {
        String sql = "SELECT distinct  matiere.code AS label , count(*) AS valeur "
                + " FROM etudiant_classe,inscription,etudiant,classe,matiere"
                + " WHERE"
                + "    inscription.annee = '" + aneaca + "'"
                + "   AND inscription.matricule = etudiant.matricule"
                + "   AND classe.idclasse = " + idClasse
                + "   AND etudiant_classe.idclasse = classe.idclasse"
                + "   AND etudiant.matricule = etudiant_classe.matricule"
                + "   AND inscription.idmatiere = matiere.idmatiere"
                + " group by matiere.code";
        return executeAndReturnJson(sql);
    }

    public String nbreRequeteNonTraiter(String codeFiliere) {
        String sql = "SELECT "
                + "     niveau.niveau AS label, "
                + "     count(*) AS valeur "
                + "FROM "
                + "     etudiant etudiant INNER JOIN etudiant_classe etudiant_classe "
                + "ON etudiant.matricule = etudiant_classe.matricule "
                + "     INNER JOIN requete requete ON etudiant.matricule = requete.matricule "
                + "     INNER JOIN classe classe ON etudiant_classe.idclasse = classe.idclasse "
                + "     INNER JOIN niveau niveau ON classe.niveau = niveau.niveau "
                + "     INNER JOIN filiere filiere ON classe.idfiliere = filiere.idfiliere "
                + "WHERE "
                + "     requete.etat = 'en_cours' AND filiere.code = '" + codeFiliere + "' "
                + " GROUP BY niveau.niveau";
        return executeAndReturnJson(sql);
    }

    public List<Requete> listRequete(String etat, int limit) {
        Query q = em.createNamedQuery("Requete.findByEtat");
        q.setParameter("etat", etat);
        q.setMaxResults(limit);
        return q.getResultList();
    }
}

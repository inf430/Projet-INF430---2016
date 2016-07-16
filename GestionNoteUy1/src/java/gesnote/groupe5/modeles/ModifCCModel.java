package gesnote.groupe5.modeles;

import com.google.gson.Gson;
import entities.Classe;
import entities.Etudiant;
import entities.EtudiantExam;
import entities.Matiere;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author BERANOL NGUEMA EKA
 * 
 */

@Stateless
public class ModifCCModel{
    @PersistenceContext(unitName = "GestionNoteUy1PU")
    EntityManager em;
    
    
    public List<Classe> getClasseForEnseignant5(String matriculeEnseignant) {
      
        // Requete qui renvoie l'annee encours
        Query queryA=em.createQuery("SELECT a.annee FROM AnneeAcademique a WHERE a.etat=?1");
        queryA.setParameter(1, "en_cours");
        String anneeEncours=(String)queryA.getSingleResult();
      
       // Cette requete me renvoie toutes les classes ou l'enseignant ayant le matricule passé en parametre donne une matiere
        Query query=em.createQuery("SELECT DISTINCT e.idclasse FROM EnseignantMat e WHERE e.matricule.matricule=?1 AND e.annee.annee=?2");
        query.setParameter(1, matriculeEnseignant);
        query.setParameter(2, anneeEncours);
        List<Classe> liste;
      
        liste=query.getResultList();
            
        return liste;
    }

    
    public List<Matiere> getMatiereForEnseignantInClass5(String matriculeEnseignant, int idClasse) {
    List<Matiere> liste=new ArrayList<>();
    
    // Requete qui renvoie l'annee encours
      Query queryA=em.createQuery("SELECT a.annee FROM AnneeAcademique a WHERE a.etat=?1");
      queryA.setParameter(1, "en_cours");
      String anneeEncours=(String)queryA.getSingleResult();
    
    // Remplacer e.idmatiere.idmatiere par 
    Query query=em.createQuery("SELECT e.idmatiere FROM EnseignantMat e WHERE e.matricule.matricule=?1 AND e.idclasse.idclasse=?2 AND e.annee.annee=?3");
    query.setParameter(1, matriculeEnseignant);
    query.setParameter(2, idClasse);
    query.setParameter(3, anneeEncours);
    
    // Il peut arriver qu'un enseignant n'avait pas de matiere à enseigner durant une annee
        try {
            liste=query.getResultList();
        } catch (Exception e) {
        }
        return liste;
    }

    
    public String getJsonForMatieresCCFromList5(List<Matiere> mesMatieres) {
    
        Map<String,List<Matiere>> uneMap=new HashMap<>();
        uneMap.put("matiere", mesMatieres);
        
        return new Gson().toJson(uneMap);
    }

    
    public Map<String, String> getNoteCCOfEtudiantInMatiere5(String matricule, long idMatiere) {
     Map<String, String> map=new HashMap<>();
      
     // Requete qui renvoie l'annee encours
      Query queryA=em.createQuery("SELECT a.annee FROM AnneeAcademique a WHERE a.etat=?1");
      queryA.setParameter(1, "en_cours");
      String anneeEncours=(String)queryA.getSingleResult();
     
    // Requete qui permet de calculer la note d'un étudiant sur une matiere
     Query query=em.createQuery("SELECT distinct m.note FROM EtudiantExam m WHERE m.matricule.matricule=?1 AND m.idmatiereexam.idmatiere.idmatiere=?2 AND m.idmatiereexam.idexamen.idexamen=3 AND m.idmatiereexam.annee.annee=?4");
     query.setParameter(1, matricule);
     query.setParameter(2, idMatiere);
     query.setParameter(4, anneeEncours);
    
    //EnseignantMat enseignantMat=new EnseignantMat(); 
    //enseignantMat.getIdmatiere().getIdmatiere();
     Float note=0.0f;
     
     try {
        note=(Float)query.getSingleResult();       
     } catch (Exception e) {
       }
     
     
    // Requete qui me renvoit une matiere connaissant son codeMatiere
     Query query1=em.createQuery("SELECT m FROM Matiere m WHERE m.idmatiere=?1");
     query1.setParameter(1, idMatiere);
     Matiere matiere=(Matiere)query1.getSingleResult();
 
     // Requete qui me renvoit un étudiant connaissant son matricule
     Query query2=em.createQuery("SELECT e FROM Etudiant e WHERE e.matricule=?1");
     query2.setParameter(1, matricule);
     
     Etudiant etudiant=new  Etudiant();
     
     // Il peut arriver qu'il n'existe aucun etudiant ayant le marticule passé en parametre
        try {
            etudiant=(Etudiant)query2.getSingleResult();
        } catch (Exception e) {
        }
     
        // Je remplis mon Map
        //idEtudiant, nomEtudiant, prenomEtudiant, codeMatiere, libelleMatiere, noteCC.
        map.put("idEtudiant", etudiant.getIdpersonne().getIdpersonne().toString());
        map.put("matriculeEtudiant", etudiant.getMatricule());
        map.put("nomEtudiant", etudiant.getIdpersonne().getNom());
        map.put("prenomEtudiant", etudiant.getIdpersonne().getPrenom());
        map.put("codeMatiere", matiere.getCode());
        map.put("libelleMatiere", matiere.getLibelle());
        map.put("noteCC", note.toString());
        
        return map;
    }

    
    public boolean saveNoteCCOfEtudiantInMatiere5(String matricule, long idMatiere, Float noteCC) {
                
        try {
           String sql = "UPDATE EtudiantExam exam SET exam.note="+noteCC+"f WHERE exam.matricule.matricule=?1 AND exam.idmatiereexam.idmatiere.idmatiere=?2 AND exam.idmatiereexam.idexamen.typeExam='cc' AND exam.idmatiereexam.annee.etat='en_cours'";
            System.out.println("Sql = " + sql);
            Query requette = em.createQuery("UPDATE EtudiantExam exam SET exam.note="+noteCC+" WHERE exam.matricule.matricule=?1 AND exam.idmatiereexam.idmatiere.idmatiere=?2 AND exam.idmatiereexam.idexamen.typeExam='cc' AND exam.idmatiereexam.annee.etat='en_cours'");
            requette.setParameter(1, matricule);
            requette.setParameter(2, idMatiere);
            int nbRes = requette.executeUpdate();
            requette = em.createQuery("SELECT exam FROM EtudiantExam exam WHERE exam.matricule.matricule=?1 AND exam.idmatiereexam.idmatiere.idmatiere=?2 AND exam.idmatiereexam.idexamen.typeExam='cc' AND exam.idmatiereexam.annee.etat='en_cours' ");
            requette.setParameter(1, matricule);
            requette.setParameter(2, idMatiere);
            EtudiantExam exam = null;
            exam = (EtudiantExam) requette.getSingleResult();
            System.out.println("note = " + exam.getNote() + " & nbRes = " + nbRes);
            return nbRes>0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
       
       
    }
    
   /* public boolean saveNoteCCOfEtudiantInMatiere5(String matricule, long idMatiere, Float noteCC) {
        
      // Requete qui renvoie l'annee encours
      Query queryA=em.createQuery("SELECT a.annee FROM AnneeAcademique a WHERE a.etat=?1");
      queryA.setParameter(1, "en_cours");
      String anneeEncours=(String)queryA.getSingleResult();
      
        Query query=em.createQuery("SELECT m FROM EtudiantExam m WHERE m.matricule.matricule=?1 AND m.idmatiereexam.idmatiere.idmatiere=?2 AND m.idmatiereexam.idexamen.idexamen=3 AND m.idmatiereexam.annee.annee=?4");
        query.setParameter(1, matricule);
        query.setParameter(2, idMatiere);
        query.setParameter(4, anneeEncours);
       
        EtudiantExam etudiantExam=new EtudiantExam();
        
        try {
            etudiantExam=(EtudiantExam)query.getSingleResult();
            etudiantExam.setNote(noteCC);
       
       em.merge(etudiantExam);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
       
       
       return true;
    }*/

    
    public String getHTMLTableForNoteCCEtudiant5(Map<String, String> ligneEtudiant) {
     
     String htmlObject="<table class=\"table table-striped table-bordered bootstrap-datatable datatable\">"+
     "<thead>";
     String titre="<tr><th width=20%>matricule</th>";
     titre+="<th width=75%>nom</th>";
     titre+="<th width=15%>Note/20</th></tr>";
     
     // Ajout du titre dans l'objet htmlOject
     htmlObject+=titre;
     
     String ligne="<tr>"; 
                    ligne+="<td width=20%>"+ligneEtudiant.get("matriculeEtudiant")+"</td>";
                    ligne+="<td width=75%>"+ligneEtudiant.get("nomEtudiant")+" "+ligneEtudiant.get("prenomEtudiant")+"</td>";     
                    ligne+="<td width=10%><input type=\"text\" name=\""+ligneEtudiant.get("codeMatiere")+"\" id='note' value=\""+ligneEtudiant.get("noteCC")+"\"/></td>";
            ligne+="</tr>";
            
    htmlObject+=ligne;
    htmlObject+="</tbody></table>";
    
     return htmlObject;
    }

    
    public String getJsonFormHTMLTable5(String ligneHTML) {
        
        Map<String, String> donnees  = new HashMap<>();
        donnees.put("result", ligneHTML);
        
        return new Gson().toJson(ligneHTML);
    }
    
}

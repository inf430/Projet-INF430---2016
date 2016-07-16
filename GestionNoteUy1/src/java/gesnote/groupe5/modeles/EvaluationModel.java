/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe5.modeles;

import com.google.gson.Gson;
import entities.Matiere;
import entities.Etudiant;
import javax.ejb.Stateless;
import entities.UeClasse;
import entities.Classe;
import entities.EtudiantExam;
import entities.MatiereExam;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.annotation.WebServlet;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author ennalove
 */
@Stateless
public class EvaluationModel {
    @PersistenceContext (unitName = "GestionNoteUy1PU")
    private EntityManager em;
    
    boolean isTp = false, haveRattrap = false;
    
    public List<Matiere> getListOfMatieresInClass5(int idClasse){
    
        System.out.println("IdClasse = " + idClasse);
        List<Matiere> matieres = null;
        Query query;
        try {
                       query = em.createQuery("select mat from Matiere mat, IN(mat.enseignantMatList) ens where ens.idclasse.idclasse=?1");
                       query.setParameter(1,idClasse);
                       matieres = (List<Matiere>) query.getResultList();
                       System.out.println("Nb Matieres = " + matieres.size());
                       return matieres;            
        } catch (NoResultException e) {
            e.printStackTrace();
            return null;
        }
           
    }
    
    public List<Map<String, String>> getAllNoteExamInMatiereForClass5(int idMatiere, int idClasse){
         isTp = false;
         haveRattrap = false;
         List<Map<String, String>> notesEtudiant = new ArrayList<>();
         try{
             Query requette = em.createQuery("SELECT et FROM Etudiant et, IN(et.etudiantClasseList) clas, IN(et.inscriptionList) ins WHERE ins.idmatiere.idmatiere = :matiere AND clas.annee.etat='en_cours' AND clas.idclasse.idclasse=:classe");
             requette.setParameter("classe", idClasse);
             requette.setParameter("matiere", idMatiere);
             List<Etudiant> listEtudiant = (List<Etudiant>) requette.getResultList();
             for(int i = 0; i < listEtudiant.size(); i++){
                 Map<String, String> mesNotes = new HashMap<>();
                 mesNotes.put("matricule", listEtudiant.get(i).getMatricule());
                 mesNotes.put("nom", listEtudiant.get(i).getIdpersonne().getNom() + " " + listEtudiant.get(i).getIdpersonne().getPrenom() );
                 
                 for(int j = 0 ; j < listEtudiant.get(i).getEtudiantExamList().size(); j++){
                     if(listEtudiant.get(i).getEtudiantExamList().get(j).getIdmatiereexam().getIdmatiere().getIdmatiere() == idMatiere){
                         mesNotes.put("anonymat", listEtudiant.get(i).getEtudiantExamList().get(j).getAnonymat());                       
                         break;
                     }
                 }
                 double cc = 0, exam = 0, tp = 0;
                 for(int k = 0; k < listEtudiant.get(i).getEtudiantExamList().size(); k++){
                     if(listEtudiant.get(i).getEtudiantExamList().get(k).getIdmatiereexam().getAnnee().getEtat().equals("en_cours")){
                        if(listEtudiant.get(i).getEtudiantExamList().get(k).getIdmatiereexam().getIdmatiere().getIdmatiere() == idMatiere){
                            if(listEtudiant.get(i).getEtudiantExamList().get(k).getIdmatiereexam().getIdexamen().getTypeExam().equals("cc")){
                                cc = listEtudiant.get(i).getEtudiantExamList().get(k).getNote();
                                mesNotes.put("noteCC", listEtudiant.get(i).getEtudiantExamList().get(k).getNote().toString());
                                continue;
                            }
                            if(listEtudiant.get(i).getEtudiantExamList().get(k).getIdmatiereexam().getIdexamen().getTypeExam().equals("tp")){
                                isTp = true;
                                tp = listEtudiant.get(i).getEtudiantExamList().get(k).getNote();
                                mesNotes.put("noteTP", listEtudiant.get(i).getEtudiantExamList().get(k).getNote().toString());
                                continue;
                            }
                            if(listEtudiant.get(i).getEtudiantExamList().get(k).getIdmatiereexam().getIdexamen().getTypeExam().equals("normale")){
                                exam = listEtudiant.get(i).getEtudiantExamList().get(k).getNote();
                                mesNotes.put("noteExam", listEtudiant.get(i).getEtudiantExamList().get(k).getNote().toString());
                                continue;
                            }
                            if(listEtudiant.get(i).getEtudiantExamList().get(k).getIdmatiereexam().getIdexamen().getTypeExam().equals("rattrapage")){
                                haveRattrap = true;
                                exam = listEtudiant.get(i).getEtudiantExamList().get(k).getNote();
                                mesNotes.put("noteExam", listEtudiant.get(i).getEtudiantExamList().get(k).getNote().toString());
                            }
                        }
                     }
                }
                 Double total = 0.0;
                 if(isTp)
                     total += tp;
                 
                 total += cc + exam;
                 mesNotes.put("noteTotal", total.toString());
                 
                 notesEtudiant.add(mesNotes);
             }
             
             requette = em.createQuery("SELECT mat FROM Matiere mat WHERE mat.idmatiere=:matiere");
             requette.setParameter("matiere", idMatiere);
             Matiere matiere = (Matiere) requette.getSingleResult();
             Map<String, String> laMat = new HashMap<>();
             laMat.put("idMatiere", matiere.getIdmatiere().toString());
             laMat.put("codeMatiere", matiere.getCode());
             laMat.put("libelleMatiere", matiere.getLibelle());
             laMat.put("typeExam", (haveRattrap)?"rattrapage":"normale");
             notesEtudiant.add(laMat);
         }catch(NoResultException e){
             return null;
         }
                    
         return notesEtudiant;
    }
    
    // methode qui retourne l'id de l'examen cc
    public int getIdExamCcEtudiant(String matricule, int idMatiere){
        int id ;
        Query query = em.createQuery("select etuex.idexamen from EtudiantExam etuex,Examen exam, MatiereExam matexam where etuex.matricule := ?1 and matexam.idmatiere := ?2 and matexam.idexamen := exam.idexamen and exam.type := 'CC' and exam.idexamen := etuex.idexamen");
              id = (int)query.getSingleResult(); 
        return id;
    
    }
    // ;ethode aui retourne l'id de l'examen SN
    public int getIdExamSnEtudiant(String matricule, int idMatiere){
        int id;
        Query query = em.createQuery("select etuex.idexamen from EtudiantExam etuex,Examen exam, MatiereExam matexam where etuex.matricule := ?1 and matexam.idmatiere := ?2 and matexam.idexamen := exam.idexamen and exam.type := 'SN' and exam.idexamen := etuex.idexamen");
              id = (int)query.getSingleResult(); 
        return id;
    } 
    public List<Map<String,String>> getNoteExamOfEtudiantInMatiere5(String matricule, int idMatiere){
         isTp = false;
         haveRattrap = false;
         /*int idcc = this.getIdExamCcEtudiant(matricule,idMatiere);
         int idsn = this.getIdExamSnEtudiant(matricule,idMatiere);
         String l = null; 
         Map<String, String> map = new HashMap<>();
         List<Map<String,String>> list = new ArrayList<Map<String, String>>();
         Map<String, String> e = null;
         Query query = em.createQuery("select  pers.idpersonne, pers.nom, pers.prenom , etudexam.matricule, etudexam.anonymat,(select etu.note noteCC from EtudiantExam etu where etu.idexamen := ?3),(select etu.note noteExam from EtudiantExam etu where etu.idexamen :=?3), noteCC+noteExam total from EtudiantExam etudexam, MatiereExam matexam, Examen exam, Etudiant etu, Personne pers where etudexam.matricule := ?1 and matexam.idmatiere := ?2 and etudexam.idexamen := exam.idexamen and matexam.idexamen := exam.idexamen and etu.idpersonne := pers.idpersonne and etu.matricule :=?1 ");
            query.setParameter(1, matricule);
            query.setParameter(2, idMatiere);
            query.setParameter(3, idcc);
            query.setParameter(4, idsn);
            list = (List<Map<String,String>>)query.getSingleResult();
        */   
        
         List<Map<String, String>> notesEtudiant = new ArrayList<>();
         try{
             Query requette = em.createQuery("SELECT et FROM Etudiant et, IN(et.inscriptionList) ins WHERE et.matricule=:matricule AND ins.idmatiere.idmatiere = :matiere");
             requette.setParameter("matricule", matricule);
             requette.setParameter("matiere", idMatiere);
             List<Etudiant> listEtudiant = (List<Etudiant>) requette.getResultList();
             for(int i = 0; i < listEtudiant.size(); i++){
                 Map<String, String> mesNotes = new HashMap<>();
                 mesNotes.put("matricule", listEtudiant.get(i).getMatricule());
                 mesNotes.put("nom", listEtudiant.get(i).getIdpersonne().getNom() + " " + listEtudiant.get(i).getIdpersonne().getPrenom() );
                 
                 for(int j = 0 ; j < listEtudiant.get(i).getEtudiantExamList().size(); j++){
                     if(listEtudiant.get(i).getEtudiantExamList().get(j).getIdmatiereexam().getIdmatiere().getIdmatiere() == idMatiere){
                         mesNotes.put("anonymat", listEtudiant.get(i).getEtudiantExamList().get(j).getAnonymat());                       
                         break;
                     }
                 }
                 double cc = 0, exam = 0, tp = 0;
                 
                 for(int k = 0; k < listEtudiant.get(i).getEtudiantExamList().size(); k++){
                     if(listEtudiant.get(i).getEtudiantExamList().get(k).getIdmatiereexam().getAnnee().getEtat().equals("en_cours")){
                        if(listEtudiant.get(i).getEtudiantExamList().get(k).getIdmatiereexam().getIdmatiere().getIdmatiere() == idMatiere){
                            if(listEtudiant.get(i).getEtudiantExamList().get(k).getIdmatiereexam().getIdexamen().getTypeExam().equals("cc")){
                                cc = listEtudiant.get(i).getEtudiantExamList().get(k).getNote();
                                mesNotes.put("noteCC", listEtudiant.get(i).getEtudiantExamList().get(k).getNote().toString());
                                continue;
                            }
                            if(listEtudiant.get(i).getEtudiantExamList().get(k).getIdmatiereexam().getIdexamen().getTypeExam().equals("tp")){
                                isTp = true;
                                tp = listEtudiant.get(i).getEtudiantExamList().get(k).getNote();
                                mesNotes.put("noteTP", listEtudiant.get(i).getEtudiantExamList().get(k).getNote().toString());
                                continue;
                            }
                            if(listEtudiant.get(i).getEtudiantExamList().get(k).getIdmatiereexam().getIdexamen().getTypeExam().equals("examen")){
                                exam = listEtudiant.get(i).getEtudiantExamList().get(k).getNote();
                                mesNotes.put("noteExam", listEtudiant.get(i).getEtudiantExamList().get(k).getNote().toString());
                                continue;
                            }
                            if(listEtudiant.get(i).getEtudiantExamList().get(k).getIdmatiereexam().getIdexamen().getTypeExam().equals("rattrapage")){
                                haveRattrap = true;
                                exam = listEtudiant.get(i).getEtudiantExamList().get(k).getNote();
                                mesNotes.put("noteExam", listEtudiant.get(i).getEtudiantExamList().get(k).getNote().toString());
                            }
                        }
                     }
                }
                 Double total = 0.0;
                 if(isTp)
                     total += tp;
                 
                 total += cc + exam;
                 mesNotes.put("noteTotal", total.toString());
                 
                 notesEtudiant.add(mesNotes);
             }
             
             requette = em.createQuery("SELECT mat FROM Matiere mat WHERE mat.idmatiere=:matiere");
             requette.setParameter("matiere", idMatiere);
             Matiere matiere = (Matiere) requette.getSingleResult();
             Map<String, String> laMat = new HashMap<>();
             laMat.put("idMatiere", matiere.getIdmatiere().toString());
             laMat.put("codeMatiere", matiere.getCode());
             laMat.put("libelleMatiere", matiere.getLibelle());
             laMat.put("typeExam", (haveRattrap)?"rattrapage":"normale");
             notesEtudiant.add(laMat);
         }catch(NoResultException e){
             return null;
         }
                    
         return notesEtudiant;
    }
 
    public String getHTMLTableForNoteExam5(List<Map<String, String>> mesNotes){
        String tableauHtml = ""; 
        
        Map<String, String> matiere = mesNotes.get(mesNotes.size()-1);
          tableauHtml = "<h3 class='matiere'>" + matiere.get("codeMatiere") + " - " + matiere.get("libelleMatiere") + "</h3>"
                  + "<table class=\"table table-striped table-bordered bootstrap-datatable datatable\">" +
                        "<thead>" +
                        "    <tr>" +
                        "        <th width=10%>Anonymat</th>" +
                        "        <th width=10%>Matricule</th>" +
                        "        <th width=40%>Nom Prénom</th>" +
                        ((isTp)?"<th width=10%>CC / 20</th><th width=10%>TP/30</th><th width=10%>Exam / 50</th>":"<th width=10%>CC / 30</th><th width=10%>Exam / 70</th>") +
                        "        <th width=10%>Total /100</th>" +
                        "    </tr>" +
                        "</thead>" +
                        "<tbody>";
 tableauHtml += "<input type='hidden' name='typeExam' id='typeExam' value='" + matiere.get("typeExam") + "' />";
    
    
          for(int i = 0; i < mesNotes.size()-1; i++){
              Double noteExam = (isTp?Double.valueOf(mesNotes.get(i).get("noteExam"))*2.5:Double.valueOf(mesNotes.get(i).get("noteExam"))*3.5);
               Double noteCC = (isTp?Double.valueOf(mesNotes.get(i).get("noteCC")):(Double.valueOf(mesNotes.get(i).get("noteCC"))*1.5));
               Double noteTP = (isTp?Double.valueOf(mesNotes.get(i).get("noteTP"))*1.5:0);
               Double noteTotal = noteCC + noteTP + noteExam;
              tableauHtml +="<tr class='etudiant' id='" + mesNotes.get(i).get("matricule") + "'>"
                                + "<td width=10%>"
                                    + "<span class='anonymat' id='anonymat_" + mesNotes.get(i).get("matricule") + "'>" + mesNotes.get(i).get("anonymat") + "</span>"
                                + "</td>"
                                + "<td>"
                                    + "<span class='matricule'>" + mesNotes.get(i).get("matricule") + "</span>"
                                + "</td>"
                                + "<td>"
                                    + "<span class='nom'>" + mesNotes.get(i).get("nom") + "</span>"
                                + "</td>"
                                + "<td width=10%>"
                                    + "<input type='text' class='note cc' name='cc' style=\" width:100%; height: 30px; margin-bottom: -8px; margin-top: -8px;margin-left: -6%;\" id='cc_" + mesNotes.get(i).get("matricule") + "' value='" + (isTp?mesNotes.get(i).get("noteCC"):(Double.valueOf(mesNotes.get(i).get("noteCC"))*1.5)) + "' />"
                                + "</td>";
              if(isTp)
                tableauHtml += "<td width=10%>"
                                    + "<input type='text' class='note tp' name='tp' style=\" width:100%; height: 30px; margin-bottom: -8px; margin-top: -8px;margin-left: -6%;\" id='tp_" + mesNotes.get(i).get("matricule") + "' value='" + Double.valueOf(mesNotes.get(i).get("noteTP"))*1.5 + "' />"
                                + "</td>";
              tableauHtml      += "<td width=10%>"
                                    + "<input type='text' class='note exam' name='exam' style=\" width:100%; height: 30px; margin-bottom: -8px; margin-top: -8px;margin-left: -6%;\" id='exam_" + mesNotes.get(i).get("matricule") + "' value='" + (isTp?Double.valueOf(mesNotes.get(i).get("noteExam"))*2.5:Double.valueOf(mesNotes.get(i).get("noteExam"))*3.5) + "' />"
                                + "</td>"
                                + "<td width=10%>"
                                    + "<input type='text' class='note total' disabled='true' name='total' style=\" width:100%; height: 30px; margin-bottom: -8px; margin-top: -8px;margin-left: -6%;\" id='total_" + mesNotes.get(i).get("matricule") + "' value='" + noteTotal + "' />"
                                + "</td>"
                          + "</tr>";
             
          }
           tableauHtml += "<input type='hidden' name='isTP' id='isTP' value='" + ((isTp)?"1":"0") + "' />";
          /*for(Map<String, String> i : mesNotes){
              for(Map.Entry<String, String> entry : i.entrySet()){
                  tableauHtml+= "<td>" + entry.getKey() + "</td>" ;
                    }
                }
                  tableauHtml+="</tr>"; 
         for (Map<String, String> i : mesNotes) { 
                  tableauHtml+="<tr>";
               for(Map.Entry<String, String> entry : i.entrySet()){
                  tableauHtml+= "<td>"+ entry.getValue()+"</td>";
                        }
                  tableauHtml+="</tr>";
                   
                  }
         tableauHtml+="</body>"
                 + "</html>";*/
            return tableauHtml;
    }
    
    public String getJsonFormHTMLTable5(String tableHTML){
        Map<String, String> donnees = new HashMap<>();
        donnees.put("result", tableHTML);
        
        return new Gson().toJson(donnees);
    }
    
    public boolean saveNoteExamInMatiereForClass5(HttpServletRequest request){
        
        try{
           /* String test ="";
            test.split("_");
            Enumeration<String> mesVals = request.getParameterNames();
            
            while(mesVals.hasMoreElements()){
                String champ = mesVals.nextElement();
            }
               
            Map<String, String[]> values = request.getParameterMap();*/
           
           Enumeration<String> mesParams = request.getParameterNames();
           
           
           System.out.println("idMatiere = " + request.getParameter("idMatiere"));
           int nbEtudiant = Integer.valueOf(request.getParameter("nbEtudiant"));
           int idMatiere = Integer.valueOf(request.getParameter("idMatiere"));
           int isTP = Integer.valueOf(request.getParameter("isTP"));
           String typeExam = request.getParameter("typeExam");
           
           int nbCC = 0, nbExam =0;
           for(int i = 0; i < nbEtudiant; i++){
               String matricule = request.getParameter("matricule_" + i);
               float noteCC = Float.parseFloat(request.getParameter("cc_" + i));
               float noteExam = Float.parseFloat(request.getParameter("exam_" + i));
               String anonymat = request.getParameter("anonymat_" + i);
               if(isTP == 1){
                   noteCC /= 1;
                   noteExam /= 2.5;
               }
               else
               {
                   noteCC /= 1.5;
                   noteExam /= 3.5;
               }
               //float noteTotal = Float.parseFloat(request.getParameter("total_" + i));
               
               Query requette = em.createQuery("UPDATE EtudiantExam exam SET exam.note=" + noteCC +" WHERE exam.matricule.matricule=:matricule AND exam.idmatiereexam.annee.etat='en_cours' AND exam.idmatiereexam.idmatiere.idmatiere=:matiere AND exam.idmatiereexam.idexamen.typeExam=:type");
               requette.setParameter("matricule", matricule);
               requette.setParameter("type", "cc");
               requette.setParameter("matiere", idMatiere);
               nbCC = requette.executeUpdate();
               
               if(isTP == 1){
                    float noteTP = Float.parseFloat(request.getParameter("tp_" + i));
                    requette = em.createQuery("UPDATE EtudiantExam exam SET exam.note=" + noteTP +" WHERE exam.matricule.matricule=:matricule AND exam.idmatiereexam.annee.etat='en_cours' AND exam.idmatiereexam.idmatiere.idmatiere=:matiere AND exam.idmatiereexam.idexamen.typeExam=:type");
                    requette.setParameter("matricule", matricule);
                    requette.setParameter("type", "tp");
                    requette.setParameter("matiere", idMatiere);
                    requette.executeUpdate();
               }
               requette = em.createQuery("UPDATE EtudiantExam exam SET exam.note=" + noteExam +" WHERE exam.matricule.matricule=:matricule AND exam.idmatiereexam.annee=(SELECT an FROM AnneeAcademique an WHERE an.etat='en_cours') AND exam.idmatiereexam.idmatiere.idmatiere=:matiere AND exam.idmatiereexam.idexamen.typeExam=:type");
               requette.setParameter("matricule", matricule);
               requette.setParameter("type", typeExam);
               requette.setParameter("matiere", idMatiere);
               nbExam = requette.executeUpdate();
               
               /*if(nbExam == 0){
                   requette = em.createQuery("SELECT et FROM Etudiant et WHERE et.matricule=:matricule");
                   requette.setParameter("matricule", matricule);
                   Etudiant etudiant = (Etudiant) requette.getSingleResult();
                                      
                   requette = em.createQuery("SELECT exam FROM MatiereExam exam WHERE exam.idmatiere.idmatiere=:matiere AND exam.idexamen.typeExam=:typeExam AND exam.annee=(SELECT an FROM AnneeAcademique an WHERE an.etat='en_cours')");
                   requette.setParameter("matiere", idMatiere);
                   requette.setParameter("typeExam", typeExam);
                   MatiereExam matExam = (MatiereExam) requette.getSingleResult();
                   
                   EtudiantExam exam = new EtudiantExam();
                   exam.setAnonymat(anonymat);
                   exam.setIdmatiereexam(matExam);
                   exam.setMatricule(etudiant);
                   exam.setNote(noteExam);
                   
                   em.persist(exam);
               }*/
               
               System.out.println("Nbcc = " + nbCC + " et nbExam = " + nbExam);
           }
            System.out.println("Terminé");
           return true;  
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    
}

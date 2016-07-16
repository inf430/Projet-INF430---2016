/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe5.modeles;

import com.google.gson.Gson;

import entities.Etudiant;
import entities.EtudiantExam;
import entities.Examen;
import entities.Matiere;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author BERANOL
 */
@Stateless
public class DeliberationModel {

    @PersistenceContext(unitName="GestionNoteUy1PU")
    EntityManager em;

    
    public List<Map<String, String>> getEtudiantAdmisNotCritere5(int idClasse) {
    List<Map<String, String>> listeNote=afficherPv(idClasse);
    List<Map<String, String>> listeFinale=new ArrayList<>();
    
     int i=0;
     while(i!=listeNote.size()){
         Boolean bol=false;
         Set<Map.Entry<String, String>> uneMap=listeNote.get(i).entrySet();
           Iterator<Map.Entry<String,String>> it=uneMap.iterator();
           while (it.hasNext() && bol==false){
               Map.Entry<String,String> e=it.next();
               
               if(e.getValue().contains(".") && e.getKey()!="MGP"){
                   if(Float.parseFloat(e.getValue())<35 || Float.parseFloat(listeNote.get(i).get("MGP"))<2.0){
                       bol=true; // On a trouve un echec parmis les notes de cet etudiant
                   }
               }
               
           }
           if(bol==false){
               listeFinale.add(listeNote.get(i));
           }
         
         i++;
     }
    return listeFinale;
    }

    
    public List<Map<String, String>> getEtudiantAdmisWithCritere5(int idClasse, double mgpMin, double nbEchecMax) {
    List<Map<String, String>> listeNote=afficherPv(idClasse);
    List<Map<String, String>> listeFinale=new ArrayList<>();
    System.out.println("mgpMin = " + mgpMin + " & nbEchecMax = " + nbEchecMax);
     int i=0;
     int nbreEchecs;
     while(i!=listeNote.size()){
         nbreEchecs=0;
         Boolean bol=false;
         System.out.println(listeNote.get(i).get("matriculeEtudiant") + " <=> " + listeNote.get(i).get("MGP"));
         
         Float mgp = Float.parseFloat(listeNote.get(i).get("MGP"));
         if(mgp.isNaN() || mgp<mgpMin){
                   bol=true; // L'etudiant n'atteind pas la MGPMinimale
         }
         
        Set<Map.Entry<String, String>> uneMap=listeNote.get(i).entrySet();
        Iterator<Map.Entry<String,String>> it=uneMap.iterator();

        while (it.hasNext()){
             Map.Entry<String,String> e=it.next();      
              if(e.getValue().contains(".") && !"MGP".equals(e.getKey())){
                  if(Float.parseFloat(e.getValue())<35 && nbreEchecs!=nbEchecMax){
                      nbreEchecs++;
                  }
              }

         }
        System.out.println(listeNote.get(i).get("matriculeEtudiant") + " <=> " + nbreEchecs);
         
        if(bol==false && nbreEchecs<=nbEchecMax){
            
            listeFinale.add(listeNote.get(i));
        }
         List<Map<String, String>> listePrincipale = getEtudiantAdmisNotCritere5(idClasse);
         listeFinale.removeAll(listePrincipale);
//for(int x = 0; x<listePrincipale.size(); x++)
             
         i++;
     }
        System.out.println("Nb étudiant = " + listeFinale.size());
        
        return listeFinale;
    }

    
    public List<Map<String, String>> getEtudiantEchecWithCritere5(int idClasse, double mgpMin, double nbEchecMax) {
        
        List<Map<String, String>> listeNote=afficherPv(idClasse);
        List<Map<String, String>> listeFinale=new ArrayList<>();
    
     int i=0;
     
     while(i!=listeNote.size()){
           if(Float.parseFloat(listeNote.get(i).get("MGP"))<mgpMin){
               listeFinale.add(listeNote.get(i));
           }
           
         i++;
     }
     
     for(i = 0; i < listeNote.size(); i++){
         Map<String, String> etudiant = listeNote.get(i);
         if(Double.valueOf(etudiant.get("MGP"))>=mgpMin){
             Set<Map.Entry<String, String>> uneMap=etudiant.entrySet();
             Iterator<Map.Entry<String,String>> it=uneMap.iterator();
             int nbreEchecs = 0;
             while (it.hasNext()){
               Map.Entry<String,String> e=it.next();      
                    if(e.getValue().contains(".") && !"MGP".equals(e.getKey())){
                        if(Float.parseFloat(e.getValue())<35 && nbreEchecs!=nbEchecMax){
                            nbreEchecs++;
                        }
                    }
            }
            if (nbreEchecs>nbEchecMax){
                listeFinale.add(etudiant);
            }
            
         }
     }
    
        return listeFinale;
    }

    
    public String getHTMLTableForPVAdmisNotCritere5(List<Map<String, String>> mesNotes) {
        if(!mesNotes.isEmpty())
            return conversionListeEnStringHtml(mesNotes, "admis");
        else
            return "";
    }

    
    public String getHTMLTableForPVAdmisWithCritere5(List<Map<String, String>> mesNotes) {
        if(!mesNotes.isEmpty())
            return conversionListeEnStringHtml(mesNotes, "delibere");
        else
            return "";
    }
    
    
    public String getHTMLTableForPVEchecWithCritere5(List<Map<String, String>> mesNotes) {
    if(!mesNotes.isEmpty())
            return conversionListeEnStringHtml(mesNotes, "echec");
        else
            return "";
    }
    
    
    public String getJsonFormHTMLTable5(String htmlAdmis, String htmlRepeche, String htmlEchec) {
       
       Map<String, String> donnees = new HashMap<>();
       donnees.put("admis", htmlAdmis);
       donnees.put("repeche", htmlRepeche);
       donnees.put("echec", htmlEchec);
       
       return new Gson().toJson(donnees);
    }

    
    public boolean saveFinalPV5(String jsonText) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    /*public List<Map<String, String>> afficherPv(int idClasse) {
        Integer id=idClasse;
        
      // Requete qui renvoie la liste de tous les etudiants d'une classe      
      Query query=em.createQuery("SELECT e.matricule FROM EtudiantClasse e WHERE e.idclasse.idclasse=?1");
       
        query.setParameter(1,idClasse);
        List<Etudiant> listeEt=query.getResultList();
        
        List<Map<String, String>> listeEtudiants=new ArrayList<>();
     
        int i=0;
        while(i!=listeEt.size()){
            Map<String, String> map=new HashMap<>();
            Integer credits=0;
             // Vu que l'idEtudiant est un entier, je l'ai casté en un String car put prend deux String
            map.put("idclasse",id.toString());
            map.put("idEtudiant",listeEt.get(i).getIdpersonne().getIdpersonne().toString());
            map.put("matriculeEtudiant", listeEt.get(i).getMatricule());
            map.put("nomEtudiant",listeEt.get(i).getIdpersonne().getNom()+" "+listeEt.get(i).getIdpersonne().getPrenom());
            

            // Je recupere la liste des matieres d'un etudiant particulier
            Query query1=em.createQuery("SELECT i.idmatiere FROM Inscription i WHERE i.matricule.matricule=?1");
            query1.setParameter(1,listeEt.get(i).getMatricule());
            List<Matiere> listeMatiere=query1.getResultList();
            
            
            // J'affiche la liste des matieres d'un etudiant Ainsi que leur note
            int j=0;
            while (j!=listeMatiere.size()) {
            // Je recupere l'id_exam d'une UE qui me permettra de connaitre la note d'un etudiant sur cet exam****
            Query query2=em.createQuery("SELECT m.idexamen FROM MatiereExam m WHERE m.idmatiere.code=?1");
            query2.setParameter(1, listeMatiere.get(j).getCode());
            List<Examen> examens= query2.getResultList();
       
            // Une fois que j'ai deja la liste des idExamens je peux deja conaitre la note de l'etudiant sur la matiere. Requette    
            Query query3=em.createQuery("SELECT e.note FROM EtudiantExam e WHERE e.matricule.matricule=?1 AND e.idexamen.idexamen=?2 AND e.annee.annee=?3");
            query3.setParameter(1,listeEt.get(i).getMatricule());
            query3.setParameter(3,"2015-2016");
      
            // Je recupere le credit d'une matiere en fonction de l'année
            Query query4=em.createQuery("SELECT c.credit FROM MatiereUe c WHERE c.idmatiere=?1 AND c.annee.annee=?2");
            query4.setParameter(1,listeMatiere.get(j));
            query4.setParameter(2, "2015-2016");
            
            
                try {
                     credits=(Integer) query4.getSingleResult();        
                } catch (NoResultException e) {
                }
            
            
            int k=0;
            Float noteFinale=0f;
            Boolean bol=false;
            int cc=0,sn=0,tp=0,rpge=0;
            
            while (k!=examens.size()) {                    
              query3.setParameter(2, examens.get(k).getIdexamen());
              
              Float noteE=0f;
              
              try {
            
                 noteE=(Float) query3.getSingleResult();      
                } 
                catch (NoResultException e) {
                    
                }
              
              if(examens.get(k).getTypeExam().equals("cc") && noteE!=-1 && cc==0){
                  noteFinale+=noteE*1.5f;
                  cc=1;
              }
              
              if(examens.get(k).getTypeExam().equals("tp") && noteE!=-1 && tp==0){
                  noteFinale+=noteE*2.5f;
                  bol=true;
                  tp=1;
              }
              
              if(examens.get(k).getTypeExam().equals("normale") && bol==false && sn==0){
                  noteFinale+=noteE*3.5f;
                  sn=1;
              }
              
              if(examens.get(k).getTypeExam().equals("normale") && bol==true && sn==0){
                  noteFinale+=noteE*2.5f;
                  sn=1;
              }
              
               if(examens.get(k).getTypeExam().equals("rattrapage") && bol==false && rpge==0){
                  noteFinale+=noteE*3.5f;
                  rpge=1;
               }
             if(examens.get(k).getTypeExam().equals("rattrapage") && bol==true && rpge==0){
                  noteFinale+=noteE*2.5f;
                  rpge=1;
              }
                  
             k++;
           }
            // Transformation de la noteFinale en String
            map.put(listeMatiere.get(j).getCode(),noteFinale.toString());
            String credit="credit"+listeMatiere.get(j).getCode();
            map.put(credit,credits.toString());            
              j++;
            }
            
            listeEtudiants.add(map);
            i++;            
        }
      
     // Pour chaque étudiant
    int i1=0;
    while(i1!=listeEtudiants.size()){
        Float mgpFinale=0.0f;
        Integer totalCredit=0;
        Set<Map.Entry<String, String>> uneMap=listeEtudiants.get(i1).entrySet();
           
           Iterator<Map.Entry<String,String>> it=uneMap.iterator();
           
           // Parcours d'une map
           while (it.hasNext()){
               Iterator <Map.Entry<String,String>> itTemp=uneMap.iterator();
               Map.Entry<String,String> e=it.next();
               String cle=e.getKey();
               Boolean bol=false;
               if(cle.contains("credit")){
                  
                   while(itTemp.hasNext()){
                     Map.Entry<String,String> eTemp=itTemp.next();
                     String cleTemp="credit"+eTemp.getKey();
                     if(cle.equals(cleTemp) && false==bol){
                         bol=true;
                         totalCredit+=Integer.parseInt(e.getValue());
                         mgpFinale+=Integer.parseInt(e.getValue())*calculMGPNote(Float.parseFloat(eTemp.getValue()));        
                     }
                   }
               }
           
           }
           mgpFinale/=totalCredit;
        listeEtudiants.get(i1).put("MGP", mgpFinale.toString());
        listeEtudiants.get(i1).put("totalCrdits", totalCredit.toString());
        i1++;
    }
        
        return listeEtudiants;
        
    }*/
    
    public List<Map<String, String>> afficherPv(int idClasse) {
        Integer id=idClasse;
      
      // Requete qui renvoie l'annee encours
      Query queryA=em.createQuery("SELECT a.annee FROM AnneeAcademique a WHERE a.etat=?1");
      queryA.setParameter(1, "en_cours");
      String anneeEncours=(String)queryA.getSingleResult();
        
      // Requete qui renvoie la liste de tous les etudiants d'une classe      
      Query query=em.createQuery("SELECT e.matricule FROM EtudiantClasse e WHERE e.idclasse.idclasse=?1");
      query.setParameter(1,idClasse);
      List<Etudiant> listeEt=query.getResultList();
        
      List<Map<String, String>> listeEtudiants=new ArrayList<>();
     
      // Pour chaque étudiant, on cree une map qui contient toutes ses notes dans les matieres qu'il s'est inscrit
        int i=0;
        while(i!=listeEt.size()){
            Map<String, String> map=new HashMap<>();
            Integer credits=0;
            
            // Vu que l'idEtudiant est un entier, je l'ai casté en un String car put prend deux String
            map.put("idclasse",id.toString());
            map.put("idEtudiant",listeEt.get(i).getIdpersonne().getIdpersonne().toString());
            map.put("matriculeEtudiant", listeEt.get(i).getMatricule());
            map.put("nomEtudiant",listeEt.get(i).getIdpersonne().getNom()+" "+listeEt.get(i).getIdpersonne().getPrenom());
             
            Query queryNote=em.createQuery("SELECT distinct m.note FROM EtudiantExam m WHERE m.matricule.matricule=?1 AND m.idmatiereexam.idmatiere.code=?2 AND m.idmatiereexam.idexamen.typeExam=?3 AND m.idmatiereexam.annee.annee=?4");
            
            queryNote.setParameter(1, listeEt.get(i).getMatricule());
            queryNote.setParameter(4, anneeEncours);
            
            // Je recupere la liste des matieres d'un etudiant particulier
            Query query1=em.createQuery("SELECT i.idmatiere FROM Inscription i WHERE i.matricule.matricule=?1");
            query1.setParameter(1,listeEt.get(i).getMatricule());
            List<Matiere> listeMatiere=query1.getResultList();
            
            
            
            // J'affiche la liste des matieres d'un etudiant Ainsi que leur note
            int j=0;
            while (j!=listeMatiere.size()) {

//            Query queryNote=em.createQuery("SELECT m.note FROM EtudiantExam m WHERE m.matricule.matricule=?1 AND m.idmatiereexam.idmatiere.code=?2 AND m.idmatiereexam.idexamen.typeExam=?3 AND m.idmatiereexam.annee.annee=?4");
//            queryNote.setParameter(1, listeEt.get(i).getMatricule());
//            queryNote.setParameter(4, anneeEncours);
//            queryNote.setParameter(3,"tp");    
            // Pour chaque examen, je recupere la note de la matiere
            
            queryNote.setParameter(2, listeMatiere.get(j).getCode());
            
            // Je recupere le credit d'une matiere en fonction de l'année
            Query query4=em.createQuery("SELECT c.credit FROM MatiereUe c WHERE c.idmatiere=?1 AND c.annee.annee=?2");
            query4.setParameter(1,listeMatiere.get(j));
            query4.setParameter(2, anneeEncours);
            
            
            try {
                 credits=(Integer) query4.getSingleResult();        
            } catch (NoResultException e) {
            }
            
                Float noteFinale=0.0f;
                Float cc=0.0f,sn=0.0f,tp=-1f,rat=0.0f;
                boolean boltp=false;
                int k=0;
            
                while (k!=4) {                    
                    switch(k){
                        case 0:
                            queryNote.setParameter(3,"tp");
                            try {
                                tp=(Float)queryNote.getSingleResult();
                                
                            } catch (Exception e) {
                            }
                            
                            if(tp!=-1){ // Cete condition est vérifiée lorsque cette une matiere à TP
                            noteFinale+=tp*1.5f;
                            boltp=true;
                            }
                        break;
                        case 1:
                            queryNote.setParameter(3, "cc");
                            
                            try {
                                cc=(Float)queryNote.getSingleResult();
                            } catch (NoResultException e) {
                            }
                            if(boltp==true){ // Cette condition est vérifiée si c'est une matiere à TP
                                noteFinale+=cc;
                            }
                            else{
                                noteFinale+=cc*1.5f;
                            }
                            break;
                        case 2: 
                            queryNote.setParameter(3, "normale");
                            try {
                                sn=(Float)queryNote.getSingleResult();
                            } catch (NoResultException e) {
                            }
                            if(boltp==true){ // Cette condition est vérifiée si c'est une matiere à TP
                                noteFinale+=sn*2.5f;
                            }
                            else{
                                noteFinale+=sn*3.5f;
                            }
                            break;
                        case 3:
                            queryNote.setParameter(3, "rattrapage");
                            try {
                                rat=(Float)queryNote.getSingleResult();
                            } catch (NoResultException e) {
                            }
                            if(boltp==true){ // Cette condition est vérifiée si c'est une matiere à TP
                                noteFinale+=rat*2.5f;
                            }
                            else{
                                noteFinale+=rat*3.5f;
                            }
                            break;
                         default:
                             break;
                }
                k++;
           }
            // Transformation de la noteFinale en String
            map.put(listeMatiere.get(j).getCode(),noteFinale.toString());
            String credit="credit"+listeMatiere.get(j).getCode();
            map.put(credit,credits.toString());            
            j++;
            }
            
            listeEtudiants.add(map);
            i++;            
        }
      
     // Pour chaque étudiant
    int i1=0;
    while(i1!=listeEtudiants.size()){
        Float mgpFinale=0.0f;
        Integer totalCredit=0;
        Set<Map.Entry<String, String>> uneMap=listeEtudiants.get(i1).entrySet();
           
           Iterator<Map.Entry<String,String>> it=uneMap.iterator();
           
           // Parcours d'une map
           while (it.hasNext()){
               Iterator <Map.Entry<String,String>> itTemp=uneMap.iterator();
               Map.Entry<String,String> e=it.next();
               String cle=e.getKey();
               Boolean bol=false;
               if(cle.contains("credit")){
                  
                   while(itTemp.hasNext()){
                     Map.Entry<String,String> eTemp=itTemp.next();
                     String cleTemp="credit"+eTemp.getKey();
                     if(cle.equals(cleTemp) && false==bol){
                         bol=true;
                         totalCredit+=Integer.parseInt(e.getValue());
                         mgpFinale+=Integer.parseInt(e.getValue())*calculMGPNote(Float.parseFloat(eTemp.getValue()));        
                     }
                   }
               }
           
           }
           mgpFinale/=totalCredit;
        listeEtudiants.get(i1).put("MGP", mgpFinale.toString());
        listeEtudiants.get(i1).put("totalCrdits", totalCredit.toString());
        i1++;
    }
        
        return listeEtudiants;
        
    }

    
    public Float calculMGPNote(Float note) {
     Float mgp;
 
     if(note<35){
          mgp=0.0f;
      }
     else if(note>=35 && note<40){
          mgp=1.0f;
      }   
      else if(note>=40 && note<45){
          mgp=1.3f;
      }
      else if(note>=45 && note<50){
          mgp=1.7f;
      }
      else if(note>=50 && note<55){
          mgp=2.0f;
      }
      else if(note>=55 && note<60){
          mgp=2.3f;
      }
      else if(note>=60 && note<65){
          mgp=2.7f;
      }
      else if(note>=65 && note<70){
          mgp=3.0f;
      }
      else if(note>=70 && note<75){
          mgp=3.3f;
      }
      else if(note>=75 && note<80){
          mgp=3.7f;
      }
      else
          mgp=4.0f;
      
      
      return mgp;
    }
    
    
    public String conversionListeEnStringHtml(List<Map<String, String>> mesNotes, String type){
        // Cette requete me permet de connaitre le nombre de matieres qu'on dispense dans une classe.
     // Query query=em.createQuery("SELECT count(e.code) FROM UeClasse e WHERE e.idclasse.idclasse=?1 AND e.annee.annee=?2");
     //  query.setParameter(1,Integer.parseInt(mesNotes.get(0).get("idclasse")));
     //  query.setParameter(2,"2015-2016");
     //  long nbreUe=(long)query.getSingleResult();
       
       
     String htmlObject="<table class=\"table table-striped table-bordered bootstrap-datatable datatable table-condensed\">"+
     "<thead>";
     String titre="<tr><th width=30%>nom</th>";
     titre+="<th width=10%>matricule</th>";
     
     Set<Map.Entry<String, String>> mapTitre=mesNotes.get(0).entrySet();
     Iterator<Map.Entry<String,String>> itTitre=mapTitre.iterator();
        while (itTitre.hasNext()) {
            Map.Entry<String, String> next = itTitre.next();
            if(next.getValue().contains(".") && !"MGP".equals(next.getKey())){
                titre+="<th width=5%>"+next.getKey().toUpperCase()+"</th>";
            }
        }
        titre+="<th width=5%>totalCrdit</th>";
        titre+="<th width=5%>MGP</th>";
        titre+="<th width=5%>decision</th>";
        titre+="</tr>";
        htmlObject+=titre;
        
    // Cet objet permet d'ajouter la ligne des credits dans l'objet htmlObject
    String ligneCredit="<tr><th width=30%></th>";
    ligneCredit+="<th width=10%></th>";
    
        itTitre=mapTitre.iterator();
        while (itTitre.hasNext()) {
            Map.Entry<String, String> next = itTitre.next();
            if(next.getKey().contains("credit")){
               ligneCredit+="<th width=5%>"+Integer.parseInt(next.getValue())+"</th>";
            }
        }
        ligneCredit+="<th width=5%>"+mesNotes.get(0).get("totalCrdits")+"</th>";
        ligneCredit+="<th width=5%></th>";
        ligneCredit+="<th width=5%>*</th>";
        ligneCredit+="</tr></thead><tbody>";
        htmlObject+=ligneCredit;
        
    // J'insere maintenant les lignes dans mon PV
    String enregistrement="";
    
    int i=0;
     while(i!=mesNotes.size()){
      Set<Map.Entry<String, String>> uneMap=mesNotes.get(i).entrySet();
          Iterator<Map.Entry<String,String>> it=uneMap.iterator();
         enregistrement+="<tr class='"+ (type.equals("admis")?"":"etudiant ") + type + "' id='" + mesNotes.get(i).get("matriculeEtudiant") + "'><td class=\"center\" width=30%>"+mesNotes.get(i).get("nomEtudiant")+"</td>"; 
         enregistrement+="<td height=\"10px\" width=10%>"+mesNotes.get(i).get("matriculeEtudiant")+"</td>";
          while (it.hasNext()){
               Map.Entry<String,String> e=it.next();      
                    if(e.getValue().contains(".") && !"MGP".equals(e.getKey())){
                        enregistrement+="<td width=5%><input class='"+mesNotes.get(i).get("matriculeEtudiant")+" input_" + type + " note note_"+e.getKey()+"' type=\"text\" name=\""+e.getKey()+"\" id=\"" + mesNotes.get(i).get("matriculeEtudiant") + "_"+e.getKey()+"\" value=\""+e.getValue()+"\"/></td>";
                    }
           }
          enregistrement+="<td width=5%>"+mesNotes.get(i).get("totalCrdits")+"</td>";
          enregistrement+="<td width=5% id='mgp_"+mesNotes.get(i).get("matriculeEtudiant")+"'>"+mesNotes.get(i).get("MGP")+"</td>";
          enregistrement+="<td width=5%>"+(type.equals("echec")?"<center><input class='repecher' type=\"checkbox\" id=\"repecher_"+mesNotes.get(i).get("matriculeEtudiant")+"\"></center>":"Admis") + "</td></tr>";
                  ;
          i++;
     }
     
     htmlObject+=enregistrement;
     htmlObject+="</tbody></table>";
     
     return htmlObject;
    }
    
    public boolean saveFinalPV5(HttpServletRequest requete) {
        try {
            

            // Requete qui renvoie l'annee encours
            Query queryA=em.createQuery("SELECT a.annee FROM AnneeAcademique a WHERE a.etat=?1");
            queryA.setParameter(1, "en_cours");
            String anneeEncours=(String)queryA.getSingleResult();

            // Je forme une liste des codeMatieres qui sont dans l'objet HttpServletRequest envoyé en parametre
            List<String> listeCodeMatiere=new ArrayList<>();

            Enumeration<String> enumeration=requete.getParameterNames();
             while (enumeration.hasMoreElements()) {
                 String nextElement = enumeration.nextElement();
                 if(nextElement.contains("note_")){
                     String[] c=nextElement.split("_");
                     if(!listeCodeMatiere.contains(c[2])){ // Ajouter le code si la liste ne contient pas encore ce codeMatiere
                         listeCodeMatiere.add(c[2]);
                     }
                 }

             }

            Integer nbreEtudiants=Integer.parseInt(requete.getParameter("nbEtudiant")); //Cette ligne me retourne le nombre d'etudiants du PV

             // Cette requete me permet de connaitre la note qu'un etudiant a eu sur dans une matiere. Cette note peut etre sa note du cc, du tp, de la sn, ou du rattrapage
            Query query=em.createQuery("SELECT distinct m.note FROM EtudiantExam m WHERE m.matricule.matricule=?1 AND m.idmatiereexam.idmatiere.code=?2 AND m.idmatiereexam.idexamen.typeExam=?3 AND m.idmatiereexam.annee.annee=?4");

            // Cette requete me permet de recuperer un objet de type EtudiantExamen. Elle me permet de mettre à jour les notes d'un etudiant (CC, TP,SN,RAT) pour une matiere
            Query queryMAJ=em.createQuery("SELECT  m FROM EtudiantExam m WHERE m.matricule.matricule=?1 AND m.idmatiereexam.idmatiere.code=?2 AND m.idmatiereexam.idexamen.typeExam=?3 AND m.idmatiereexam.annee.annee=?4"); 

            query.setParameter(4,anneeEncours);
            queryMAJ.setParameter(4, anneeEncours);

            int i=0;// Cette boucle while me permet de parcourir les etudiants du PV
            while(i!=nbreEtudiants){
                String matricule=requete.getParameter("matricule_"+i); // Je recupère le matricule d'un étudiant

                // Je place le matricule d'un etudiant dans les deux requetes
                query.setParameter(1, matricule);
                queryMAJ.setParameter(1, matricule);

                // Cette boucle me permet de lister le nombre de matieres d'un etudiant particulier
                int j=0;
                while (j!=Integer.parseInt(requete.getParameter("nbMatiere_"+i))) {
                    System.out.println("label = " + "note_"+i+"_"+listeCodeMatiere.get(j));
                  Float totalNoteUe=Float.parseFloat(requete.getParameter("note_"+i+"_"+listeCodeMatiere.get(j))); // Je recupere la note totale d'une matiere.

                   // Je place le code de la matiere dans les deux requetes
                   query.setParameter(2, listeCodeMatiere.get(j));
                   queryMAJ.setParameter(2, listeCodeMatiere.get(j));

                     int k=0;
                     float noteCC=0f,noteRat=-1f,noteTP=-1f,noteNormale=-1f;
                     boolean bol=false,bolNormale=false,bolRat=false;

                     // Cette boucle me permet de connaitre la note de cc, de tp, de sn et de rattrapage de la matiere
                     while(k!=4){
                         switch(k){
                             case 0:
                                 query.setParameter(3,"tp");
                                 try {
                                     noteTP=(Float)query.getSingleResult();
                                 } catch (Exception e) {
                                 }
                                 if(noteTP!=-1){
                                     totalNoteUe-=noteTP*1.5f;
                                     bol=true; // Cette valeur booleenne me permet de connaitre si c'est une matiere à TP
                                 }
                                 break;
                             case 1:
                                 query.setParameter(3, "cc");
                                 try {
                                     noteCC=(Float)query.getSingleResult();
                                 } catch (Exception e) {
                                 }
                                 if(bol==true){
                                     totalNoteUe-=noteCC;
                                 }else{
                                     totalNoteUe-=noteCC*1.5f;
                                 }
                                 break;
                             case 2:
                                 query.setParameter(3, "normale");
                                 try {
                                     noteNormale=(Float)query.getSingleResult();
                                 } catch (Exception e) {
                                     e.printStackTrace();
                                 }
                                 if(noteNormale!=-1){
                                     if(bol==true)
                                         noteNormale=totalNoteUe/2.5f;
                                     else
                                         noteNormale=totalNoteUe/3.5f;
                                 }else{
                                     bolNormale=true;
                                 }
                                 break;
                             case 3:
                                 query.setParameter(3, "rattrapage");
                                 try {
                                     noteRat=(Float)query.getSingleResult();
                                 } catch (Exception e) {
                                     e.printStackTrace();
                                 }
                                 if(noteRat!=-1){
                                     if(bol==true)
                                         noteRat=totalNoteUe/2.5f;
                                     else
                                         noteRat=totalNoteUe/3.5f;
                                 }else{
                                     bolRat=true;
                                 }
                                 break;
                             default:
                                 break;

                         }
                           k++;
                     }

                    queryMAJ.setParameter(3, "cc");
                    EtudiantExam etudiantExamCC=(EtudiantExam)queryMAJ.getSingleResult();
                    etudiantExamCC.setNote(noteCC);
                    em.merge(etudiantExamCC);

                    if(bol==true){
                     queryMAJ.setParameter(3, "tp");
                     EtudiantExam etudiantExamTP=(EtudiantExam)queryMAJ.getSingleResult();
                     etudiantExamTP.setNote(noteTP);
                     em.merge(etudiantExamTP);
                    }
                    if(bolNormale==false){
                      queryMAJ.setParameter(3, "normale");
                      EtudiantExam etudiantExamNormale=(EtudiantExam)queryMAJ.getSingleResult();
                      etudiantExamNormale.setNote(noteNormale);
                      em.merge(etudiantExamNormale);
                    }
                    if(bolRat==false){
                      queryMAJ.setParameter(3, "rattrapage");
                      EtudiantExam etudiantExamRat=(EtudiantExam)queryMAJ.getSingleResult();
                      etudiantExamRat.setNote(noteRat);
                      em.merge(etudiantExamRat);
                    }
                    j++;
                }
                i++;
            }
       
            return true; 
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
}

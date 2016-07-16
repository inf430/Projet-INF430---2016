/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe6.modeles;

import entities.AnneeAcademique;
import entities.Classe;
import entities.Departement;
import entities.Enseignant;
import entities.Etudiant;
import entities.EtudiantExam;
import entities.Examen;
import entities.Filiere;
import entities.Matiere;
import entities.MatiereUe;
import entities.Niveau;
import entities.Ue;
import entities.UeClasse;
import java.util.ArrayList;
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
public class ConsulterDecanatDaoNouvo {
@PersistenceContext(unitName = "GestionNoteUy1PU")
    private EntityManager em;

 public UeClasse findUeClasseByMatiereId(int matiereId){
        try{
            List<Ue> ues = new ArrayList<>();
            String sqll = "select m.code from MatiereUe m"
                    + "where m.idmatiere.idmatiere = :matiereId";
            Query queryy = em.createQuery(sqll);
            queryy.setParameter("matiereId",matiereId);
            ues = (List<Ue>)queryy.getResultList();
            String sql = "select uecl from UeClasse uecl"
                    + " where uecl.code in :ues";
            Query query = em.createQuery(sql);
            query.setParameter("ues",ues);
            return (UeClasse)query.getSingleResult();
        }catch(Exception ex){
            return null;          
        }
    }
   
    public Vector<UeClasse> findUeClasseAll(){
        try{
            String sql = "select ue_classe from UeClasse ue_classe";
            return (Vector)em.createQuery(sql).getResultList();
        }catch(Exception ex){
            return null;
        }
        
    }
    
    public Vector<Niveau> findNiveauAll(){
        try{
            String sql = "select n from Niveau n";
            return (Vector)em.createQuery(sql).getResultList();
        }catch(Exception ex){
            return null;
        }
    }
     public List<MatiereUe> findMatiereUeByClasseIdAnnee(int classeId,String annee){
        try{
            String sql = "SELECT matue FROM MatiereUe matue, UeClasse uecl "
                    + "WHERE matue.code.code = uecl.code.code "
                    + "AND uecl.idclasse.idclasse = :classeId "
                    + "AND matue.annee.annee = uecl.annee.annee "
                    + "AND matue.annee.annee = :annee ";
            
            Query query = em.createQuery(sql);
            query.setParameter("classeId",classeId);
            query.setParameter("annee",annee);
            List<MatiereUe> uecls = query.getResultList();
            List<MatiereUe> ues = new ArrayList<>();
            for(MatiereUe ucl:uecls){
                ues.add(ucl);
            }
            return ues;
        }catch(Exception ex){
            return null;
        }
    }
     public Vector<Matiere> findMatiereAll(){
        try{
            String sql = "SELECT m FROM Matiere m";
           return  (Vector)em.createQuery(sql).getResultList();
        }catch(Exception ex){
            return null;
        }
    }
     public Matiere findMatiereById(int matiereId){
        try{
           return  em.find(Matiere.class, matiereId);
        }catch(Exception ex){
            return null;
        }
    }
      public Vector<Filiere> findFiliereAll(){
        try{
            String sql = "select f from Filiere f";
            return (Vector)em.createQuery(sql).getResultList();
        }catch(Exception ex){
            return null;
        }
    }
      public Vector<Etudiant> findEtudiantByClasseIdAnnee(int classeId,String annee){
        try{
            String sql = "select etud from Etudiant etud,EtudiantClasse etudcl "
                    + "where etud.matricule=etudcl.matricule.matricule "
                    + "and etudcl.idclasse.idclasse=:classeId "
                    + "and etudcl.annee.annee=:anneeAc";
            Query query = em.createQuery(sql);
            query.setParameter("classeId",classeId);
            query.setParameter("anneeAc",annee);
            return (Vector)query.getResultList();
        }catch(Exception ex){
            return null;
        }
    }
      public List<EtudiantExam> findNotes(int classeId,int matiereId,String type,String annee){
        try{
            String sql = "SELECT etud_ex FROM EtudiantExam etud_ex";
            Query query = em.createQuery(sql);
            List<EtudiantExam> etudexams = query.getResultList();
            
            List<EtudiantExam> exams = new ArrayList<>();
          
            Vector<Etudiant> etudiants = (Vector)findEtudiantByClasseIdAnnee(classeId,annee);
            for(int i=0;i<etudexams.size();i++){
                if(etudiants.contains(etudexams.get(i).getMatricule())){
                    if(etudexams.get(i).getIdmatiereexam().getAnnee().getAnnee().equals(annee)){
                        if(etudexams.get(i).getIdmatiereexam().getIdmatiere().getIdmatiere().equals(matiereId)){
                            if(etudexams.get(i).getIdmatiereexam().getIdexamen().getTypeExam().equals(type)){
                                exams.add(etudexams.get(i));
                            }
                        }
                    }
                }
            }
            return exams;
        }catch(Exception ex){
            return null;
        }
    }
      
      
      public List<EtudiantExam> findNote(int matiereId,String type){
        try{
            String sql = "SELECT etud_ex FROM EtudiantExam etud_ex";
            Query query = em.createQuery(sql);
            List<EtudiantExam> etudexams = query.getResultList();
            
            List<EtudiantExam> exams = new ArrayList<>();
          
            //Vector<Etudiant> etudiants = (Vector)findEtudiantByClasseIdAnnee(classeId);
            for(int i=0;i<etudexams.size();i++){
                
                    
                        if(etudexams.get(i).getIdmatiereexam().getIdmatiere().getIdmatiere().equals(matiereId)){
                            if(etudexams.get(i).getIdmatiereexam().getIdexamen().getTypeExam().equals(type)){
                                exams.add(etudexams.get(i));
                            }
                        }
                    }
             
            return exams;
        }catch(Exception ex){
            return null;
        }
    }
      
      
      
    public Vector<Classe> findClasseAll(){
        String sql = "select c from Classe c";
        Vector<Classe> list = new Vector();
        try{
            list = (Vector)em.createQuery(sql).getResultList();
        }catch(Exception ex){
            list = null;
        }
        return list;
    }
    
    public Classe findClasseByFiliereIdAndNiveau(String filiereCode, String niveau){
        try{
            String sql = "select c from Classe c where c.idfiliere.code = :filiereCode and c.niveau.niveau = :niveau";
            //String sql = "select c from Classe c";
            Query query = em.createQuery(sql);
            query.setParameter("niveau",niveau);
            query.setParameter("filiereCode",filiereCode);
            return (Classe)query.getSingleResult();
        }catch(Exception ex){
            return null;
        }
    }
     public Vector<AnneeAcademique> findAnneeAcademiqueAll(){
        try{
            String sql = "select a from AnneeAcademique a";
            return (Vector)em.createQuery(sql).getResultList();
        }catch(Exception ex){
            return null;
        }
    }
     public AnneeAcademique findAnneeAcademiqueByAnnee(String annee){
        try{
            return (AnneeAcademique)em.find(AnneeAcademique.class, annee);
        }catch(Exception ex){
            return null;
        }
    }
      public Vector<Enseignant> findEnseignantByClasseId(int classeId){
        try{
            String sql = "select ens from Enseignant ens,EnseignantClasseJury ensclj where ens.matricule=ensclj.matricule.matricule and ensclj.idclasse.idclasse=:classeId";
            Query query = em.createQuery(sql);
            query.setParameter("classeId",classeId);
            return (Vector)query.getResultList();
        }catch(Exception ex){
            return null;
        }
    }
    
    public Vector<Enseignant> findEnseignantByDeptCode(String depCode){
        try{
            String sql = "select ens from Enseignant ens where ens.iddepartement.code=:depCode";
            Query query = em.createQuery(sql);
            query.setParameter("depCode",depCode);
            return (Vector)query.getResultList();
        }catch(Exception ex){
            return null;
        }
    }
    public Departement findDepartementByDeptCode(String deptCode){
        try{
            String sql = "select d from Departement d where d.code = :deptCode";
            Query query = em.createQuery(sql);
            query.setParameter("deptCode",deptCode);
            return (Departement)query.getSingleResult();
        }catch(Exception ex){
            return null;
        }
    }
    public Departement findDepartementByDeptId(int deptId){
        try{
            return (Departement)em.find(Departement.class, deptId);
        }catch(Exception ex){
            return null;
        }
    }
    
    //Fonction pour retorner idmatiere
    public Integer findIdMatiere(String code_ue){
        //Integer Idmatiere=null;
        try{
        String sql="SELECT m.idmatiere FROM Matiere m where m.code = :code_ue";
        Query req = em.createQuery(sql);
        req.setParameter("code_ue",code_ue);
        return (Integer) req.getSingleResult();
        //return Idmatiere;
        }catch(Exception ex){
            return null;
        }
    }
    
    public Vector<Departement> findDepartementAll(){
        try{
            String sql = "select dep from Departement dep";
            return (Vector)em.createQuery(sql).getResultList();
        }catch(Exception ex){
            return null;
        }
    }
}

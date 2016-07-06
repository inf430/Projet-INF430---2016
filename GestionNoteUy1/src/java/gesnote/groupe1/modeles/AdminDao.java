/*
 * @author groupe1
 */
package gesnote.groupe1.modeles;

import entities.*;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.hibernate.PersistentObjectException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

/**
 *
 * @author HP
 */
@Stateless
public class AdminDao {

    @PersistenceContext(unitName = "GestionNoteUy1PU")
    private EntityManager em;

    public boolean exist(String login, String password) {

        //Attention : l'orthographe de la table est celui de l'entitié Personne (qui se trouve dans le paquage entities)
        String sql = "SELECT u FROM Personne u where u.login =:login AND u.password =:password";

        Query requete = em.createQuery(sql);
        requete.setParameter("login", login);
        requete.setParameter("password", password);

        try {
            Personne p = null;
            p = (Personne) requete.getSingleResult();
            return true;
        } catch (NoResultException e) {
            //e.printStackTrace();
        }
        return false;
    }

    public Personne getPersonne(String login, String password) {

        //Attention : l'orthographe de la table est celui de l'entitié Personne (qui se trouve dans le paquage entities)
        String sql = "SELECT u FROM Personne u where u.login =:login AND u.password =:password";

        Query requete = em.createQuery(sql);
        requete.setParameter("login", login);
        requete.setParameter("password", password);
        Personne personne = new Personne();
        try {
            personne = (Personne) requete.getSingleResult();
        } catch (NoResultException exception) {
        }
        return personne;
    }

    public String getMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            BigInteger number = new BigInteger(1, messageDigest);
            String hashtext = number.toString(16);
            // Now we need to zero pad it if you actually want the full 32 chars.
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    public JSONObject objectToJSONObject(Object object) {
        Object json = null;
        JSONObject jsonObject = null;
        try {
            json = new JSONTokener(object.toString()).nextValue();
        } catch (JSONException e) {
            e.printStackTrace();
        }
        if (json instanceof JSONObject) {
            jsonObject = (JSONObject) json;
        }
        return jsonObject;
    }

    public JSONArray objectToJSONArray(Object object) {
        Object json = null;
        JSONArray jsonArray = null;
        try {
            json = new JSONTokener(object.toString()).nextValue();
        } catch (JSONException e) {
            e.printStackTrace();
        }
        if (json instanceof JSONArray) {
            jsonArray = (JSONArray) json;
        }
        return jsonArray;
    }
    
    public boolean addTeacher( String matricule , String grade, String specialite, String nom, String prenom, String dateNaiss, String lieuNaiss, String sexe, String login, String password, String statut, String numtel ){
        
        Enseignant enseignant = new Enseignant();
        enseignant.setGrade(grade);
        enseignant.setSpecialite(specialite);
        enseignant.setMatricule(matricule);
        Personne personne = new Personne();
        personne.setLogin(login);
        personne.setPassword(password);
        personne.setDatenaiss(dateNaiss);
        personne.setLieunaiss(lieuNaiss);
        personne.setStatut("enseignant");
        personne.setNumtel(numtel);
        personne.setPrenom(prenom);
        personne.setNom(nom);
        personne.setSexe(sexe.charAt(0));
//        try{
//            em.persist(personne);
//            em.persist(enseignant);
//            em.flush();
//            enseignant.setIdpersonne(personne);
//            personne.setEnseignant(enseignant);
//            em.flush();
//        }catch( Exception ex){
//            return false;
//        }
        
        return  true;
    }
    
   public boolean addStudent(String matricule,String nom,String prenom,String dateNaiss,String lieuNaiss,String sexe,String login,String pass,String numTel){
       Etudiant student = new Etudiant();
       Personne person = new Personne();
       
        person.setLieunaiss(lieuNaiss);
        person.setDatenaiss(dateNaiss);
        person.setLogin(login);
        person.setPassword(pass);
        person.setNom(nom);
        person.setPrenom(prenom);
        person.setSexe(sexe.charAt(0));
        person.setNumtel(numTel);
        person.setStatut("etudiant");
         student.setMatricule(matricule);
        student.setIdpersonne(person);
        person.setEtudiant(student);
        
        try{
            em.persist(student);
            em.persist(person);
            em.flush();
            return true;
        }catch(Exception e){
            return false;
          }
        
   }
   
   public boolean  addAdministratif(String nom,String prenom,String dateNaiss,String lieuNaiss,String sexe,String login,String password,String numTel )
   {
       Administratif administratif = new Administratif();
       Personne person = new Personne();
       
        person.setLieunaiss(lieuNaiss);
        person.setDatenaiss(dateNaiss);
        person.setLogin(login);
        person.setPassword(password);
        person.setNom(nom);
        person.setPrenom(prenom);
        person.setSexe(sexe.charAt(0));
        person.setNumtel(numTel);
        person.setStatut("administratif");
        administratif.setIdpersonne(person);
        person.setAdministratif(administratif);
     
        try{
            em.persist(person);
            em.persist(administratif);
            em.flush();
           return true; 
        }catch(Exception e){
            return false;
        }
        
   }
   
   public boolean addSemester(String semestre){
       Semestre semester = new Semestre();
       AnneeAcademique year = this.getAnneeActive();
       
       semester.setSemestre(semestre);
       semester.setAnnee(year);
       
       try{
           em.persist(semester);
           em.flush();
           return true;
       }catch(Exception e){
           return false;
       }  
   }
   
   public AnneeAcademique getAnneeActive(){
       String sql="SELECT AnneeAcademique a FROM AnneeAcademique WHERE a.etat = 1 ";
       Query requete = em.createQuery(sql);
       return (AnneeAcademique)requete.getSingleResult();
       
   }

}

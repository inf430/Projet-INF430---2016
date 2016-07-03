/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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

/**
 *
 * @author HP
 */
@Stateless
public class AdminDao {
    @PersistenceContext( unitName = "GestionNoteUy1PU" )
    private EntityManager em;
    
    public boolean exist( String login, String password){
        
        //Attention : l'orthographe de la table est celui de l'entitié Personne (qui se trouve dans le paquage entities)
        String sql = "SELECT u FROM Personne u where u.login =:login AND u.password =:password";
        
        Query  requete = em.createQuery(sql);
        requete.setParameter("login", login);
        requete.setParameter("password", password);
        
        try{
            Personne p = null;
            p = (Personne) requete.getSingleResult();
            return true;
        }catch( NoResultException e){
            //e.printStackTrace();
        }
        return false;
    }
    
    public Personne getPersonne( String login, String password){
        
        //Attention : l'orthographe de la table est celui de l'entitié Personne (qui se trouve dans le paquage entities)
        String sql = "SELECT u FROM Personne u where u.login =:login AND u.password =:password";
        
        Query  requete = em.createQuery(sql);
        requete.setParameter("login", login);
        requete.setParameter("password", password);
        Personne personne = new Personne();
        try{
            personne = (Personne) requete.getSingleResult();
        }catch( NoResultException exception){
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
        }
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}


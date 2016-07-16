package entities;

import entities.Administratif;
import entities.Enseignant;
import entities.Etudiant;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(Personne.class)
public class Personne_ { 

    public static volatile SingularAttribute<Personne, Integer> idpersonne;
    public static volatile SingularAttribute<Personne, Character> sexe;
    public static volatile SingularAttribute<Personne, String> login;
    public static volatile SingularAttribute<Personne, String> numtel;
    public static volatile SingularAttribute<Personne, String> nom;
    public static volatile SingularAttribute<Personne, String> password;
    public static volatile SingularAttribute<Personne, Administratif> administratif;
    public static volatile SingularAttribute<Personne, String> lieunaiss;
    public static volatile SingularAttribute<Personne, Enseignant> enseignant;
    public static volatile SingularAttribute<Personne, String> prenom;
    public static volatile SingularAttribute<Personne, String> datenaiss;
    public static volatile SingularAttribute<Personne, String> statut;
    public static volatile SingularAttribute<Personne, Etudiant> etudiant;

}
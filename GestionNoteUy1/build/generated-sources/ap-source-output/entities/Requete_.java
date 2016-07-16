package entities;

import entities.Etudiant;
import entities.Matiere;
import entities.Reponse;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(Requete.class)
public class Requete_ { 

    public static volatile SingularAttribute<Requete, Reponse> reponse;
    public static volatile SingularAttribute<Requete, Integer> idrequete;
    public static volatile SingularAttribute<Requete, Etudiant> matricule;
    public static volatile SingularAttribute<Requete, String> typerequete;
    public static volatile SingularAttribute<Requete, String> dateRequete;
    public static volatile SingularAttribute<Requete, String> objet;
    public static volatile SingularAttribute<Requete, Matiere> idmatiere;
    public static volatile SingularAttribute<Requete, String> etat;
    public static volatile SingularAttribute<Requete, String> contenu;

}
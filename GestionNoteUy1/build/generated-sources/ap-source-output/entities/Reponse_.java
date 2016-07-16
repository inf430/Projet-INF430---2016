package entities;

import entities.Enseignant;
import entities.Requete;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(Reponse.class)
public class Reponse_ { 

    public static volatile SingularAttribute<Reponse, Requete> idrequete;
    public static volatile SingularAttribute<Reponse, Enseignant> matricule;
    public static volatile SingularAttribute<Reponse, Integer> idreponse;
    public static volatile SingularAttribute<Reponse, String> dateReponse;
    public static volatile SingularAttribute<Reponse, String> contenu;

}
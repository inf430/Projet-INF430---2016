package entities;

import entities.Classe;
import entities.Departement;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(Filiere.class)
public class Filiere_ { 

    public static volatile SingularAttribute<Filiere, String> code;
    public static volatile SingularAttribute<Filiere, String> libelle;
    public static volatile SingularAttribute<Filiere, Departement> iddepartement;
    public static volatile SingularAttribute<Filiere, Integer> idfiliere;
    public static volatile ListAttribute<Filiere, Classe> classeList;

}
package entities;

import entities.Enseignant;
import entities.EnseignantChefDepartement;
import entities.Filiere;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(Departement.class)
public class Departement_ { 

    public static volatile SingularAttribute<Departement, String> code;
    public static volatile ListAttribute<Departement, Enseignant> enseignantList;
    public static volatile SingularAttribute<Departement, String> libelle;
    public static volatile ListAttribute<Departement, EnseignantChefDepartement> enseignantChefDepartementList;
    public static volatile SingularAttribute<Departement, Integer> iddepartement;
    public static volatile ListAttribute<Departement, Filiere> filiereList;

}
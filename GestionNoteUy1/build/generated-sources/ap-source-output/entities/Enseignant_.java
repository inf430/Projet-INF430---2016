package entities;

import entities.Departement;
import entities.EnseignantChefDepartement;
import entities.EnseignantClasseJury;
import entities.EnseignantMat;
import entities.EtablirDroit;
import entities.Personne;
import entities.Reponse;
import entities.Role;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(Enseignant.class)
public class Enseignant_ { 

    public static volatile ListAttribute<Enseignant, EnseignantClasseJury> enseignantClasseJuryList;
    public static volatile ListAttribute<Enseignant, EnseignantMat> enseignantMatList;
    public static volatile SingularAttribute<Enseignant, Personne> idpersonne;
    public static volatile SingularAttribute<Enseignant, String> matricule;
    public static volatile SingularAttribute<Enseignant, String> specialite;
    public static volatile SingularAttribute<Enseignant, String> grade;
    public static volatile ListAttribute<Enseignant, EnseignantChefDepartement> enseignantChefDepartementList;
    public static volatile SingularAttribute<Enseignant, Departement> iddepartement;
    public static volatile ListAttribute<Enseignant, Role> roleList;
    public static volatile ListAttribute<Enseignant, EtablirDroit> etablirDroitList;
    public static volatile ListAttribute<Enseignant, Reponse> reponseList;

}
package entities;

import entities.Administrateur;
import entities.Administratif;
import entities.Droit;
import entities.Enseignant;
import entities.Etudiant;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(Role.class)
public class Role_ { 

    public static volatile ListAttribute<Role, Administratif> administratifList;
    public static volatile SingularAttribute<Role, Integer> idrole;
    public static volatile ListAttribute<Role, Droit> droitList;
    public static volatile SingularAttribute<Role, String> role;
    public static volatile ListAttribute<Role, Enseignant> enseignantList;
    public static volatile SingularAttribute<Role, Administrateur> idadmin;
    public static volatile ListAttribute<Role, Etudiant> etudiantList;

}
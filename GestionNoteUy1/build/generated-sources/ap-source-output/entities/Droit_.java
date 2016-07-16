package entities;

import entities.Administrateur;
import entities.EtablirDroit;
import entities.Role;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(Droit.class)
public class Droit_ { 

    public static volatile SingularAttribute<Droit, Integer> iddroit;
    public static volatile ListAttribute<Droit, Role> roleList;
    public static volatile SingularAttribute<Droit, Administrateur> idadmin;
    public static volatile SingularAttribute<Droit, String> nom;
    public static volatile ListAttribute<Droit, EtablirDroit> etablirDroitList;

}
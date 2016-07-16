package entities;

import entities.EtablirDroit;
import entities.Personne;
import entities.Role;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(Administratif.class)
public class Administratif_ { 

    public static volatile SingularAttribute<Administratif, Personne> idpersonne;
    public static volatile SingularAttribute<Administratif, Integer> idadministatif;
    public static volatile ListAttribute<Administratif, Role> roleList;
    public static volatile ListAttribute<Administratif, EtablirDroit> etablirDroitList;

}
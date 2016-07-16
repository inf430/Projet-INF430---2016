package entities;

import entities.Droit;
import entities.Role;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(Administrateur.class)
public class Administrateur_ { 

    public static volatile SingularAttribute<Administrateur, String> password;
    public static volatile ListAttribute<Administrateur, Droit> droitList;
    public static volatile SingularAttribute<Administrateur, Integer> idadmin;
    public static volatile SingularAttribute<Administrateur, String> login;
    public static volatile ListAttribute<Administrateur, Role> roleList;

}
package entities;

import entities.Administratif;
import entities.Droit;
import entities.Enseignant;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(EtablirDroit.class)
public class EtablirDroit_ { 

    public static volatile SingularAttribute<EtablirDroit, Integer> idetablirdroit;
    public static volatile SingularAttribute<EtablirDroit, String> datedeb;
    public static volatile SingularAttribute<EtablirDroit, Enseignant> matricule;
    public static volatile SingularAttribute<EtablirDroit, Droit> iddroit;
    public static volatile SingularAttribute<EtablirDroit, Administratif> idadministatif;
    public static volatile SingularAttribute<EtablirDroit, String> datefin;

}
package entities;

import entities.AnneeAcademique;
import entities.Departement;
import entities.Enseignant;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(EnseignantChefDepartement.class)
public class EnseignantChefDepartement_ { 

    public static volatile SingularAttribute<EnseignantChefDepartement, Integer> idenseignantchefdepartement;
    public static volatile SingularAttribute<EnseignantChefDepartement, Enseignant> matricule;
    public static volatile SingularAttribute<EnseignantChefDepartement, Departement> iddepartement;
    public static volatile SingularAttribute<EnseignantChefDepartement, AnneeAcademique> annee;

}
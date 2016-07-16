package entities;

import entities.AnneeAcademique;
import entities.Etudiant;
import entities.Matiere;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(Inscription.class)
public class Inscription_ { 

    public static volatile SingularAttribute<Inscription, Etudiant> matricule;
    public static volatile SingularAttribute<Inscription, Integer> idinscription;
    public static volatile SingularAttribute<Inscription, AnneeAcademique> annee;
    public static volatile SingularAttribute<Inscription, Matiere> idmatiere;

}
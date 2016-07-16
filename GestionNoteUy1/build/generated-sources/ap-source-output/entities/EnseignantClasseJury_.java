package entities;

import entities.AnneeAcademique;
import entities.Classe;
import entities.Enseignant;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(EnseignantClasseJury.class)
public class EnseignantClasseJury_ { 

    public static volatile SingularAttribute<EnseignantClasseJury, Integer> idenseignantclassejury;
    public static volatile SingularAttribute<EnseignantClasseJury, Classe> idclasse;
    public static volatile SingularAttribute<EnseignantClasseJury, Enseignant> matricule;
    public static volatile SingularAttribute<EnseignantClasseJury, AnneeAcademique> annee;

}
package entities;

import entities.AnneeAcademique;
import entities.Classe;
import entities.Enseignant;
import entities.Matiere;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(EnseignantMat.class)
public class EnseignantMat_ { 

    public static volatile SingularAttribute<EnseignantMat, Classe> idclasse;
    public static volatile SingularAttribute<EnseignantMat, Integer> idenseignantmat;
    public static volatile SingularAttribute<EnseignantMat, Enseignant> matricule;
    public static volatile SingularAttribute<EnseignantMat, AnneeAcademique> annee;
    public static volatile SingularAttribute<EnseignantMat, Matiere> idmatiere;

}
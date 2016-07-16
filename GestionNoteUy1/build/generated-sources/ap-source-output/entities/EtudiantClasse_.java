package entities;

import entities.AnneeAcademique;
import entities.Classe;
import entities.Etudiant;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(EtudiantClasse.class)
public class EtudiantClasse_ { 

    public static volatile SingularAttribute<EtudiantClasse, Classe> idclasse;
    public static volatile SingularAttribute<EtudiantClasse, Integer> idetudiantclasse;
    public static volatile SingularAttribute<EtudiantClasse, Etudiant> matricule;
    public static volatile SingularAttribute<EtudiantClasse, AnneeAcademique> annee;

}
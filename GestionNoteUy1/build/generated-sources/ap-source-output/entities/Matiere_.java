package entities;

import entities.EnseignantMat;
import entities.Inscription;
import entities.MatiereExam;
import entities.MatiereUe;
import entities.Requete;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(Matiere.class)
public class Matiere_ { 

    public static volatile ListAttribute<Matiere, Inscription> inscriptionList;
    public static volatile SingularAttribute<Matiere, String> code;
    public static volatile ListAttribute<Matiere, EnseignantMat> enseignantMatList;
    public static volatile SingularAttribute<Matiere, String> libelle;
    public static volatile ListAttribute<Matiere, Requete> requeteList;
    public static volatile ListAttribute<Matiere, MatiereUe> matiereUeList;
    public static volatile ListAttribute<Matiere, MatiereExam> matiereExamList;
    public static volatile SingularAttribute<Matiere, Integer> idmatiere;

}
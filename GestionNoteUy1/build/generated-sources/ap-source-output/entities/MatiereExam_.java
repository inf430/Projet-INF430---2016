package entities;

import entities.AnneeAcademique;
import entities.EtudiantExam;
import entities.Examen;
import entities.Matiere;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(MatiereExam.class)
public class MatiereExam_ { 

    public static volatile SingularAttribute<MatiereExam, Double> pourcentage;
    public static volatile SingularAttribute<MatiereExam, Integer> idmatiereexam;
    public static volatile ListAttribute<MatiereExam, EtudiantExam> etudiantExamList;
    public static volatile SingularAttribute<MatiereExam, AnneeAcademique> annee;
    public static volatile SingularAttribute<MatiereExam, Matiere> idmatiere;
    public static volatile SingularAttribute<MatiereExam, Examen> idexamen;

}
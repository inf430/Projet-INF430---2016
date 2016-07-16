package entities;

import entities.Etudiant;
import entities.MatiereExam;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(EtudiantExam.class)
public class EtudiantExam_ { 

    public static volatile SingularAttribute<EtudiantExam, Float> note;
    public static volatile SingularAttribute<EtudiantExam, String> anonymat;
    public static volatile SingularAttribute<EtudiantExam, MatiereExam> idmatiereexam;
    public static volatile SingularAttribute<EtudiantExam, Etudiant> matricule;
    public static volatile SingularAttribute<EtudiantExam, Integer> idetudiantexam;

}
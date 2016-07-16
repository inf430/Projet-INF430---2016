package entities;

import entities.MatiereExam;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(Examen.class)
public class Examen_ { 

    public static volatile SingularAttribute<Examen, String> typeExam;
    public static volatile SingularAttribute<Examen, String> dateExam;
    public static volatile ListAttribute<Examen, MatiereExam> matiereExamList;
    public static volatile SingularAttribute<Examen, Integer> idexamen;

}
package entities;

import entities.AnneeAcademique;
import entities.Ue;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(Semestre.class)
public class Semestre_ { 

    public static volatile ListAttribute<Semestre, Ue> ueList;
    public static volatile SingularAttribute<Semestre, Integer> idsemestre;
    public static volatile SingularAttribute<Semestre, AnneeAcademique> annee;
    public static volatile SingularAttribute<Semestre, String> semestre;

}
package entities;

import entities.MatiereUe;
import entities.Semestre;
import entities.UeClasse;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(Ue.class)
public class Ue_ { 

    public static volatile SingularAttribute<Ue, String> code;
    public static volatile SingularAttribute<Ue, Semestre> idsemestre;
    public static volatile SingularAttribute<Ue, String> libelle;
    public static volatile ListAttribute<Ue, MatiereUe> matiereUeList;
    public static volatile ListAttribute<Ue, UeClasse> ueClasseList;

}
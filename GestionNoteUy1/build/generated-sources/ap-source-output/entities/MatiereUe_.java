package entities;

import entities.AnneeAcademique;
import entities.Matiere;
import entities.Ue;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-07-13T22:28:42")
@StaticMetamodel(MatiereUe.class)
public class MatiereUe_ { 

    public static volatile SingularAttribute<MatiereUe, Integer> idmatiereue;
    public static volatile SingularAttribute<MatiereUe, Ue> code;
    public static volatile SingularAttribute<MatiereUe, AnneeAcademique> annee;
    public static volatile SingularAttribute<MatiereUe, Integer> credit;
    public static volatile SingularAttribute<MatiereUe, Matiere> idmatiere;

}
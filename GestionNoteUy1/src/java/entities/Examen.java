/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "examen")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Examen.findAll", query = "SELECT e FROM Examen e"),
    @NamedQuery(name = "Examen.findByIdexamen", query = "SELECT e FROM Examen e WHERE e.idexamen = :idexamen"),
    @NamedQuery(name = "Examen.findByTypeexamen", query = "SELECT e FROM Examen e WHERE e.typeexamen = :typeexamen")})
public class Examen implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idexamen")
    private Integer idexamen;
    @Size(max = 30)
    @Column(name = "typeexamen")
    private String typeexamen;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idexamen")
    private List<DroitRole> droitRoleList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idexamen")
    private List<EtablirDroit> etablirDroitList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idexamen")
    private List<MatiereExam> matiereExamList;

    public Examen() {
    }

    public Examen(Integer idexamen) {
        this.idexamen = idexamen;
    }

    public Integer getIdexamen() {
        return idexamen;
    }

    public void setIdexamen(Integer idexamen) {
        this.idexamen = idexamen;
    }

    public String getTypeexamen() {
        return typeexamen;
    }

    public void setTypeexamen(String typeexamen) {
        this.typeexamen = typeexamen;
    }

    @XmlTransient
    public List<DroitRole> getDroitRoleList() {
        return droitRoleList;
    }

    public void setDroitRoleList(List<DroitRole> droitRoleList) {
        this.droitRoleList = droitRoleList;
    }

    @XmlTransient
    public List<EtablirDroit> getEtablirDroitList() {
        return etablirDroitList;
    }

    public void setEtablirDroitList(List<EtablirDroit> etablirDroitList) {
        this.etablirDroitList = etablirDroitList;
    }

    @XmlTransient
    public List<MatiereExam> getMatiereExamList() {
        return matiereExamList;
    }

    public void setMatiereExamList(List<MatiereExam> matiereExamList) {
        this.matiereExamList = matiereExamList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idexamen != null ? idexamen.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Examen)) {
            return false;
        }
        Examen other = (Examen) object;
        if ((this.idexamen == null && other.idexamen != null) || (this.idexamen != null && !this.idexamen.equals(other.idexamen))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Examen[ idexamen=" + idexamen + " ]";
    }
    
}

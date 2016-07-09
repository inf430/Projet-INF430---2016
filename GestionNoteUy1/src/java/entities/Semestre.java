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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "semestre")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Semestre.findAll", query = "SELECT s FROM Semestre s"),
    @NamedQuery(name = "Semestre.findByIdsemestre", query = "SELECT s FROM Semestre s WHERE s.idsemestre = :idsemestre"),
    @NamedQuery(name = "Semestre.findBySemestre", query = "SELECT s FROM Semestre s WHERE s.semestre = :semestre")})
public class Semestre implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idsemestre")
    private Integer idsemestre;
    @Size(max = 30)
    @Column(name = "semestre")
    private String semestre;
    @JoinColumn(name = "annee", referencedColumnName = "annee")
    @ManyToOne(optional = false)
    private AnneeAcademique annee;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idsemestre")
    private List<Ue> ueList;

    public Semestre() {
    }

    public Semestre(Integer idsemestre) {
        this.idsemestre = idsemestre;
    }

    public Integer getIdsemestre() {
        return idsemestre;
    }

    public void setIdsemestre(Integer idsemestre) {
        this.idsemestre = idsemestre;
    }

    public String getSemestre() {
        return semestre;
    }

    public void setSemestre(String semestre) {
        this.semestre = semestre;
    }

    public AnneeAcademique getAnnee() {
        return annee;
    }

    public void setAnnee(AnneeAcademique annee) {
        this.annee = annee;
    }

    @XmlTransient
    public List<Ue> getUeList() {
        return ueList;
    }

    public void setUeList(List<Ue> ueList) {
        this.ueList = ueList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idsemestre != null ? idsemestre.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Semestre)) {
            return false;
        }
        Semestre other = (Semestre) object;
        if ((this.idsemestre == null && other.idsemestre != null) || (this.idsemestre != null && !this.idsemestre.equals(other.idsemestre))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Semestre[ idsemestre=" + idsemestre + " ]";
    }
    
}

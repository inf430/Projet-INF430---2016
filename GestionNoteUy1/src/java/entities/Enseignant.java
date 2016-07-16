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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "enseignant")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Enseignant.findAll", query = "SELECT e FROM Enseignant e"),
    @NamedQuery(name = "Enseignant.findByMatriculeenseignant", query = "SELECT e FROM Enseignant e WHERE e.matriculeenseignant = :matriculeenseignant"),
    @NamedQuery(name = "Enseignant.findByGrade", query = "SELECT e FROM Enseignant e WHERE e.grade = :grade"),
    @NamedQuery(name = "Enseignant.findBySpecialite", query = "SELECT e FROM Enseignant e WHERE e.specialite = :specialite")})
public class Enseignant implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "matriculeenseignant")
    private String matriculeenseignant;
    @Size(max = 50)
    @Column(name = "grade")
    private String grade;
    @Size(max = 50)
    @Column(name = "specialite")
    private String specialite;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matriculeenseignant")
    private List<EnseignantMat> enseignantMatList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matriculeenseignant")
    private List<EnseignantChefDepartement> enseignantChefDepartementList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matriculeenseignant")
    private List<EnseignantClasseJury> enseignantClasseJuryList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matriculeenseignant")
    private List<Requeteenseignant> requeteenseignantList;
    @JoinColumn(name = "idpersonne", referencedColumnName = "idpersonne")
    @OneToOne(optional = false)
    private Personne idpersonne;
    @JoinColumn(name = "iddepartement", referencedColumnName = "iddepartement")
    @ManyToOne(optional = false)
    private Departement iddepartement;

    public Enseignant() {
    }

    public Enseignant(String matriculeenseignant) {
        this.matriculeenseignant = matriculeenseignant;
    }

    public String getMatriculeenseignant() {
        return matriculeenseignant;
    }

    public void setMatriculeenseignant(String matriculeenseignant) {
        this.matriculeenseignant = matriculeenseignant;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getSpecialite() {
        return specialite;
    }

    public void setSpecialite(String specialite) {
        this.specialite = specialite;
    }

    @XmlTransient
    public List<EnseignantMat> getEnseignantMatList() {
        return enseignantMatList;
    }

    public void setEnseignantMatList(List<EnseignantMat> enseignantMatList) {
        this.enseignantMatList = enseignantMatList;
    }

    @XmlTransient
    public List<EnseignantChefDepartement> getEnseignantChefDepartementList() {
        return enseignantChefDepartementList;
    }

    public void setEnseignantChefDepartementList(List<EnseignantChefDepartement> enseignantChefDepartementList) {
        this.enseignantChefDepartementList = enseignantChefDepartementList;
    }

    @XmlTransient
    public List<EnseignantClasseJury> getEnseignantClasseJuryList() {
        return enseignantClasseJuryList;
    }

    public void setEnseignantClasseJuryList(List<EnseignantClasseJury> enseignantClasseJuryList) {
        this.enseignantClasseJuryList = enseignantClasseJuryList;
    }

    @XmlTransient
    public List<Requeteenseignant> getRequeteenseignantList() {
        return requeteenseignantList;
    }

    public void setRequeteenseignantList(List<Requeteenseignant> requeteenseignantList) {
        this.requeteenseignantList = requeteenseignantList;
    }

    public Personne getIdpersonne() {
        return idpersonne;
    }

    public void setIdpersonne(Personne idpersonne) {
        this.idpersonne = idpersonne;
    }

    public Departement getIddepartement() {
        return iddepartement;
    }

    public void setIddepartement(Departement iddepartement) {
        this.iddepartement = iddepartement;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (matriculeenseignant != null ? matriculeenseignant.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Enseignant)) {
            return false;
        }
        Enseignant other = (Enseignant) object;
        if ((this.matriculeenseignant == null && other.matriculeenseignant != null) || (this.matriculeenseignant != null && !this.matriculeenseignant.equals(other.matriculeenseignant))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Enseignant[ matriculeenseignant=" + matriculeenseignant + " ]";
    }
    
}

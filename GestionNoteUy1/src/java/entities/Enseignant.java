/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
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
    @NamedQuery(name = "Enseignant.findByMatricule", query = "SELECT e FROM Enseignant e WHERE e.matricule = :matricule"),
    @NamedQuery(name = "Enseignant.findByGrade", query = "SELECT e FROM Enseignant e WHERE e.grade = :grade"),
    @NamedQuery(name = "Enseignant.findBySpecialite", query = "SELECT e FROM Enseignant e WHERE e.specialite = :specialite")})
public class Enseignant implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "matricule")
    private String matricule;
    @Size(max = 255)
    @Column(name = "grade")
    private String grade;
    @Size(max = 255)
    @Column(name = "specialite")
    private String specialite;
    @JoinTable(name = "roleenseignant", joinColumns = {
        @JoinColumn(name = "matricule", referencedColumnName = "matricule")}, inverseJoinColumns = {
        @JoinColumn(name = "idrole", referencedColumnName = "idrole")})
    @ManyToMany
    private Collection<Role> roleCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matricule")
    private Collection<EnseignantMat> enseignantMatCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matricule")
    private Collection<Reponse> reponseCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matricule")
    private Collection<EnseignantChefDepartement> enseignantChefDepartementCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matricule")
    private Collection<EnseignantClasseJury> enseignantClasseJuryCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matricule")
    private Collection<EtablirDroit> etablirDroitCollection;
    @JoinColumn(name = "idpersonne", referencedColumnName = "idpersonne")
    @OneToOne(optional = false)
    private Personne idpersonne;
    @JoinColumn(name = "iddepartement", referencedColumnName = "iddepartement")
    @ManyToOne(optional = false)
    private Departement iddepartement;

    public Enseignant() {
    }

    public Enseignant(String matricule) {
        this.matricule = matricule;
    }

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
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
    public Collection<Role> getRoleCollection() {
        return roleCollection;
    }

    public void setRoleCollection(Collection<Role> roleCollection) {
        this.roleCollection = roleCollection;
    }

    @XmlTransient
    public Collection<EnseignantMat> getEnseignantMatCollection() {
        return enseignantMatCollection;
    }

    public void setEnseignantMatCollection(Collection<EnseignantMat> enseignantMatCollection) {
        this.enseignantMatCollection = enseignantMatCollection;
    }

    @XmlTransient
    public Collection<Reponse> getReponseCollection() {
        return reponseCollection;
    }

    public void setReponseCollection(Collection<Reponse> reponseCollection) {
        this.reponseCollection = reponseCollection;
    }

    @XmlTransient
    public Collection<EnseignantChefDepartement> getEnseignantChefDepartementCollection() {
        return enseignantChefDepartementCollection;
    }

    public void setEnseignantChefDepartementCollection(Collection<EnseignantChefDepartement> enseignantChefDepartementCollection) {
        this.enseignantChefDepartementCollection = enseignantChefDepartementCollection;
    }

    @XmlTransient
    public Collection<EnseignantClasseJury> getEnseignantClasseJuryCollection() {
        return enseignantClasseJuryCollection;
    }

    public void setEnseignantClasseJuryCollection(Collection<EnseignantClasseJury> enseignantClasseJuryCollection) {
        this.enseignantClasseJuryCollection = enseignantClasseJuryCollection;
    }

    @XmlTransient
    public Collection<EtablirDroit> getEtablirDroitCollection() {
        return etablirDroitCollection;
    }

    public void setEtablirDroitCollection(Collection<EtablirDroit> etablirDroitCollection) {
        this.etablirDroitCollection = etablirDroitCollection;
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
        hash += (matricule != null ? matricule.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Enseignant)) {
            return false;
        }
        Enseignant other = (Enseignant) object;
        if ((this.matricule == null && other.matricule != null) || (this.matricule != null && !this.matricule.equals(other.matricule))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Enseignant[ matricule=" + matricule + " ]";
    }
    
}

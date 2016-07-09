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
    @Size(min = 1, max = 10)
    @Column(name = "matricule")
    private String matricule;
    @Size(max = 50)
    @Column(name = "grade")
    private String grade;
    @Size(max = 50)
    @Column(name = "specialite")
    private String specialite;
    @JoinTable(name = "roleenseignant", joinColumns = {
        @JoinColumn(name = "matricule", referencedColumnName = "matricule")}, inverseJoinColumns = {
        @JoinColumn(name = "idrole", referencedColumnName = "idrole")})
    @ManyToMany
    private List<Role> roleList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matricule")
    private List<EnseignantMat> enseignantMatList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matricule")
    private List<Reponse> reponseList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matricule")
    private List<EnseignantChefDepartement> enseignantChefDepartementList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matricule")
    private List<EnseignantClasseJury> enseignantClasseJuryList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "matricule")
    private List<EtablirDroit> etablirDroitList;
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
    public List<Role> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<Role> roleList) {
        this.roleList = roleList;
    }

    @XmlTransient
    public List<EnseignantMat> getEnseignantMatList() {
        return enseignantMatList;
    }

    public void setEnseignantMatList(List<EnseignantMat> enseignantMatList) {
        this.enseignantMatList = enseignantMatList;
    }

    @XmlTransient
    public List<Reponse> getReponseList() {
        return reponseList;
    }

    public void setReponseList(List<Reponse> reponseList) {
        this.reponseList = reponseList;
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
    public List<EtablirDroit> getEtablirDroitList() {
        return etablirDroitList;
    }

    public void setEtablirDroitList(List<EtablirDroit> etablirDroitList) {
        this.etablirDroitList = etablirDroitList;
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

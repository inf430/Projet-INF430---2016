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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "departement")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Departement.findAll", query = "SELECT d FROM Departement d"),
    @NamedQuery(name = "Departement.findByIddepartement", query = "SELECT d FROM Departement d WHERE d.iddepartement = :iddepartement"),
    @NamedQuery(name = "Departement.findByCodedepartement", query = "SELECT d FROM Departement d WHERE d.codedepartement = :codedepartement"),
    @NamedQuery(name = "Departement.findByLibelle", query = "SELECT d FROM Departement d WHERE d.libelle = :libelle")})
public class Departement implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "iddepartement")
    private Integer iddepartement;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "codedepartement")
    private String codedepartement;
    @Size(max = 30)
    @Column(name = "libelle")
    private String libelle;
    @JoinColumn(name = "idfaculte", referencedColumnName = "idfaculte")
    @ManyToOne
    private Faculte idfaculte;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "iddepartement")
    private List<EnseignantChefDepartement> enseignantChefDepartementList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "iddepartement")
    private List<Enseignant> enseignantList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "iddepartement")
    private List<Filiere> filiereList;

    public Departement() {
    }

    public Departement(Integer iddepartement) {
        this.iddepartement = iddepartement;
    }

    public Departement(Integer iddepartement, String codedepartement) {
        this.iddepartement = iddepartement;
        this.codedepartement = codedepartement;
    }

    public Integer getIddepartement() {
        return iddepartement;
    }

    public void setIddepartement(Integer iddepartement) {
        this.iddepartement = iddepartement;
    }

    public String getCodedepartement() {
        return codedepartement;
    }

    public void setCodedepartement(String codedepartement) {
        this.codedepartement = codedepartement;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public Faculte getIdfaculte() {
        return idfaculte;
    }

    public void setIdfaculte(Faculte idfaculte) {
        this.idfaculte = idfaculte;
    }

    @XmlTransient
    public List<EnseignantChefDepartement> getEnseignantChefDepartementList() {
        return enseignantChefDepartementList;
    }

    public void setEnseignantChefDepartementList(List<EnseignantChefDepartement> enseignantChefDepartementList) {
        this.enseignantChefDepartementList = enseignantChefDepartementList;
    }

    @XmlTransient
    public List<Enseignant> getEnseignantList() {
        return enseignantList;
    }

    public void setEnseignantList(List<Enseignant> enseignantList) {
        this.enseignantList = enseignantList;
    }

    @XmlTransient
    public List<Filiere> getFiliereList() {
        return filiereList;
    }

    public void setFiliereList(List<Filiere> filiereList) {
        this.filiereList = filiereList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iddepartement != null ? iddepartement.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Departement)) {
            return false;
        }
        Departement other = (Departement) object;
        if ((this.iddepartement == null && other.iddepartement != null) || (this.iddepartement != null && !this.iddepartement.equals(other.iddepartement))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Departement[ iddepartement=" + iddepartement + " ]";
    }
    
}

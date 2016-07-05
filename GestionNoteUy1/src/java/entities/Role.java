/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "role")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Role.findAll", query = "SELECT r FROM Role r"),
    @NamedQuery(name = "Role.findByIdrole", query = "SELECT r FROM Role r WHERE r.idrole = :idrole"),
    @NamedQuery(name = "Role.findByRole", query = "SELECT r FROM Role r WHERE r.role = :role")})
public class Role implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idrole")
    private Integer idrole;
    @Size(max = 50)
    @Column(name = "role")
    private String role;
    @ManyToMany(mappedBy = "roleCollection")
    private Collection<Droit> droitCollection;
    @ManyToMany(mappedBy = "roleCollection")
    private Collection<Enseignant> enseignantCollection;
    @ManyToMany(mappedBy = "roleCollection")
    private Collection<Etudiant> etudiantCollection;
    @ManyToMany(mappedBy = "roleCollection")
    private Collection<Administratif> administratifCollection;
    @JoinColumn(name = "idadmin", referencedColumnName = "idadmin")
    @ManyToOne(optional = false)
    private Administrateur idadmin;

    public Role() {
    }

    public Role(Integer idrole) {
        this.idrole = idrole;
    }

    public Integer getIdrole() {
        return idrole;
    }

    public void setIdrole(Integer idrole) {
        this.idrole = idrole;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @XmlTransient
    public Collection<Droit> getDroitCollection() {
        return droitCollection;
    }

    public void setDroitCollection(Collection<Droit> droitCollection) {
        this.droitCollection = droitCollection;
    }

    @XmlTransient
    public Collection<Enseignant> getEnseignantCollection() {
        return enseignantCollection;
    }

    public void setEnseignantCollection(Collection<Enseignant> enseignantCollection) {
        this.enseignantCollection = enseignantCollection;
    }

    @XmlTransient
    public Collection<Etudiant> getEtudiantCollection() {
        return etudiantCollection;
    }

    public void setEtudiantCollection(Collection<Etudiant> etudiantCollection) {
        this.etudiantCollection = etudiantCollection;
    }

    @XmlTransient
    public Collection<Administratif> getAdministratifCollection() {
        return administratifCollection;
    }

    public void setAdministratifCollection(Collection<Administratif> administratifCollection) {
        this.administratifCollection = administratifCollection;
    }

    public Administrateur getIdadmin() {
        return idadmin;
    }

    public void setIdadmin(Administrateur idadmin) {
        this.idadmin = idadmin;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idrole != null ? idrole.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Role)) {
            return false;
        }
        Role other = (Role) object;
        if ((this.idrole == null && other.idrole != null) || (this.idrole != null && !this.idrole.equals(other.idrole))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Role[ idrole=" + idrole + " ]";
    }
    
}

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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "administratif")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Administratif.findAll", query = "SELECT a FROM Administratif a"),
    @NamedQuery(name = "Administratif.findByIdadministatif", query = "SELECT a FROM Administratif a WHERE a.idadministatif = :idadministatif")})
public class Administratif implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idadministatif")
    private Integer idadministatif;
    @JoinTable(name = "roleadministratif", joinColumns = {
        @JoinColumn(name = "idadministatif", referencedColumnName = "idadministatif")}, inverseJoinColumns = {
        @JoinColumn(name = "idrole", referencedColumnName = "idrole")})
    @ManyToMany
    private List<Role> roleList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idadministatif")
    private List<EtablirDroit> etablirDroitList;
    @JoinColumn(name = "idpersonne", referencedColumnName = "idpersonne")
    @OneToOne(optional = false)
    private Personne idpersonne;

    public Administratif() {
    }

    public Administratif(Integer idadministatif) {
        this.idadministatif = idadministatif;
    }

    public Integer getIdadministatif() {
        return idadministatif;
    }

    public void setIdadministatif(Integer idadministatif) {
        this.idadministatif = idadministatif;
    }

    @XmlTransient
    public List<Role> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<Role> roleList) {
        this.roleList = roleList;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idadministatif != null ? idadministatif.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Administratif)) {
            return false;
        }
        Administratif other = (Administratif) object;
        if ((this.idadministatif == null && other.idadministatif != null) || (this.idadministatif != null && !this.idadministatif.equals(other.idadministatif))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Administratif[ idadministatif=" + idadministatif + " ]";
    }
    
}

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
@Table(name = "droit")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Droit.findAll", query = "SELECT d FROM Droit d"),
    @NamedQuery(name = "Droit.findByIddroit", query = "SELECT d FROM Droit d WHERE d.iddroit = :iddroit"),
    @NamedQuery(name = "Droit.findByNom", query = "SELECT d FROM Droit d WHERE d.nom = :nom")})
public class Droit implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "iddroit")
    private Integer iddroit;
    @Size(max = 50)
    @Column(name = "nom")
    private String nom;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "iddroit")
    private List<Interdit> interditList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "iddroit")
    private List<DroitRole> droitRoleList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "iddroit")
    private List<EtablirDroit> etablirDroitList;

    public Droit() {
    }

    public Droit(Integer iddroit) {
        this.iddroit = iddroit;
    }

    public Integer getIddroit() {
        return iddroit;
    }

    public void setIddroit(Integer iddroit) {
        this.iddroit = iddroit;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    @XmlTransient
    public List<Interdit> getInterditList() {
        return interditList;
    }

    public void setInterditList(List<Interdit> interditList) {
        this.interditList = interditList;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iddroit != null ? iddroit.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Droit)) {
            return false;
        }
        Droit other = (Droit) object;
        if ((this.iddroit == null && other.iddroit != null) || (this.iddroit != null && !this.iddroit.equals(other.iddroit))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Droit[ iddroit=" + iddroit + " ]";
    }
    
}

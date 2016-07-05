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
@Table(name = "administrateur")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Administrateur.findAll", query = "SELECT a FROM Administrateur a"),
    @NamedQuery(name = "Administrateur.findByIdadmin", query = "SELECT a FROM Administrateur a WHERE a.idadmin = :idadmin"),
    @NamedQuery(name = "Administrateur.findByLogin", query = "SELECT a FROM Administrateur a WHERE a.login = :login"),
    @NamedQuery(name = "Administrateur.findByPassword", query = "SELECT a FROM Administrateur a WHERE a.password = :password")})
public class Administrateur implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idadmin")
    private Integer idadmin;
    @Size(max = 50)
    @Column(name = "login")
    private String login;
    @Size(max = 50)
    @Column(name = "password")
    private String password;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idadmin")
    private Collection<Droit> droitCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idadmin")
    private Collection<Role> roleCollection;

    public Administrateur() {
    }

    public Administrateur(Integer idadmin) {
        this.idadmin = idadmin;
    }

    public Integer getIdadmin() {
        return idadmin;
    }

    public void setIdadmin(Integer idadmin) {
        this.idadmin = idadmin;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @XmlTransient
    public Collection<Droit> getDroitCollection() {
        return droitCollection;
    }

    public void setDroitCollection(Collection<Droit> droitCollection) {
        this.droitCollection = droitCollection;
    }

    @XmlTransient
    public Collection<Role> getRoleCollection() {
        return roleCollection;
    }

    public void setRoleCollection(Collection<Role> roleCollection) {
        this.roleCollection = roleCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idadmin != null ? idadmin.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Administrateur)) {
            return false;
        }
        Administrateur other = (Administrateur) object;
        if ((this.idadmin == null && other.idadmin != null) || (this.idadmin != null && !this.idadmin.equals(other.idadmin))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Administrateur[ idadmin=" + idadmin + " ]";
    }
    
}

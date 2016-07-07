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
@Table(name = "niveau")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Niveau.findAll", query = "SELECT n FROM Niveau n"),
    @NamedQuery(name = "Niveau.findByNiveau", query = "SELECT n FROM Niveau n WHERE n.niveau = :niveau"),
    @NamedQuery(name = "Niveau.findByCycle", query = "SELECT n FROM Niveau n WHERE n.cycle = :cycle")})
public class Niveau implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "niveau")
    private String niveau;
    @Size(max = 255)
    @Column(name = "cycle")
    private String cycle;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "niveau")
    private Collection<Classe> classeCollection;

    public Niveau() {
    }

    public Niveau(String niveau) {
        this.niveau = niveau;
    }

    public String getNiveau() {
        return niveau;
    }

    public void setNiveau(String niveau) {
        this.niveau = niveau;
    }

    public String getCycle() {
        return cycle;
    }

    public void setCycle(String cycle) {
        this.cycle = cycle;
    }

    @XmlTransient
    public Collection<Classe> getClasseCollection() {
        return classeCollection;
    }

    public void setClasseCollection(Collection<Classe> classeCollection) {
        this.classeCollection = classeCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (niveau != null ? niveau.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Niveau)) {
            return false;
        }
        Niveau other = (Niveau) object;
        if ((this.niveau == null && other.niveau != null) || (this.niveau != null && !this.niveau.equals(other.niveau))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Niveau[ niveau=" + niveau + " ]";
    }
    
}

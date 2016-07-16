/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
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
@Table(name = "faculte")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Faculte.findAll", query = "SELECT f FROM Faculte f"),
    @NamedQuery(name = "Faculte.findByIdfaculte", query = "SELECT f FROM Faculte f WHERE f.idfaculte = :idfaculte"),
    @NamedQuery(name = "Faculte.findByLibellefaculte", query = "SELECT f FROM Faculte f WHERE f.libellefaculte = :libellefaculte")})
public class Faculte implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 128)
    @Column(name = "idfaculte")
    private String idfaculte;
    @Size(max = 128)
    @Column(name = "libellefaculte")
    private String libellefaculte;
    @OneToMany(mappedBy = "idfaculte")
    private List<Departement> departementList;

    public Faculte() {
    }

    public Faculte(String idfaculte) {
        this.idfaculte = idfaculte;
    }

    public String getIdfaculte() {
        return idfaculte;
    }

    public void setIdfaculte(String idfaculte) {
        this.idfaculte = idfaculte;
    }

    public String getLibellefaculte() {
        return libellefaculte;
    }

    public void setLibellefaculte(String libellefaculte) {
        this.libellefaculte = libellefaculte;
    }

    @XmlTransient
    public List<Departement> getDepartementList() {
        return departementList;
    }

    public void setDepartementList(List<Departement> departementList) {
        this.departementList = departementList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idfaculte != null ? idfaculte.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Faculte)) {
            return false;
        }
        Faculte other = (Faculte) object;
        if ((this.idfaculte == null && other.idfaculte != null) || (this.idfaculte != null && !this.idfaculte.equals(other.idfaculte))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Faculte[ idfaculte=" + idfaculte + " ]";
    }
    
}

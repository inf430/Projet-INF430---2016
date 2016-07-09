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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "filiere")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Filiere.findAll", query = "SELECT f FROM Filiere f"),
    @NamedQuery(name = "Filiere.findByIdfiliere", query = "SELECT f FROM Filiere f WHERE f.idfiliere = :idfiliere"),
    @NamedQuery(name = "Filiere.findByCode", query = "SELECT f FROM Filiere f WHERE f.code = :code"),
    @NamedQuery(name = "Filiere.findByLibelle", query = "SELECT f FROM Filiere f WHERE f.libelle = :libelle")})
public class Filiere implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idfiliere")
    private Integer idfiliere;
    @Size(max = 30)
    @Column(name = "code")
    private String code;
    @Size(max = 30)
    @Column(name = "libelle")
    private String libelle;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idfiliere")
    private List<Classe> classeList;
    @JoinColumn(name = "iddepartement", referencedColumnName = "iddepartement")
    @ManyToOne(optional = false)
    private Departement iddepartement;

    public Filiere() {
    }

    public Filiere(Integer idfiliere) {
        this.idfiliere = idfiliere;
    }

    public Integer getIdfiliere() {
        return idfiliere;
    }

    public void setIdfiliere(Integer idfiliere) {
        this.idfiliere = idfiliere;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    @XmlTransient
    public List<Classe> getClasseList() {
        return classeList;
    }

    public void setClasseList(List<Classe> classeList) {
        this.classeList = classeList;
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
        hash += (idfiliere != null ? idfiliere.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Filiere)) {
            return false;
        }
        Filiere other = (Filiere) object;
        if ((this.idfiliere == null && other.idfiliere != null) || (this.idfiliere != null && !this.idfiliere.equals(other.idfiliere))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Filiere[ idfiliere=" + idfiliere + " ]";
    }
    
}

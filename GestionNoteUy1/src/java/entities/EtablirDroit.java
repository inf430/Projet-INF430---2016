/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "etablir_droit")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EtablirDroit.findAll", query = "SELECT e FROM EtablirDroit e"),
    @NamedQuery(name = "EtablirDroit.findByIdetablirdroit", query = "SELECT e FROM EtablirDroit e WHERE e.idetablirdroit = :idetablirdroit"),
    @NamedQuery(name = "EtablirDroit.findByDatedeb", query = "SELECT e FROM EtablirDroit e WHERE e.datedeb = :datedeb"),
    @NamedQuery(name = "EtablirDroit.findByDatefin", query = "SELECT e FROM EtablirDroit e WHERE e.datefin = :datefin")})
public class EtablirDroit implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idetablirdroit")
    private Integer idetablirdroit;
    @Size(max = 10)
    @Column(name = "datedeb")
    private String datedeb;
    @Size(max = 10)
    @Column(name = "datefin")
    private String datefin;
    @JoinColumn(name = "matricule", referencedColumnName = "matricule")
    @ManyToOne(optional = false)
    private Enseignant matricule;
    @JoinColumn(name = "iddroit", referencedColumnName = "iddroit")
    @ManyToOne(optional = false)
    private Droit iddroit;
    @JoinColumn(name = "idadministatif", referencedColumnName = "idadministatif")
    @ManyToOne(optional = false)
    private Administratif idadministatif;

    public EtablirDroit() {
    }

    public EtablirDroit(Integer idetablirdroit) {
        this.idetablirdroit = idetablirdroit;
    }

    public Integer getIdetablirdroit() {
        return idetablirdroit;
    }

    public void setIdetablirdroit(Integer idetablirdroit) {
        this.idetablirdroit = idetablirdroit;
    }

    public String getDatedeb() {
        return datedeb;
    }

    public void setDatedeb(String datedeb) {
        this.datedeb = datedeb;
    }

    public String getDatefin() {
        return datefin;
    }

    public void setDatefin(String datefin) {
        this.datefin = datefin;
    }

    public Enseignant getMatricule() {
        return matricule;
    }

    public void setMatricule(Enseignant matricule) {
        this.matricule = matricule;
    }

    public Droit getIddroit() {
        return iddroit;
    }

    public void setIddroit(Droit iddroit) {
        this.iddroit = iddroit;
    }

    public Administratif getIdadministatif() {
        return idadministatif;
    }

    public void setIdadministatif(Administratif idadministatif) {
        this.idadministatif = idadministatif;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idetablirdroit != null ? idetablirdroit.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EtablirDroit)) {
            return false;
        }
        EtablirDroit other = (EtablirDroit) object;
        if ((this.idetablirdroit == null && other.idetablirdroit != null) || (this.idetablirdroit != null && !this.idetablirdroit.equals(other.idetablirdroit))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.EtablirDroit[ idetablirdroit=" + idetablirdroit + " ]";
    }
    
}

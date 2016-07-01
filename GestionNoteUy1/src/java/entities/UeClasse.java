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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "ue_classe")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UeClasse.findAll", query = "SELECT u FROM UeClasse u"),
    @NamedQuery(name = "UeClasse.findByIdueclasse", query = "SELECT u FROM UeClasse u WHERE u.idueclasse = :idueclasse")})
public class UeClasse implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idueclasse")
    private Integer idueclasse;
    @JoinColumn(name = "code", referencedColumnName = "code")
    @ManyToOne(optional = false)
    private Ue code;
    @JoinColumn(name = "idclasse", referencedColumnName = "idclasse")
    @ManyToOne(optional = false)
    private Classe idclasse;
    @JoinColumn(name = "annee", referencedColumnName = "annee")
    @ManyToOne(optional = false)
    private AnneeAcademique annee;

    public UeClasse() {
    }

    public UeClasse(Integer idueclasse) {
        this.idueclasse = idueclasse;
    }

    public Integer getIdueclasse() {
        return idueclasse;
    }

    public void setIdueclasse(Integer idueclasse) {
        this.idueclasse = idueclasse;
    }

    public Ue getCode() {
        return code;
    }

    public void setCode(Ue code) {
        this.code = code;
    }

    public Classe getIdclasse() {
        return idclasse;
    }

    public void setIdclasse(Classe idclasse) {
        this.idclasse = idclasse;
    }

    public AnneeAcademique getAnnee() {
        return annee;
    }

    public void setAnnee(AnneeAcademique annee) {
        this.annee = annee;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idueclasse != null ? idueclasse.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UeClasse)) {
            return false;
        }
        UeClasse other = (UeClasse) object;
        if ((this.idueclasse == null && other.idueclasse != null) || (this.idueclasse != null && !this.idueclasse.equals(other.idueclasse))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.UeClasse[ idueclasse=" + idueclasse + " ]";
    }
    
}

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
@Table(name = "matiere_ue")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MatiereUe.findAll", query = "SELECT m FROM MatiereUe m"),
    @NamedQuery(name = "MatiereUe.findByIdmatiereue", query = "SELECT m FROM MatiereUe m WHERE m.idmatiereue = :idmatiereue"),
    @NamedQuery(name = "MatiereUe.findByCredit", query = "SELECT m FROM MatiereUe m WHERE m.credit = :credit")})
public class MatiereUe implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idmatiereue")
    private Integer idmatiereue;
    @Column(name = "credit")
    private Integer credit;
    @JoinColumn(name = "code", referencedColumnName = "code")
    @ManyToOne(optional = false)
    private Ue code;
    @JoinColumn(name = "idmatiere", referencedColumnName = "idmatiere")
    @ManyToOne(optional = false)
    private Matiere idmatiere;
    @JoinColumn(name = "annee", referencedColumnName = "annee")
    @ManyToOne(optional = false)
    private AnneeAcademique annee;

    public MatiereUe() {
    }

    public MatiereUe(Integer idmatiereue) {
        this.idmatiereue = idmatiereue;
    }

    public Integer getIdmatiereue() {
        return idmatiereue;
    }

    public void setIdmatiereue(Integer idmatiereue) {
        this.idmatiereue = idmatiereue;
    }

    public Integer getCredit() {
        return credit;
    }

    public void setCredit(Integer credit) {
        this.credit = credit;
    }

    public Ue getCode() {
        return code;
    }

    public void setCode(Ue code) {
        this.code = code;
    }

    public Matiere getIdmatiere() {
        return idmatiere;
    }

    public void setIdmatiere(Matiere idmatiere) {
        this.idmatiere = idmatiere;
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
        hash += (idmatiereue != null ? idmatiereue.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MatiereUe)) {
            return false;
        }
        MatiereUe other = (MatiereUe) object;
        if ((this.idmatiereue == null && other.idmatiereue != null) || (this.idmatiereue != null && !this.idmatiereue.equals(other.idmatiereue))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.MatiereUe[ idmatiereue=" + idmatiereue + " ]";
    }
    
}

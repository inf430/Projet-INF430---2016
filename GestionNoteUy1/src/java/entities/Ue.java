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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "ue")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ue.findAll", query = "SELECT u FROM Ue u"),
    @NamedQuery(name = "Ue.findByCodeue", query = "SELECT u FROM Ue u WHERE u.codeue = :codeue"),
    @NamedQuery(name = "Ue.findByLibelle", query = "SELECT u FROM Ue u WHERE u.libelle = :libelle")})
public class Ue implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "codeue")
    private String codeue;
    @Size(max = 30)
    @Column(name = "libelle")
    private String libelle;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codeue")
    private List<MatiereUe> matiereUeList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codeue")
    private List<DroitRole> droitRoleList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codeue")
    private List<EtablirDroit> etablirDroitList;
    @JoinColumn(name = "idsemestre", referencedColumnName = "idsemestre")
    @ManyToOne(optional = false)
    private Semestre idsemestre;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codeue")
    private List<UeClasse> ueClasseList;

    public Ue() {
    }

    public Ue(String codeue) {
        this.codeue = codeue;
    }

    public String getCodeue() {
        return codeue;
    }

    public void setCodeue(String codeue) {
        this.codeue = codeue;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    @XmlTransient
    public List<MatiereUe> getMatiereUeList() {
        return matiereUeList;
    }

    public void setMatiereUeList(List<MatiereUe> matiereUeList) {
        this.matiereUeList = matiereUeList;
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

    public Semestre getIdsemestre() {
        return idsemestre;
    }

    public void setIdsemestre(Semestre idsemestre) {
        this.idsemestre = idsemestre;
    }

    @XmlTransient
    public List<UeClasse> getUeClasseList() {
        return ueClasseList;
    }

    public void setUeClasseList(List<UeClasse> ueClasseList) {
        this.ueClasseList = ueClasseList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codeue != null ? codeue.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ue)) {
            return false;
        }
        Ue other = (Ue) object;
        if ((this.codeue == null && other.codeue != null) || (this.codeue != null && !this.codeue.equals(other.codeue))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Ue[ codeue=" + codeue + " ]";
    }
    
}

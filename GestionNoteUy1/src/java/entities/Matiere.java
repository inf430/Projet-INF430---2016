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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "matiere")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Matiere.findAll", query = "SELECT m FROM Matiere m"),
    @NamedQuery(name = "Matiere.findByIdmatiere", query = "SELECT m FROM Matiere m WHERE m.idmatiere = :idmatiere"),
    @NamedQuery(name = "Matiere.findByCodematiere", query = "SELECT m FROM Matiere m WHERE m.codematiere = :codematiere"),
    @NamedQuery(name = "Matiere.findByLibelle", query = "SELECT m FROM Matiere m WHERE m.libelle = :libelle")})
public class Matiere implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idmatiere")
    private Integer idmatiere;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "codematiere")
    private String codematiere;
    @Size(max = 50)
    @Column(name = "libelle")
    private String libelle;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idmatiere")
    private List<EnseignantMat> enseignantMatList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idmatiere")
    private List<MatiereUe> matiereUeList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idmatiere")
    private List<Requeteenseignant> requeteenseignantList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idmatiere")
    private List<DroitRole> droitRoleList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idmatiere")
    private List<EtablirDroit> etablirDroitList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idmatiere")
    private List<Inscription> inscriptionList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idmatiere")
    private List<MatiereExam> matiereExamList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idmatiere")
    private List<Requetematiere> requetematiereList;

    public Matiere() {
    }

    public Matiere(Integer idmatiere) {
        this.idmatiere = idmatiere;
    }

    public Matiere(Integer idmatiere, String codematiere) {
        this.idmatiere = idmatiere;
        this.codematiere = codematiere;
    }

    public Integer getIdmatiere() {
        return idmatiere;
    }

    public void setIdmatiere(Integer idmatiere) {
        this.idmatiere = idmatiere;
    }

    public String getCodematiere() {
        return codematiere;
    }

    public void setCodematiere(String codematiere) {
        this.codematiere = codematiere;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    @XmlTransient
    public List<EnseignantMat> getEnseignantMatList() {
        return enseignantMatList;
    }

    public void setEnseignantMatList(List<EnseignantMat> enseignantMatList) {
        this.enseignantMatList = enseignantMatList;
    }

    @XmlTransient
    public List<MatiereUe> getMatiereUeList() {
        return matiereUeList;
    }

    public void setMatiereUeList(List<MatiereUe> matiereUeList) {
        this.matiereUeList = matiereUeList;
    }

    @XmlTransient
    public List<Requeteenseignant> getRequeteenseignantList() {
        return requeteenseignantList;
    }

    public void setRequeteenseignantList(List<Requeteenseignant> requeteenseignantList) {
        this.requeteenseignantList = requeteenseignantList;
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

    @XmlTransient
    public List<Inscription> getInscriptionList() {
        return inscriptionList;
    }

    public void setInscriptionList(List<Inscription> inscriptionList) {
        this.inscriptionList = inscriptionList;
    }

    @XmlTransient
    public List<MatiereExam> getMatiereExamList() {
        return matiereExamList;
    }

    public void setMatiereExamList(List<MatiereExam> matiereExamList) {
        this.matiereExamList = matiereExamList;
    }

    @XmlTransient
    public List<Requetematiere> getRequetematiereList() {
        return requetematiereList;
    }

    public void setRequetematiereList(List<Requetematiere> requetematiereList) {
        this.requetematiereList = requetematiereList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idmatiere != null ? idmatiere.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Matiere)) {
            return false;
        }
        Matiere other = (Matiere) object;
        if ((this.idmatiere == null && other.idmatiere != null) || (this.idmatiere != null && !this.idmatiere.equals(other.idmatiere))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Matiere[ idmatiere=" + idmatiere + " ]";
    }
    
}

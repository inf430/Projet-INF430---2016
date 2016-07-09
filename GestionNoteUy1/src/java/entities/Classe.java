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
@Table(name = "classe")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Classe.findAll", query = "SELECT c FROM Classe c"),
    @NamedQuery(name = "Classe.findByIdclasse", query = "SELECT c FROM Classe c WHERE c.idclasse = :idclasse"),
    @NamedQuery(name = "Classe.findByNom", query = "SELECT c FROM Classe c WHERE c.nom = :nom")})
public class Classe implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idclasse")
    private Integer idclasse;
    @Size(max = 50)
    @Column(name = "nom")
    private String nom;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idclasse")
    private List<EnseignantClasseJury> enseignantClasseJuryList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idclasse")
    private List<EtudiantClasse> etudiantClasseList;
    @JoinColumn(name = "niveau", referencedColumnName = "niveau")
    @ManyToOne(optional = false)
    private Niveau niveau;
    @JoinColumn(name = "idfiliere", referencedColumnName = "idfiliere")
    @ManyToOne(optional = false)
    private Filiere idfiliere;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idclasse")
    private List<UeClasse> ueClasseList;

    public Classe() {
    }

    public Classe(Integer idclasse) {
        this.idclasse = idclasse;
    }

    public Integer getIdclasse() {
        return idclasse;
    }

    public void setIdclasse(Integer idclasse) {
        this.idclasse = idclasse;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    @XmlTransient
    public List<EnseignantClasseJury> getEnseignantClasseJuryList() {
        return enseignantClasseJuryList;
    }

    public void setEnseignantClasseJuryList(List<EnseignantClasseJury> enseignantClasseJuryList) {
        this.enseignantClasseJuryList = enseignantClasseJuryList;
    }

    @XmlTransient
    public List<EtudiantClasse> getEtudiantClasseList() {
        return etudiantClasseList;
    }

    public void setEtudiantClasseList(List<EtudiantClasse> etudiantClasseList) {
        this.etudiantClasseList = etudiantClasseList;
    }

    public Niveau getNiveau() {
        return niveau;
    }

    public void setNiveau(Niveau niveau) {
        this.niveau = niveau;
    }

    public Filiere getIdfiliere() {
        return idfiliere;
    }

    public void setIdfiliere(Filiere idfiliere) {
        this.idfiliere = idfiliere;
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
        hash += (idclasse != null ? idclasse.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Classe)) {
            return false;
        }
        Classe other = (Classe) object;
        if ((this.idclasse == null && other.idclasse != null) || (this.idclasse != null && !this.idclasse.equals(other.idclasse))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Classe[ idclasse=" + idclasse + " ]";
    }
    
}

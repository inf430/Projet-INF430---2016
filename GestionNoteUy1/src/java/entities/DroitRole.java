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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "droit_role")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DroitRole.findAll", query = "SELECT d FROM DroitRole d"),
    @NamedQuery(name = "DroitRole.findByIdDroitrole", query = "SELECT d FROM DroitRole d WHERE d.idDroitrole = :idDroitrole")})
public class DroitRole implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_droitrole")
    private Integer idDroitrole;
    @JoinColumn(name = "codeue", referencedColumnName = "codeue")
    @ManyToOne(optional = false)
    private Ue codeue;
    @JoinColumn(name = "idrole", referencedColumnName = "idrole")
    @ManyToOne(optional = false)
    private Role idrole;
    @JoinColumn(name = "idmatiere", referencedColumnName = "idmatiere")
    @ManyToOne(optional = false)
    private Matiere idmatiere;
    @JoinColumn(name = "idexamen", referencedColumnName = "idexamen")
    @ManyToOne(optional = false)
    private Examen idexamen;
    @JoinColumn(name = "matriculeetudiant", referencedColumnName = "matriculeetudiant")
    @ManyToOne(optional = false)
    private Etudiant matriculeetudiant;
    @JoinColumn(name = "iddroit", referencedColumnName = "iddroit")
    @ManyToOne(optional = false)
    private Droit iddroit;
    @JoinColumn(name = "idclasse", referencedColumnName = "idclasse")
    @ManyToOne(optional = false)
    private Classe idclasse;

    public DroitRole() {
    }

    public DroitRole(Integer idDroitrole) {
        this.idDroitrole = idDroitrole;
    }

    public Integer getIdDroitrole() {
        return idDroitrole;
    }

    public void setIdDroitrole(Integer idDroitrole) {
        this.idDroitrole = idDroitrole;
    }

    public Ue getCodeue() {
        return codeue;
    }

    public void setCodeue(Ue codeue) {
        this.codeue = codeue;
    }

    public Role getIdrole() {
        return idrole;
    }

    public void setIdrole(Role idrole) {
        this.idrole = idrole;
    }

    public Matiere getIdmatiere() {
        return idmatiere;
    }

    public void setIdmatiere(Matiere idmatiere) {
        this.idmatiere = idmatiere;
    }

    public Examen getIdexamen() {
        return idexamen;
    }

    public void setIdexamen(Examen idexamen) {
        this.idexamen = idexamen;
    }

    public Etudiant getMatriculeetudiant() {
        return matriculeetudiant;
    }

    public void setMatriculeetudiant(Etudiant matriculeetudiant) {
        this.matriculeetudiant = matriculeetudiant;
    }

    public Droit getIddroit() {
        return iddroit;
    }

    public void setIddroit(Droit iddroit) {
        this.iddroit = iddroit;
    }

    public Classe getIdclasse() {
        return idclasse;
    }

    public void setIdclasse(Classe idclasse) {
        this.idclasse = idclasse;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDroitrole != null ? idDroitrole.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DroitRole)) {
            return false;
        }
        DroitRole other = (DroitRole) object;
        if ((this.idDroitrole == null && other.idDroitrole != null) || (this.idDroitrole != null && !this.idDroitrole.equals(other.idDroitrole))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.DroitRole[ idDroitrole=" + idDroitrole + " ]";
    }
    
}

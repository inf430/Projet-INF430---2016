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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "matiere_exam")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MatiereExam.findAll", query = "SELECT m FROM MatiereExam m"),
    @NamedQuery(name = "MatiereExam.findByIdmatiereexam", query = "SELECT m FROM MatiereExam m WHERE m.idmatiereexam = :idmatiereexam")})
public class MatiereExam implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idmatiereexam")
    private Integer idmatiereexam;
    @OneToMany(mappedBy = "idmatiereexam")
    private List<EtudiantExam> etudiantExamList;
    @JoinColumn(name = "idmatiere", referencedColumnName = "idmatiere")
    @ManyToOne(optional = false)
    private Matiere idmatiere;
    @JoinColumn(name = "idexamen", referencedColumnName = "idexamen")
    @ManyToOne(optional = false)
    private Examen idexamen;
    @JoinColumn(name = "annee", referencedColumnName = "annee")
    @ManyToOne(optional = false)
    private AnneeAcademique annee;

    public MatiereExam() {
    }

    public MatiereExam(Integer idmatiereexam) {
        this.idmatiereexam = idmatiereexam;
    }

    public Integer getIdmatiereexam() {
        return idmatiereexam;
    }

    public void setIdmatiereexam(Integer idmatiereexam) {
        this.idmatiereexam = idmatiereexam;
    }

    @XmlTransient
    public List<EtudiantExam> getEtudiantExamList() {
        return etudiantExamList;
    }

    public void setEtudiantExamList(List<EtudiantExam> etudiantExamList) {
        this.etudiantExamList = etudiantExamList;
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

    public AnneeAcademique getAnnee() {
        return annee;
    }

    public void setAnnee(AnneeAcademique annee) {
        this.annee = annee;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idmatiereexam != null ? idmatiereexam.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MatiereExam)) {
            return false;
        }
        MatiereExam other = (MatiereExam) object;
        if ((this.idmatiereexam == null && other.idmatiereexam != null) || (this.idmatiereexam != null && !this.idmatiereexam.equals(other.idmatiereexam))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.MatiereExam[ idmatiereexam=" + idmatiereexam + " ]";
    }
    
}

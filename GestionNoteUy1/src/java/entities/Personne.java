/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author HP
 */
@Entity
@Table(name = "personne")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Personne.findAll", query = "SELECT p FROM Personne p"),
    @NamedQuery(name = "Personne.findByIdpersonne", query = "SELECT p FROM Personne p WHERE p.idpersonne = :idpersonne"),
    @NamedQuery(name = "Personne.findByNom", query = "SELECT p FROM Personne p WHERE p.nom = :nom"),
    @NamedQuery(name = "Personne.findByPrenom", query = "SELECT p FROM Personne p WHERE p.prenom = :prenom"),
    @NamedQuery(name = "Personne.findByDatenaiss", query = "SELECT p FROM Personne p WHERE p.datenaiss = :datenaiss"),
    @NamedQuery(name = "Personne.findByLieunaiss", query = "SELECT p FROM Personne p WHERE p.lieunaiss = :lieunaiss"),
    @NamedQuery(name = "Personne.findBySexe", query = "SELECT p FROM Personne p WHERE p.sexe = :sexe"),
    @NamedQuery(name = "Personne.findByLogin", query = "SELECT p FROM Personne p WHERE p.login = :login"),
    @NamedQuery(name = "Personne.findByPassword", query = "SELECT p FROM Personne p WHERE p.password = :password"),
    @NamedQuery(name = "Personne.findByStatut", query = "SELECT p FROM Personne p WHERE p.statut = :statut"),
    @NamedQuery(name = "Personne.findByNumtel", query = "SELECT p FROM Personne p WHERE p.numtel = :numtel"),
    @NamedQuery(name = "Personne.findByNationalite", query = "SELECT p FROM Personne p WHERE p.nationalite = :nationalite"),
    @NamedQuery(name = "Personne.findByRegion", query = "SELECT p FROM Personne p WHERE p.region = :region"),
    @NamedQuery(name = "Personne.findByDepartement", query = "SELECT p FROM Personne p WHERE p.departement = :departement"),
    @NamedQuery(name = "Personne.findByHandicap", query = "SELECT p FROM Personne p WHERE p.handicap = :handicap"),
    @NamedQuery(name = "Personne.findByToken", query = "SELECT p FROM Personne p WHERE p.token = :token"),
    @NamedQuery(name = "Personne.findByEmail", query = "SELECT p FROM Personne p WHERE p.email = :email"),
    @NamedQuery(name = "Personne.findByDatemodifdebut", query = "SELECT p FROM Personne p WHERE p.datemodifdebut = :datemodifdebut"),
    @NamedQuery(name = "Personne.findByDatemodiffin", query = "SELECT p FROM Personne p WHERE p.datemodiffin = :datemodiffin"),
    @NamedQuery(name = "Personne.findByValidToken", query = "SELECT p FROM Personne p WHERE p.validToken = :validToken")})
public class Personne implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idpersonne")
    private Integer idpersonne;
    @Size(max = 50)
    @Column(name = "nom")
    private String nom;
    @Size(max = 50)
    @Column(name = "prenom")
    private String prenom;
    @Size(max = 10)
    @Column(name = "datenaiss")
    private String datenaiss;
    @Size(max = 30)
    @Column(name = "lieunaiss")
    private String lieunaiss;
    @Column(name = "sexe")
    private Character sexe;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "login")
    private String login;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "password")
    private String password;
    @Size(max = 15)
    @Column(name = "statut")
    private String statut;
    @Size(max = 2147483647)
    @Column(name = "numtel")
    private String numtel;
    @Size(max = 128)
    @Column(name = "nationalite")
    private String nationalite;
    @Size(max = 128)
    @Column(name = "region")
    private String region;
    @Size(max = 128)
    @Column(name = "departement")
    private String departement;
    @Size(max = 128)
    @Column(name = "handicap")
    private String handicap;
    @Size(max = 128)
    @Column(name = "token")
    private String token;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 128)
    @Column(name = "email")
    private String email;
    @Column(name = "datemodifdebut")
    @Temporal(TemporalType.TIMESTAMP)
    private Date datemodifdebut;
    @Column(name = "datemodiffin")
    @Temporal(TemporalType.TIMESTAMP)
    private Date datemodiffin;
    @Column(name = "valid_token")
    private Integer validToken;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idpersonne")
    private List<Reponse> reponseList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idpersonne")
    private List<Interdit> interditList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idpersonne")
    private List<Role> roleList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idpersonne")
    private List<EtablirDroit> etablirDroitList;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "idpersonne")
    private Enseignant enseignant;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "idpersonne")
    private Recteur recteur;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "idpersonne")
    private Administratif administratif;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "idpersonne")
    private Etudiant etudiant;

    public Personne() {
    }

    public Personne(Integer idpersonne) {
        this.idpersonne = idpersonne;
    }

    public Personne(Integer idpersonne, String login, String password) {
        this.idpersonne = idpersonne;
        this.login = login;
        this.password = password;
    }

    public Integer getIdpersonne() {
        return idpersonne;
    }

    public void setIdpersonne(Integer idpersonne) {
        this.idpersonne = idpersonne;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getDatenaiss() {
        return datenaiss;
    }

    public void setDatenaiss(String datenaiss) {
        this.datenaiss = datenaiss;
    }

    public String getLieunaiss() {
        return lieunaiss;
    }

    public void setLieunaiss(String lieunaiss) {
        this.lieunaiss = lieunaiss;
    }

    public Character getSexe() {
        return sexe;
    }

    public void setSexe(Character sexe) {
        this.sexe = sexe;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatut() {
        return statut;
    }

    public void setStatut(String statut) {
        this.statut = statut;
    }

    public String getNumtel() {
        return numtel;
    }

    public void setNumtel(String numtel) {
        this.numtel = numtel;
    }

    public String getNationalite() {
        return nationalite;
    }

    public void setNationalite(String nationalite) {
        this.nationalite = nationalite;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getDepartement() {
        return departement;
    }

    public void setDepartement(String departement) {
        this.departement = departement;
    }

    public String getHandicap() {
        return handicap;
    }

    public void setHandicap(String handicap) {
        this.handicap = handicap;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDatemodifdebut() {
        return datemodifdebut;
    }

    public void setDatemodifdebut(Date datemodifdebut) {
        this.datemodifdebut = datemodifdebut;
    }

    public Date getDatemodiffin() {
        return datemodiffin;
    }

    public void setDatemodiffin(Date datemodiffin) {
        this.datemodiffin = datemodiffin;
    }

    public Integer getValidToken() {
        return validToken;
    }

    public void setValidToken(Integer validToken) {
        this.validToken = validToken;
    }

    @XmlTransient
    public List<Reponse> getReponseList() {
        return reponseList;
    }

    public void setReponseList(List<Reponse> reponseList) {
        this.reponseList = reponseList;
    }

    @XmlTransient
    public List<Interdit> getInterditList() {
        return interditList;
    }

    public void setInterditList(List<Interdit> interditList) {
        this.interditList = interditList;
    }

    @XmlTransient
    public List<Role> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<Role> roleList) {
        this.roleList = roleList;
    }

    @XmlTransient
    public List<EtablirDroit> getEtablirDroitList() {
        return etablirDroitList;
    }

    public void setEtablirDroitList(List<EtablirDroit> etablirDroitList) {
        this.etablirDroitList = etablirDroitList;
    }

    public Enseignant getEnseignant() {
        return enseignant;
    }

    public void setEnseignant(Enseignant enseignant) {
        this.enseignant = enseignant;
    }

    public Recteur getRecteur() {
        return recteur;
    }

    public void setRecteur(Recteur recteur) {
        this.recteur = recteur;
    }

    public Administratif getAdministratif() {
        return administratif;
    }

    public void setAdministratif(Administratif administratif) {
        this.administratif = administratif;
    }

    public Etudiant getEtudiant() {
        return etudiant;
    }

    public void setEtudiant(Etudiant etudiant) {
        this.etudiant = etudiant;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idpersonne != null ? idpersonne.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Personne)) {
            return false;
        }
        Personne other = (Personne) object;
        if ((this.idpersonne == null && other.idpersonne != null) || (this.idpersonne != null && !this.idpersonne.equals(other.idpersonne))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Personne[ idpersonne=" + idpersonne + " ]";
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe4.modeles;

import gesnote.groupe4.parameters.PvParUeParameter;
import java.io.IOException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;

/**
 *
 * @author MBOUOPDA MICHAEL
 */
@Stateless
public class ReportDao {

    private String getRelativePath(String rootPath, String jasperFileFolder) {
        String path = rootPath + "/groupe4/" + jasperFileFolder + "/" + jasperFileFolder + ".jasper";

        try {
            JasperCompileManager.compileReportToFile(rootPath + "/groupe4/" + jasperFileFolder + "/" + jasperFileFolder + ".jrxml", path);
            System.out.println("\n******************\n Compilation OK \n*****************\n");
        } catch (JRException ex) {
            System.out.println("\n******************\n Compilation ERREUR \n*****************\n");
            Logger.getLogger(ReportDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("\n\n Real path \n" + path + " \n end Real Path \n\n");

        return path;
    }

    private Exporter getExporter(String rootPath, String jrxmlFileFolder, HttpServletResponse httpServletResponse, HashMap param) {

        return new Exporter(getRelativePath(rootPath, jrxmlFileFolder), param, httpServletResponse);
    }

    public void pvParUeInExcel(String webInfRealPath, HttpServletResponse httpServletResponse, PvParUeParameter param) {
        try {
            getExporter(webInfRealPath, "pvParUe", httpServletResponse, param).exportInExcelFormat();
        } catch (JRException | IOException ex) {
            Logger.getLogger(ReportDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void ficheAcaInPdf(String webInfRealPath, HttpServletResponse httpServletResponse, String aneaca, String matricule) {
        HashMap<String, Object> param = new HashMap<>();
        param.put("mat", matricule);
        param.put("annee", aneaca);
        try {
            getExporter(webInfRealPath, "ficheAca", httpServletResponse, param).exportInPDF();
        } catch (JRException | IOException ex) {
            Logger.getLogger(ReportDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void listAdmisParMatInPdf(String webInfRealPath, HttpServletResponse httpServletResponse, String aneaca, int idMatiere, int idClasse) {
        HashMap<String, Object> param = new HashMap<>();
        param.put("idmatiere", idMatiere);
        param.put("idclasse", idClasse);
        param.put("annee", aneaca);
        try {
            getExporter(webInfRealPath, "listeAdmisParMat", httpServletResponse, param).exportInPDF();
        } catch (JRException | IOException ex) {
            Logger.getLogger(ReportDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void listAdmisParMatInExcel(String webInfRealPath, HttpServletResponse httpServletResponse, String aneaca, int idMatiere, int idClasse) {
        HashMap<String, Object> param = new HashMap<>();
        param.put("idmatiere", idMatiere);
        param.put("idclasse", idClasse);
        param.put("annee", aneaca);
        try {
            getExporter(webInfRealPath, "listeAdmisParMat", httpServletResponse, param).exportInExcelFormat();
        } catch (JRException | IOException ex) {
            Logger.getLogger(ReportDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void listNonAdmisParMatInPdf(String webInfRealPath, HttpServletResponse httpServletResponse, String aneaca, int idMatiere, int idClasse) {
        HashMap<String, Object> param = new HashMap<>();
        param.put("idmatiere", idMatiere);
        param.put("idclasse", idClasse);
        param.put("annee", aneaca);
        try {
            getExporter(webInfRealPath, "listeNonAdmisParMat", httpServletResponse, param).exportInPDF();
        } catch (JRException | IOException ex) {
            Logger.getLogger(ReportDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void listNonAdmisParMatInExcel(String webInfRealPath, HttpServletResponse httpServletResponse, String aneaca, int idMatiere, int idClasse) {
        HashMap<String, Object> param = new HashMap<>();
        param.put("idmatiere", idMatiere);
        param.put("idclasse", idClasse);
        param.put("annee", aneaca);
        try {
            getExporter(webInfRealPath, "listeNonAdmisParMat", httpServletResponse, param).exportInExcelFormat();
        } catch (JRException | IOException ex) {
            Logger.getLogger(ReportDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void pvParUeInPdf(String webInRealPath, HttpServletResponse httpServletResponse, PvParUeParameter param) {
        try {
            getExporter(webInRealPath, "pvParUe", httpServletResponse, param).exportInPDF();
        } catch (JRException | IOException ex) {
            Logger.getLogger(ReportDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void listChefDeptInExcel(String webInfRealPath, HttpServletResponse httpServletResponse) {

        try {
            getExporter(webInfRealPath, "listChefDept", httpServletResponse, new HashMap<>()).exportInExcelFormat();
        } catch (JRException | IOException ex) {
            Logger.getLogger(ReportDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void listChefDeptInPdf(String webInRealPath, HttpServletResponse httpServletResponse) {
        try {
            getExporter(webInRealPath, "listChefDept", httpServletResponse, new HashMap<>()).exportInPDF();
        } catch (JRException | IOException ex) {
            Logger.getLogger(ReportDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void listEtudiantInExcel(String webInfRealPath, HttpServletResponse httpServletResponse, int idclasse, String aneaca) {
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("annee", aneaca);
        hashMap.put("classe", idclasse);
        try {
            getExporter(webInfRealPath, "listEtudiant", httpServletResponse, hashMap).exportInExcelFormat();
        } catch (JRException | IOException ex) {
            Logger.getLogger(ReportDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void listEtudiantInPdf(String webInRealPath, HttpServletResponse httpServletResponse, int idclasse, String aneaca) {
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("annee", aneaca);
        hashMap.put("classe", idclasse);
        try {
            getExporter(webInRealPath, "listEtudiant", httpServletResponse, hashMap).exportInPDF();
        } catch (JRException | IOException ex) {
            Logger.getLogger(ReportDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void listChefJuryInExcel(String webInfRealPath, HttpServletResponse httpServletResponse, String aneaca) {
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("annee", aneaca);
        try {
            getExporter(webInfRealPath, "listChefJury", httpServletResponse, hashMap).exportInExcelFormat();
        } catch (JRException | IOException ex) {
            Logger.getLogger(ReportDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void listChefJuryInPdf(String webInRealPath, HttpServletResponse httpServletResponse, String aneaca) {
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("annee", aneaca);
        try {
            getExporter(webInRealPath, "listChefJury", httpServletResponse, hashMap).exportInPDF();
        } catch (JRException | IOException ex) {
            Logger.getLogger(ReportDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void listEnseignementDeptInExcel(String webInfRealPath, HttpServletResponse httpServletResponse, String aneaca, int iddept) {
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("annee", aneaca);
        hashMap.put("dept", iddept);
        try {
            getExporter(webInfRealPath, "listEnseignementDept", httpServletResponse, hashMap).exportInExcelFormat();
        } catch (JRException | IOException ex) {
            Logger.getLogger(ReportDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void listEnseignementDeptInPdf(String webInRealPath, HttpServletResponse httpServletResponse, String aneaca, int iddept) {
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("annee", aneaca);
        hashMap.put("dept", iddept);
        try {
            getExporter(webInRealPath, "listEnseignementDept", httpServletResponse, hashMap).exportInPDF();
        } catch (JRException | IOException ex) {
            Logger.getLogger(ReportDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

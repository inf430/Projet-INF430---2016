/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe4.modeles;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;

/**
 *
 * @author MBOUOPDA MICHAEL
 */
public class Exporter {

    private JasperPrint jasperPrint;
    private Connection con;
    private HashMap<String, Object> parameter;
    private String templateFile;
    private HttpServletResponse servletResponse;

    public Exporter(String templateFile, HashMap<String, Object> parameter, HttpServletResponse hsr) {
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/gesnote", "postgres", "nanoSol");
            this.templateFile = templateFile;
            this.parameter = parameter;
            this.servletResponse = hsr;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Exporter.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void initJasperPrintObject() {
        try {
            jasperPrint = JasperFillManager.fillReport(templateFile, parameter, con);
        } catch (JRException ex) {
            Logger.getLogger(Exporter.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void exportInPDF() throws JRException, IOException {
        initJasperPrintObject();
        JasperExportManager.exportReportToPdfStream(jasperPrint, servletResponse.getOutputStream());
    }

    public void exportInExcelFormat() throws IOException, JRException {
        initJasperPrintObject();
        servletResponse.addHeader("Content-disposition", "attachement; filename=report" + (int) (System.currentTimeMillis() / 1000) + ".xlsx");
        JRXlsxExporter xlsxExporter = new JRXlsxExporter();
        xlsxExporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
        xlsxExporter.setParameter(JRExporterParameter.OUTPUT_STREAM, servletResponse.getOutputStream());
        xlsxExporter.exportReport();
    }
}

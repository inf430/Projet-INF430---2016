/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe1.servlet;

import entities.Administrateur;
import entities.Personne;
import gesnote.groupe1.modeles.AdminDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 *
 * @author Paulostar
 */
@WebServlet(name = "DisconnectServlet", urlPatterns = {"/deconnexion"})
public class DisconnectServlet extends HttpServlet {

  @EJB
    AdminDao dao = new AdminDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if ( session.getAttribute("login") != null ){
            session.invalidate();
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
        }else{
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
        }
    }
}

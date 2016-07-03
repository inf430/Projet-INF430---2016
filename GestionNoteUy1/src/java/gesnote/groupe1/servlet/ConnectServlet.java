/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gesnote.groupe1.servlet;


import entities.*;
import gesnote.groupe1.modeles.AdminDao;
import java.io.IOException; 
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Paulostar
 */
@WebServlet( urlPatterns = { "/connexion" } )
public class ConnectServlet extends HttpServlet {

   @EJB
   AdminDao dao = new AdminDao();
   
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
            
            String parametre = request.getParameter("chaine");
            PrintWriter writer = response.getWriter();
            writer.write(dao.getMD5(parametre));
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
            String login = request.getParameter("login");
            String password = request.getParameter("password");
            if (!dao.exist(login, password)){
                PrintWriter writer = response.getWriter();
                //Arraylist<String> array = new Arraylist();
                writer.write("");
            }else{
                HttpSession session = request.getSession();
                Personne personne = dao.getPersonne(login, password);
                session.setAttribute("login",personne.getLogin());
                session.setAttribute("id",personne.getIdpersonne());
            }
    }

}

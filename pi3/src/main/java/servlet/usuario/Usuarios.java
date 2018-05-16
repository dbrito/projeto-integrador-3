package servlet.usuario;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ads.pi3.DAO.UsuarioDAO;
import ads.pi3.model.Usuario;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


@WebServlet(urlPatterns = {"/usuarios"})
public class Usuarios extends HttpServlet {    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {                
        List<Usuario> teste;                
        try {
            teste = UsuarioDAO.listar();
            request.setAttribute("usuarios", teste);        
            RequestDispatcher meuk = request.getRequestDispatcher("./usuario/usuarios.jsp");
            meuk.forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Usuarios.class.getName()).log(Level.SEVERE, null, ex);
        }        
    }    
}

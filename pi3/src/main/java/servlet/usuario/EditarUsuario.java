/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.usuario;

import ads.pi3.DAO.UsuarioDAO;
import ads.pi3.model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Douglas
 */
@WebServlet(name = "EditarUsuario", urlPatterns = {"/editar-usuario"})
public class EditarUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {                 
        Usuario user = null;
        try {        
            user = UsuarioDAO.obter(Integer.parseInt(request.getParameter("id")));
        } catch (Exception ex) {
            response.sendError(404, "Usuário não encontrado");
            Logger.getLogger(EditarUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("user", user);
        RequestDispatcher meuk = request.getRequestDispatcher("./usuario/editar-usuario.jsp");
        meuk.forward(request, response);                                        
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {                 
        Usuario user;
        try {        
            user = UsuarioDAO.obter(Integer.parseInt(request.getParameter("id")));
        } catch (Exception ex) {
            response.sendError(404, "Usuário não encontrado");
            Logger.getLogger(EditarUsuario.class.getName()).log(Level.SEVERE, null, ex);
            return;
        }
                
        user.setNome(request.getParameter("nome"));        
        user.setCpf(request.getParameter("cpf"));        
        user.setUser(request.getParameter("user"));        
        user.setPass(request.getParameter("pass"));              
        try {
            UsuarioDAO.atualizar(user);
        } catch (Exception ex) {
            response.sendError(503, ex.toString());
            Logger.getLogger(EditarUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        PrintWriter resposta = response.getWriter();
        resposta.println("O usuário '" + user.getNome() + "' foi atualizado com sucesso.");
    }

}

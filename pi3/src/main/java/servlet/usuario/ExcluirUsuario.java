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
@WebServlet(name = "ExcluirUsuario", urlPatterns = {"/excluir-usuario"})
public class ExcluirUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {                         
        try {
            //Caso o usuário não esteja logado ou não seja um gerente não permito o cadastro
            Usuario user = (Usuario) request.getSession().getAttribute("funcionario");
            if (user ==  null || !user.getPerfil().equals("gerente")) {
                response.sendError(403, "Acesso negado");
                return;
            }
        } catch(Exception e) {}        
        
        try {                    
            UsuarioDAO.excluir(Integer.parseInt(request.getParameter("id")));                                               
        } catch (Exception ex) {
            response.sendError(404, ex.getMessage());
            Logger.getLogger(EditarUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }        
        PrintWriter resposta = response.getWriter();
        resposta.println("O usuário foi excluido com sucesso.");
    }       
}

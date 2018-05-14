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
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "CadastrarUsuario", urlPatterns = {"/cadastrar-usuario"})
public class CadastrarUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {         
        RequestDispatcher meuk = request.getRequestDispatcher("./usuario/cadastrar-usuario.jsp");
        meuk.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {                 
        Usuario novoUser = new Usuario();
        novoUser.setNome(request.getParameter("nome"));        
        novoUser.setCpf(request.getParameter("cpf"));      
        novoUser.setUser(request.getParameter("user"));        
        novoUser.setPass(request.getParameter("pass"));        
                 
        UsuarioDAO.inserir(novoUser);
        
        PrintWriter resposta = response.getWriter();
        resposta.println("O usuário '" + novoUser.getUser()+ "' foi cadastrado com sucesso.");
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.cliente;

import ads.pi3.DAO.ClienteDAO;
import ads.pi3.model.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ninck
 */ 
    
@WebServlet(name = "CadastrarCliente", urlPatterns = {"/cadastrar-cliente"})
public class CadastrarCliente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {         
        RequestDispatcher meuk = request.getRequestDispatcher("cadastrar-cliente.jsp");
        meuk.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {                 
        Cliente novoClie = new Cliente();
        novoClie.setNome(request.getParameter("nome"));        
        novoClie.setCPF(request.getParameter("cpf"));        
        novoClie.setEndereco (request.getParameter("endereco"));        
        novoClie.setComplemento(request.getParameter("complemento"));         
        novoClie.setDataNascimento(request.getParameter("data-nascimento"));                      
        ClienteDAO.inserir(novoClie);
        
        PrintWriter resposta = response.getWriter();
        resposta.println("O cliente '" + novoClie.getNome() + "' foi cadastrado com sucesso.");
    }

}


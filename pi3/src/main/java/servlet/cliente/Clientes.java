/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.cliente;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ads.pi3.DAO.ClienteDAO;
import ads.pi3.model.Cliente;
import java.util.List;

/**
 *
 * @author ninck
 */
@WebServlet(urlPatterns = {"/clientes"})
public class Clientes extends HttpServlet {    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {                
        List<Cliente> teste = ClienteDAO.listar();                
        request.setAttribute("clientes", teste);        
        RequestDispatcher meuk = request.getRequestDispatcher("clientes.jsp");
        meuk.forward(request, response);
    }    
}


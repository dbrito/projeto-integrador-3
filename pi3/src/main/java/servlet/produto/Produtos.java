package servlet.produto;

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
import ads.pi3.DAO.ProdutoDAO;
import ads.pi3.model.Produto;
import java.util.List;

/**
 *
 * @author douglas.sbrito1
 */
@WebServlet(urlPatterns = {"/produtos"})
public class Produtos extends HttpServlet {    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {                
        List<Produto> teste = ProdutoDAO.listar();                
        request.setAttribute("produtos", teste);        
        RequestDispatcher meuk = request.getRequestDispatcher("./produto/produtos.jsp");
        meuk.forward(request, response);
    }           
}

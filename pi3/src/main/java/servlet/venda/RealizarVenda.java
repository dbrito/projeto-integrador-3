/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.venda;

import ads.pi3.DAO.ClienteDAO;
import ads.pi3.DAO.ProdutoDAO;
import ads.pi3.model.Cliente;
import ads.pi3.model.Produto;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.*;

/**
 *
 * @author dbrito
 */
@WebServlet(name = "RealizarVenda", urlPatterns = {"/realizar-venda"})
public class RealizarVenda extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {         
        List<Cliente> clientes = ClienteDAO.listar();                
        request.setAttribute("clientes", clientes);        
        
        List<Produto> produtos = ProdutoDAO.listar();                
        request.setAttribute("produtos", produtos);        
        RequestDispatcher meuk = request.getRequestDispatcher("./venda/realizar-venda.jsp");
        meuk.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {                                 
        JSONObject json = new JSONObject(request.getParameter("jsonData"));
        System.out.println(json.get("produtos"));        
        JSONArray produtos = (JSONArray) json.get("produtos");
        for(int n = 0; n < produtos.length(); n++) {
            JSONObject object = produtos.getJSONObject(n);
            System.out.println(object.get("id") + " " + object.get("preco") + " " + object.get("quantidade"));        
        }
        
        PrintWriter resposta = response.getWriter();
        resposta.println("A venda foi efetuada com sucesso");
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.produto;

import ads.pi3.DAO.ProdutoDAO;
import ads.pi3.model.Produto;
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

/**
 *
 * @author Douglas
 */
@WebServlet(name = "CadastrarProduto", urlPatterns = {"/cadastrar-produto"})
public class CadastrarProduto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {         
        try {
            //Caso o usuário não esteja logado redireciono para a tela de login
            Usuario user = (Usuario) request.getSession().getAttribute("funcionario");
            if (user ==  null) {
                response.sendRedirect("login");
                return;
            }
            //Caso o usuário esteja loga mas seja um caixa redireciona para a tela de acesso negado
            else if (user.getPerfil().equals("caixa")){
                response.sendRedirect(request.getContextPath() + "/acesso-negado.html");
                return;
            }
        } catch(Exception e) {}
        
        RequestDispatcher meuk = request.getRequestDispatcher("./produto/cadastrar-produto.jsp");
        meuk.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {                 
        try {
            //Caso o usuário não esteja logado ou seja um caixa não permito o cadastro
            Usuario user = (Usuario) request.getSession().getAttribute("funcionario");
            if (user ==  null || user.getPerfil().equals("caixa")) {
                response.sendError(403, "Acesso negado");
                return;
            }
        } catch(Exception e) {}
        
        Produto novoProd = new Produto();
        novoProd.setNome(request.getParameter("nome"));        
        novoProd.setMarca(request.getParameter("marca"));        
        novoProd.setPreco(Double.parseDouble(request.getParameter("preco")));        
        novoProd.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));        
        novoProd.setCategoria(request.getParameter("categoria"));        
        novoProd.setDescricao(request.getParameter("descricao"));                
        ProdutoDAO.inserir(novoProd);
        
        PrintWriter resposta = response.getWriter();
        resposta.println("O produto '" + novoProd.getNome() + "' foi cadastrado com sucesso.");
    }

}

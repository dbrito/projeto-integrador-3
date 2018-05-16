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
@WebServlet(name = "EditarProduto", urlPatterns = {"/editar-produto"})
public class EditarProduto extends HttpServlet {

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
        
        Logger.getLogger(EditarProduto.class.getName()).log(Level.SEVERE, null, "TESTE EDITAR PRODUTO");
        Produto prod = null;
        try {        
            prod = ProdutoDAO.obter(Integer.parseInt(request.getParameter("id")));
        } catch (Exception ex) {
            response.sendError(404, "Produto não encontrado");
            Logger.getLogger(EditarProduto.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("prod", prod);
        RequestDispatcher meuk = request.getRequestDispatcher("./produto/editar-produto.jsp");
        meuk.forward(request, response);                                        
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {                 
        try {
            //Caso o usuário não esteja logado ou seja um caixa não permito o cadastro
            Usuario user = (Usuario) request.getSession().getAttribute("funcionario");
            if (user ==  null || user.getPerfil().equals("caixa")) {
                response.sendError(403, "Acesso negado");
                return;
            }
        } catch(Exception e) {}
        
        Produto prod;
        try {        
            prod = ProdutoDAO.obter(Integer.parseInt(request.getParameter("id")));
        } catch (Exception ex) {
            response.sendError(404, "Produto não encontrado");
            Logger.getLogger(EditarProduto.class.getName()).log(Level.SEVERE, null, ex);
            return;
        }
                
        prod.setNome(request.getParameter("nome"));        
        prod.setMarca(request.getParameter("marca"));        
        prod.setPreco(Double.parseDouble(request.getParameter("preco")));        
        prod.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));        
        prod.setCategoria(request.getParameter("categoria"));        
        prod.setDescricao(request.getParameter("descricao"));                
        try {
            ProdutoDAO.atualizar(prod);
        } catch (Exception ex) {
            response.sendError(503, ex.toString());
            Logger.getLogger(EditarProduto.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        PrintWriter resposta = response.getWriter();
        resposta.println("O produto '" + prod.getNome() + "' foi atualizado com sucesso.");
    }

}

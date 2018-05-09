/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.filial;

import ads.pi3.DAO.FilialDAO;
import ads.pi3.model.Filial;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet(name="EditarProduto", urlPatterns ={"/editar-filial"})

public class EditarFilial extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Filial filial = null;
        
        try {
            filial = FilialDAO.obter(Integer.parseInt(req.getParameter("id")));
            
        } catch (Exception e) {
            resp.sendError(404,"Filial não encontrada");
        }
        
        req.setAttribute("filial", filial);
        RequestDispatcher pegar = req.getRequestDispatcher("editar-filial.jsp");
        pegar.forward(req, resp);
    
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    
        Filial filial = null;
        
        try {
            filial = FilialDAO.obter(Integer.parseInt("id"));
        } catch (Exception e) {
            resp.sendError(404, "Filial não encontrada");
            return;
        }
    
        filial.setNomeFilial(req.getParameter("nomeFilial"));
        filial.setEndereco(req.getParameter("endereco"));
        filial.setNumero(Integer.parseInt(req.getParameter("numero")));
        filial.setCidade(req.getParameter("cidade"));
        filial.setEstado(req.getParameter("estado"));
        
        try {
            FilialDAO.atualizar(filial);
        } catch (Exception e) {
            resp.sendError(503, "Erro ao tentar atualizar!");
            return;
        }
        
        PrintWriter resposta = resp.getWriter();
        resposta.println("A filial '" + filial.getNomeFilial() + "' foi atualizada com sucesso.");
    }
    
    
    
}

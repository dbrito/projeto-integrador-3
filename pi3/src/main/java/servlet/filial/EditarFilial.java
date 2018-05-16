/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.filial;

import ads.pi3.DAO.FilialDAO;
import ads.pi3.model.Filial;
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




@WebServlet(name="EditarFilial", urlPatterns ={"/editar-filial"})

public class EditarFilial extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //Caso o usuário não esteja logado redireciono para a tela de login
            Usuario user = (Usuario) request.getSession().getAttribute("funcionario");
            if (user ==  null) {
                response.sendRedirect("login");
                return;
            }
            //Caso o usuário esteja loga mas não seja um gerente redireciona para a tela de acesso negado
            else if (!user.getPerfil().equals("gerente")){
                response.sendRedirect(request.getContextPath() + "/acesso-negado.html");
                return;
            }
        } catch(Exception e) {}

        Filial filial = null;
        try {
            filial = FilialDAO.obter(Integer.parseInt(request.getParameter("id")));
            request.setAttribute("filial", filial);
            RequestDispatcher pegar = request.getRequestDispatcher("./filial/editar-filial.jsp");
            pegar.forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(EditarFilial.class.getName()).log(Level.SEVERE, null, ex);
            response.sendError(404,"Filial não encontrada");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            //Caso o usuário não esteja logado não permito o cadastro
            Usuario user = (Usuario) req.getSession().getAttribute("funcionario");
            if (user ==  null || !user.getPerfil().equals("gerente")) {
                resp.sendError(403, "Acesso negado");
                return;
            }
        } catch(Exception e) {}
        
        Filial filial = null;
        
        try {
            filial = FilialDAO.obter(Integer.parseInt(req.getParameter("id")));
        } catch (Exception e) {
            resp.sendError(404, "Filial nao encontrada.");
            return;
        }

        filial.setNome(req.getParameter("nome"));
        filial.setEndereco(req.getParameter("endereco"));
        filial.setNumero(Integer.parseInt(req.getParameter("numero")));
        filial.setCidade(req.getParameter("cidade"));
        filial.setEstado(req.getParameter("estado"));

        try {
            FilialDAO.atualizar(filial);
        } catch (Exception e) {
            resp.sendError(503, e.getMessage());
            return;
        }

        PrintWriter resposta = resp.getWriter();
        resposta.println("A filial '" + filial.getNome() + "' foi atualizada com sucesso.");
    }



}

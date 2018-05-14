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

@WebServlet(name = "CadastrarFilial", urlPatterns = {"/cadastrar-filial"} )

public class CadastrarFilial extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        RequestDispatcher pegar = req.getRequestDispatcher("./filial/cadastrar-filial.jsp");
        pegar.forward(req, resp);
        
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    
    Filial filial = new Filial();
    filial.setNome(req.getParameter("nome"));
    filial.setEndereco(req.getParameter("endereco"));
    filial.setNumero(Integer.parseInt(req.getParameter("numero")));
    filial.setCidade(req.getParameter("cidade"));
    filial.setEstado(req.getParameter("estado"));
    
    FilialDAO.inserir(filial);
    
    PrintWriter resposta = resp.getWriter();
        resposta.println("A filial '" + filial.getNome() + "' foi cadastrado com sucesso.");
    
    
    }

    

    
}

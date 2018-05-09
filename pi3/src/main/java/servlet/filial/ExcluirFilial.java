package servlet.filial;

import ads.pi3.DAO.FilialDAO;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet(name="ExcluirFilial", urlPatterns = {"/excluir-filial"})

public class ExcluirFilial extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    System.out.println("Filial Atual");
    System.out.println(req.getParameter("id"));
    req.getParameterMap();

try {                    
            FilialDAO.excluir(Integer.parseInt(req.getParameter("id")));                                               
        } catch (Exception ex) {
            resp.sendError(404, ex.getMessage());
          }        
        PrintWriter resposta = resp.getWriter();
        resposta.println("O produto foi excluido com sucesso.");
    }       
}    
    
    
    
    
    
    


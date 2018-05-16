package servlet.filial;

import ads.pi3.DAO.FilialDAO;
import ads.pi3.model.Filial;
import ads.pi3.model.Usuario;
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
        RequestDispatcher pegar = request.getRequestDispatcher("./filial/cadastrar-filial.jsp");
        pegar.forward(request, response);
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

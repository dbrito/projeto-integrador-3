package servlet.filial;


import ads.pi3.DAO.FilialDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import ads.pi3.model.Filial;
import ads.pi3.model.Usuario;
import javax.servlet.RequestDispatcher;

@WebServlet (urlPatterns = {"/filiais"})

public class Filiais extends HttpServlet {

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

        //Armazenar em um objeto todos os valores já salvos no Banco.
        List<Filial> listar = FilialDAO.listar();
        //Encaminhar a requisição para o Foward.
        request.setAttribute("filiais", listar);

        //Seta na filial o objeto.
        RequestDispatcher listaFiliais = request.getRequestDispatcher("./filial/filiais.jsp");
        //Enviando.
        listaFiliais.forward(request, response);
    }
}

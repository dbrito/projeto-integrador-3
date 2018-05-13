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
import javax.servlet.RequestDispatcher;

@WebServlet (urlPatterns = {"/filiais"})

public class Filiais extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
   
    //Armazenar em um objeto todos os valores já salvos no Banco.
    List<Filial> listar = FilialDAO.listar();
    
    //Encaminhar a requisição para o Foward.
    req.setAttribute("filiais", listar);
    
    //Seta na filial o objeto.
    RequestDispatcher listaFiliais = req.getRequestDispatcher("filiais.jsp");
    
    
    
    //Enviando.
    listaFiliais.forward(req, resp);



    }



    
}

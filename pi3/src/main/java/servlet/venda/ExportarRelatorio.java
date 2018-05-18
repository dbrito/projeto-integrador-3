/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.venda;

import ads.pi3.DAO.FilialDAO;
import ads.pi3.DAO.VendaDAO;
import ads.pi3.model.Filial;
import ads.pi3.model.ItemVenda;
import ads.pi3.model.Venda;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

/**
 *
 * @author dbrito
 */
@WebServlet(name = "ExportarRelatorio", urlPatterns = {"/exportar-relatorio"})
public class ExportarRelatorio extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {         
        Date inicio=null;
        Date fim=null;        
        Filial filial = null;
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        List<Venda> vendas = null;
        
        //Recupero os parametros     
        try {
            inicio = sdf.parse(request.getParameter("data_inicio"));
            fim = sdf.parse(request.getParameter("data_fim"));
            filial = FilialDAO.obter( Integer.valueOf(request.getParameter("filial_id")) );
        } catch (Exception ex) {
            //Logger.getLogger(ExportarRelatorio.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        //Com os parametros decido qual metodo de busca utilizo
        try {
            if (inicio != null && fim != null && filial != null) { //Se passou de/até + Filial ? Filtra                
                vendas = VendaDAO.pegaRelatório(inicio, fim, filial);
            } else if (inicio != null && fim != null) { //Se passou apenas o de/até ? Filtra
                vendas = VendaDAO.pegaRelatório(inicio, fim);
            } else { //Se não passou nada ? Traz tudo
                Date menosTrinta = new Date();
                menosTrinta.setDate(menosTrinta.getDate() - 30);
                vendas = VendaDAO.pegaRelatório(menosTrinta, new Date());                
                System.out.println("HERE" + vendas.size());
            }
        } catch (Exception ex) {
            Logger.getLogger(ExportarRelatorio.class.getName()).log(Level.SEVERE, null, ex);
        }                       
        
        
        ServletOutputStream buffer = response.getOutputStream();
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=relatorio.xls");        
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet folha = workbook.createSheet();
        
        //Crio o cabeçalho da planilha
        HSSFRow cabecalho = folha.createRow(0);
        
        HSSFCell hData = cabecalho.createCell(0);
        hData.setCellValue("Data");
        HSSFCell hFilial = cabecalho.createCell(1);
        hFilial.setCellValue("Filial");
        HSSFCell hVendedor = cabecalho.createCell(2);
        hVendedor.setCellValue("Vendedor");
        HSSFCell hTotal = cabecalho.createCell(3);
        hTotal.setCellValue("Total");
        HSSFCell hItens = cabecalho.createCell(4);
        hItens.setCellValue("Itens");
        
        //Adiciono as informações a planilha
        for (int i=0; i < vendas.size(); i++) {
            
            Venda venda = vendas.get(i);
            System.out.println(venda.getData()+ " | " + venda.getFilial().getNome());
            
            HSSFRow linha = folha.createRow(i+1);            
            
            HSSFCell data = linha.createCell(0);
            data.setCellValue(venda.getDataFormatada());
            
            HSSFCell nome_filial = linha.createCell(1);
            nome_filial.setCellValue(venda.getFilial().getNome());
            
            HSSFCell nome_vendedor = linha.createCell(2);
            nome_vendedor.setCellValue(venda.getVendedor().getNome());
            
            HSSFCell total_venda = linha.createCell(3);
            total_venda.setCellValue(venda.getTotalFormatado());            
            
            HSSFCell itens = linha.createCell(4);
            String textoItens = "";
            for (ItemVenda item : venda.getItens()) {
                textoItens += item.getProduto().getNome() + " --> " + item.getQuantidade() + "x --> " + item.getPreco();
            }
            itens.setCellValue(textoItens);            
        }
        
        workbook.write(buffer);
        buffer.close();        
    }

}

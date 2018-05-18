/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.venda;

import java.io.IOException;
import java.io.PrintWriter;
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
        ServletOutputStream buffer = response.getOutputStream();
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=filename.xls");        
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet folha = workbook.createSheet();
        
        for (int i=0; i < 10; i++) {
            HSSFRow linha = folha.createRow(i);
            HSSFCell coluna = linha.createCell(0);
            coluna.setCellValue("MEUK " + i);
        }
        
        workbook.write(buffer);
        buffer.close();        
    }

}

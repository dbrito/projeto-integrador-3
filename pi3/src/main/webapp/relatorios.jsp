<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Relatórios</title>

        <style>
            <%@include file="./css/geral.css" %>
        </style>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" >
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    </head>
    <body>
        <%@include file="./partials/menu.jsp" %>

        <div class="content">
            <h1><i class="fa fa-list fa-lg"></i> Relatórios</h1>
            <div class="row">
                <div class="form-group col-md-2">
                    <label for="data_inicio">Data Inicio</label>
                    <input type="text" class="form-control" name="data_inicio" id="data_inicio" required>
                </div>

                <div class="form-group col-md-2">
                    <label for="data_inicio">Data Fim</label>
                    <input type="text" class="form-control" name="data_fim" id="data_fim" required>
                </div>

                <div class="form-group col-md-2">
                    <label for="filial">Filial</label>
                    <select class="form-control" name="filial" id="filial">
                        <c:forEach var="fili" items="${filiais}">
                            <option value="<c:out value="${fili.getId()}" />">
                                <c:out value="${fili.getNome()}" />
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group col-md-2">
                    <input style="margin-top:32px;" type="submit" id="filtrar" class="btn btn-info" value="Gerar Relatório">
                </div>
            </div>
            <style>
                table {
                    font-family: consolas;
                }
                thead tr td {
                    font-weight: bold;
                }
                .products {
                    font-style:italic;
                    font-size:12px;
                }
            </style>
            <div class="row">
                <div class="col-md-12"><table class=" table table-bordered table-hover">
                    <thead>
                        <tr>
                            <td>Data</td>
                            <td>Filial</td>
                            <td>Vendedor</td>
                            <td>Total</td>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>18/05/2018</td>
                            <td>Fast - Faria Lima</td>
                            <td>Silvio Santos</td>
                            <td>R$ 2.238,40</td>
                        </tr>
                        <tr class="products">
                            <td colspan="1"></td>
                            <td colspan="2">
                                Dell Inspiron --> 2x <br>
                                Iphone XPTO --> 4x <br>
                                Tv Samsung 55" --> 1x <br>
                            </td>
                            <td>
                                R$ 300,00 <br>
                                R$ 788,00 <br>
                                R$ 1.150,40 <br>
                            </td>
                        </tr>
                        <tr>
                            <td>18/05/2018</td>
                            <td>Fast - Faria Lima</td>
                            <td>Silvio Santos</td>
                            <td>R$ 2.238,40</td>
                        </tr>
                        <tr class="products">
                            <td colspan="1"></td>
                            <td colspan="2">
                                Dell Inspiron --> 2x <br>
                                Iphone XPTO --> 4x <br>
                                Tv Samsung 55" --> 1x <br>
                            </td>
                            <td>
                                R$ 300,00 <br>
                                R$ 788,00 <br>
                                R$ 1.150,40 <br>
                            </td>
                        </tr>
                        <tr>
                            <td>18/05/2018</td>
                            <td>Fast - Faria Lima</td>
                            <td>Silvio Santos</td>
                            <td>R$ 2.238,40</td>
                        </tr>
                        <tr class="products">
                            <td colspan="1"></td>
                            <td colspan="2">
                                Dell Inspiron --> 2x <br>
                                Iphone XPTO --> 4x <br>
                                Tv Samsung 55" --> 1x <br>
                            </td>
                            <td>
                                R$ 300,00 <br>
                                R$ 788,00 <br>
                                R$ 1.150,40 <br>
                            </td>
                        </tr>
                        <tr>
                            <td>18/05/2018</td>
                            <td>Fast - Faria Lima</td>
                            <td>Silvio Santos</td>
                            <td>R$ 2.238,40</td>
                        </tr>
                        <tr class="products">
                            <td colspan="1"></td>
                            <td colspan="2">
                                Dell Inspiron --> 2x <br>
                                Iphone XPTO --> 4x <br>
                                Tv Samsung 55" --> 1x <br>
                            </td>
                            <td>
                                R$ 300,00 <br>
                                R$ 788,00 <br>
                                R$ 1.150,40 <br>
                            </td>
                        </tr>
                        <tr>
                            <td>18/05/2018</td>
                            <td>Fast - Faria Lima</td>
                            <td>Silvio Santos</td>
                            <td>R$ 2.238,40</td>
                        </tr>
                        <tr class="products">
                            <td colspan="1"></td>
                            <td colspan="2">
                                Dell Inspiron --> 2x <br>
                                Iphone XPTO --> 4x <br>
                                Tv Samsung 55" --> 1x <br>
                            </td>
                            <td>
                                R$ 300,00 <br>
                                R$ 788,00 <br>
                                R$ 1.150,40 <br>
                            </td>
                        </tr>
                    </tbody>
                </table></div>
            </div>
        </div>

        <script>
            $.datepicker.regional['pt-BR'] = {
                closeText: 'Fechar',
                prevText: '&#x3c;Anterior',
                nextText: 'Pr&oacute;ximo&#x3e;',
                currentText: 'Hoje',
                monthNames: ['Janeiro','Fevereiro','Mar&ccedil;o','Abril','Maio','Junho',
                'Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
                monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun',
                'Jul','Ago','Set','Out','Nov','Dez'],
                dayNames: ['Domingo','Segunda-feira','Ter&ccedil;a-feira','Quarta-feira','Quinta-feira','Sexta-feira','Sabado'],
                dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sab'],
                dayNamesMin: ['Dom','Seg','Ter','Qua','Qui','Sex','Sab'],
                weekHeader: 'Sm',
                dateFormat: 'dd/mm/yy',
                firstDay: 0,
                isRTL: false,
                showMonthAfterYear: false,
                yearSuffix: ''};
            $.datepicker.setDefaults($.datepicker.regional['pt-BR']);
            $( "#data_inicio" ).datepicker();
            $( "#data_fim" ).datepicker();
        </script>
    </body>
</html>

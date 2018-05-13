<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Editar Produto</title>

        <style>
            <%@include file="./css/geral.css" %>
        </style>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" >

        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%@include file="./partials/menu.jsp" %>

        <div class="content">
            <h1><i class="fa fa-edit fa-lg"></i> Editar Filial</h1>
            <form action="/filiais" method="post" id="formulario">
                <div class="row">
                    <div class="form-group col-md-3">
                        <label for="nome">Nome da Filial:</label>
                        <input type="text" class="form-control" name="nomeFilial" id="nomeFilial" value="<c:out value="${filial.getNomeFilial()}" />" required>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="marca">Endereço:</label>
                        <input type="text" class="form-control" name="endereco" id="endereco" value="<c:out value="${filial.getEndereco()}" />" required>
                    </div>
                </div>         
                <div class="row">
                    <div class="form-group col-md-3">
                        <label for="descricao">Número:</label>
                        <textarea class="form-control" name="numero" id="numero"><c:out value="${filial.getNumero()}" /></textarea>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="categoria">Cidade:</label>
                        <textarea class="form-control" name="cidade" id="cidade"><c:out value="${filial.getCidade()}"/></textarea>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="categoria">Estado:</label>
                        <textarea class="form-control" name="estado" id="estado"><c:out value="${filial.getEstado()}"/></textarea>
                    </div>
                </div>
                <input type="submit" class="btn btn-info" value="Salvar">            
                <a href="./filiais" class="btn btn-info" role="button">Cancelar</a>
            </form>       
            <script>                
                $("#formulario").submit(function (e) {                                
                    e.preventDefault();
                    $.ajax({
                        type: "POST",
                        url: window.location.href,
                        data: $("#formulario").serialize(),
                        success: function (result, status) {
                            alert(result);                            
                            window.location.href = './filiais';
                        }, error: function (err) {
                            alert('Erro tente novamente mais tarde;')
                        }
                    });                
                });
            </script>
        </div>

    </body>
</html>
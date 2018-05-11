<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Editar Cliente</title>

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
            <h1><i class="fa fa-edit fa-lg"></i> Editar Cliente</h1>
            <form action="/editar-cliente" method="post" id="formulario">
                <div class="row">
                    <div class="form-group col-md-3">
                        <label for="nome">Nome:</label>
                        <input type="text" class="form-control" name="nome" id="nome" required>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="cpf">CPF:</label>
                        <input type="text" class="form-control" name="cpf" id="cpf" required>
                    </div>
                </div>              
                <div class="row">
                    <div class="form-group col-md-3">
                        <label for="endereco">Endereço:</label>
                         <input type="text" class="form-control" name="endereco" id="endereco" required>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="complemento">Complemento:</label>
                        <input type="text" class="form-control" name="complemento" id="complemento" required>
                    </div>
                </div>            
               
                
                <input type="submit" class="btn btn-info" value="Salvar">            
                <a href="./clientes" class="btn btn-info" role="button">Cancelar</a>
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
                            window.location.href = './clientes';
                        }, error: function (err) {
                            alert('Erro tente novamente mais tarde;')
                        }
                    });                
                });
            </script>
        </div>

    </body>
</html>

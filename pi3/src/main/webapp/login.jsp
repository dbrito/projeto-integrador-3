<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>Login</title>        
        <!-- <link rel="stylesheet" href="./css/login.css"> -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" >

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <style>
            <%@include file="./css/login.css" %>
        </style>
    </head>
    <body>
        <img src="<c:url value="./img/bg.jpg"/>"/>
        <div class="container text-center">
            <div style="width: 100%;max-width:400px; float: none; position:absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
                <div class="account-wall">
                    <div class="tab-pane active" id="login">
                        <img class="profile-img" src="https://cdn.vectorstock.com/i/thumb-large/80/48/perfume-boutique-logo-vintage-style-vector-18088048.jpg" alt="">
                        <form class="form-signin" action="./produtos" method="get">
                            <input type="text" class="form-control" placeholder="Usuário" required autofocus>
                            <input type="password" class="form-control" placeholder="Senha" required>
                            <input type="submit" class="btn btn-lg btn-default btn-block" value="Entrar" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

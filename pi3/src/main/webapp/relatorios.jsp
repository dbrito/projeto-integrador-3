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

        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%@include file="./partials/menu.jsp" %>

        <div class="content">
            <h1><i class="fa fa-list fa-lg"></i> Relatórios</h1>
            <form action="/realizar-venda" method="post" id="formulario">
                <div class="row">
                    <div class="form-group col-md-8">
                        Cliente
                        <input type="text" class="form-control col-md-5" disabled name="nomeCliente" id="nomeCliente" required>

                        <a style="margin-top:10px" href="#" data-toggle="modal" data-target="#modalClientes" class="btn btn-secondary" id="selecionar-usuario" role="button">Selecionar Cliente</a>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-10">                        
                        
                        <strong id="total-compra">Total: R$</strong>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-10">
                        <a style="margin-top:10px" href="#" data-toggle="modal" data-target="#modalProdutos" class="btn btn-secondary" id="selecionar-usuario" role="button">Adicionar Produto</a>
                    </div>
                </div>
                <input type="submit" class="btn btn-primary btn-lg" value="Realizar Venda">
            </form>           
            
            <table class="table table-hover col-md-6 lista-produtos" style="width: 100%;">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Nome</th>
                        <th scope="col">Preço</th>
                        <th scope="col">Categoria</th>
                        <th scope="col">Quantidade</th>
                        <th scope="col">Ações</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
            
            <script>
                var venda = {};
                venda.produtos = [];

                function setClienteId(id, clienteNome) {
                    $('#nomeCliente').val(clienteNome);
                    venda.clienteId = id;
                }

                //Lógica para adicionar os produtos
                $('.add-item').click(function (e) {
                    e.preventDefault();
                    var produto = e.currentTarget;
                    var elementoProduto = produto.parentNode.parentNode.cloneNode(true);
                    var novoBotao = elementoProduto.children[4].children[0];
                    var quantidade = elementoProduto.children[3].children[0];
                    novoBotao.setAttribute('class', 'remove-item');
                    quantidade.setAttribute('disabled', 'disabled');
                    novoBotao.children[0].setAttribute('class', 'fa fa-trash fa-lg');

                    var produto = {
                        id: produto.getAttribute('dt-id'),
                        preco: Number(produto.getAttribute('dt-price')),
                        quantidade: parseInt(elementoProduto.children[3].children[0].value)
                    }

                    var produtoExistente = produtoFoiAdicionado(produto.id);
                    console.log(produtoExistente);
                    if (produtoExistente) {
                        produtoExistente.quantidade += produto.quantidade;
                        $('.lista-produtos tbody input[dt-id="'+ produto.id +'"]').val(produtoExistente.quantidade);
                        $('#total-compra').text('Total: R$' + pegaTotalCompra());
                        return;
                    }

                    $('.lista-produtos tbody').append(elementoProduto);
                    venda.produtos.push(produto);
                    $('#total-compra').text('Total: R$' + pegaTotalCompra());

                    $('.remove-item').click(function (e) {
                        e.preventDefault();
                        var produto = $(e.currentTarget);

                        for(var i = venda.produtos.length - 1; i >= 0; i--) {
                            var item = venda.produtos[i];
                            if(venda.produtos[i].id == produto.attr('dt-id')) {
                                venda.produtos.splice(i, 1);
                                produto.parent().parent().remove();
                                console.log(venda.produtos);
                                $('#total-compra').text('Total: R$' + pegaTotalCompra());
                            }
                        }
                    });
                });

                function produtoFoiAdicionado(id) {
                    for (var i=0;i < venda.produtos.length; i++) {
                        var produto = venda.produtos[i];
                        if (produto.id == id) return produto;
                    }
                    return false;
                }

                function pegaTotalCompra() {
                    var total = 0;
                    for (var i=0;i < venda.produtos.length; i++) {
                        var produto = venda.produtos[i];
                        total += produto.preco * produto.quantidade;
                    }
                    return total;
                }

                $("#formulario").submit(function (e) {
                    e.preventDefault();
                    if (!venda.clienteId) {
                        alert('Selecione um cliente');
                        return;
                    }
                    if (venda.produtos.length == 0) {
                        alert('Selecione ao menos um produto');
                        return;
                    }

                    $.ajax({
                        type: "POST",
                        url: window.location.href,
                        data: {"jsonData": JSON.stringify(venda)},
                        success: function (result, status) {
                            alert(result);
                            if (status == 'success') {
                                window.location.reload(false);
                            }
                        }, error: function (err) {
                            alert('Erro tente novamente mais tarde;')
                        }
                    });
                });
            </script>
        </div>

    </body>
</html>

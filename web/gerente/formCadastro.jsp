<%-- 
    Document   : formCadastro
    Created on : Jul 31, 2021, 11:02:39 PM
    Author     : Giulia
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.ufpr.tads.web2.beans.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "/erro.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Produto</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script type="text/javascript" >
            $(window).on('load', function () {
                getCidades();
            });

            function getCidadesInicial() {
                var idEstado = $("#estado").val();
                var url = "${pageContext.request.contextPath}/AJAXServlet";
                $.ajax({
                    url: url,
                    data: {
                        idEstado: idEstado
                    },
                    dataType: 'json',
                    success: function (data) {
                        $.each(data, function (i, cidade) {
                            $("#cidade").append('<option value=' + cidade.idCidade + '>' + cidade.nome + '</option>');
                        });
                    },
                    error: function (request, textStatus, errorThrown) {
                        $("#cidade").append('<option value="">Erro</option>');
                    }
                });
            }
        </script>
    </head>
    <body>
        <c:if test="${empty sessionScope.logado}">
            <c:set var="msg" value="Usuário deve se autenticar para acessar o sistema."
                   scope="request"/>
            <jsp:forward page="/index.jsp"/>
        </c:if> 
        <div class="container">
            <h2>Produto </h2>
            <form action="${pageContext.request.contextPath}/GerenteServlet?action=${empty cadastrado ? "novoCadastro" : "alterarCadastro"}" method="post">
                <c:if test="${!empty cadastrado}">
                    <div class="form-group">
                        <label for="idCadastrado">Id: </label>
                        <input type="text" class="form-control" name="idCadastrado" value="${empty cadastrado.idFuncionario ? cadastrado.idGerente : cadastrado.idFuncionario}" readonly>
                    </div>
                </c:if>
                <div class="form-group">
                    <label for="primeiroNome">Primeiro Nome: </label>
                    <input type="text" maxlength="50" class="form-control" name="primeiroNome" placeholder="${cadastrado.primeiroNome}" value="${cadastrado.primeiroNome}" required>
                </div>
                <div class="form-group">
                    <label for="sobreNome">Sobrenome: </label>
                    <input type="text" maxlength="50" class="form-control" name="sobreNome" placeholder="${cadastrado.sobreNome}" value="${cadastrado.sobreNome}" required>
                </div>
                <div class="form-group">
                    <label for="cpf">CPF: </label>
                    <c:if test="${empty cadastrado}">
                        <input type="text" class="form-control" name="cpf" placeholder="${cadastrado.cpf}" value="${cadastrado.cpf}">
                    </c:if>
                    <c:if test="${!empty cadastrado}">
                        <input type="text" class="form-control" name="cpf" placeholder="${cadastrado.cpf}" value="${cadastrado.cpf}" readonly>
                    </c:if>
                </div>
                <div class="form-group">
                    <label for="telefone">Telefone: </label>
                    <input type="text" class="form-control" name="telefone" placeholder="${cadastrado.telefone}" value="${cadastrado.telefone}" required>
                </div>
                <div class="form-group">
                    <label for="email">Email: </label>
                    <c:if test="${empty cadastrado}">
                        <input type="text" class="form-control" name="email" placeholder="${cadastrado.email}" value="${cadastrado.email}">
                    </c:if>
                    <c:if test="${!empty cadastrado}">
                        <input type="text" class="form-control" name="email" placeholder="${cadastrado.email}" value="${cadastrado.email}" readonly>
                    </c:if>
                </div>
                <div class="form-group">
                    <c:if test="${empty cadastrado}">
                        <label for="senha">Senha: </label>
                        <input type="text" class="form-control" name="senha" required>
                    </c:if>
                    <c:if test="${!empty cadastrado}">
                        <label for="senha">Senha (preencher apenas para alterá-la): </label>
                        <input type="text" class="form-control" name="senha">
                    </c:if>
                </div>
                <div class="form-group">
                    <label for="rua">Rua: </label>
                    <input type="text" class="form-control" name="rua" placeholder="${cadastrado.endereco.rua}" value="${cadastrado.endereco.rua}" required>
                </div>
                <div class="form-group">
                    <label for="numero">Número: </label>
                    <input type="text" class="form-control" name="numero" placeholder="${cadastrado.endereco.numero}" value="${cadastrado.endereco.numero}" required>
                </div>
                <div class="form-group">
                    <label for="complemento">Complemento: </label>
                    <input type="text" class="form-control" name="complemento" placeholder="${cadastrado.endereco.complemento}" value="${cadastrado.endereco.complemento}">
                </div>
                <div class="form-group">
                    <label for="bairro">Bairro: </label>
                    <input type="text" class="form-control" name="bairro" placeholder="${cadastrado.endereco.bairro}" value="${cadastrado.endereco.bairro}" required>
                </div>
                <div class="form-group">
                    <label for="cep">CEP: </label>
                    <input type="text" class="form-control" name="cep" placeholder="${cadastrado.endereco.cep}" value="${cadastrado.endereco.cep}" required>
                </div>
                <div class="form-group">
                    <label for="idEstado">Estado: </label>
                    <select id="estado" name="idEstado" class="form-control">
                        <c:forEach var="estado" items="${listaEstados}">
                            <option value="${estado.id}" ${estado.id == cadastrado.endereco.cidade.estado.id ? "selected" : ""}>
                                <c:out value="${estado.sigla} - ${estado.nome}" />
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="idCidade">Cidade: </label>
                    <select id="cidade" name="idCidade" class="form-control">
                        <option value="${cadastrado.endereco.cidade.id}">
                            <c:out value="${cadastrado.endereco.cidade.nome}" />
                        </option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">${empty cadastrado ? "Salvar" : "Alterar"}</button>
            </form>
            </br>
            <form action="${pageContext.request.contextPath}/GerenteServlet?action=todosCadastrados" method="post">
                <input type="submit" value="Cancelar" class="btn btn-primary active"/>
            </form>
        </div>  
    </body>
    <script type="text/javascript" >
        $(document).ready(function () {
            $("#estado").on("change", (function () {
                getCidades();
            }));
        });

        function getCidades() {
            var idEstado = $("#estado").val();
            var url = "${pageContext.request.contextPath}/AJAXServlet";
            $.ajax({
                url: url,
                data: {
                    idEstado: idEstado
                },
                dataType: 'json',
                success: function (data) {
                    $("#cidade").empty();
                    $.each(data, function (i, cidade) {
                        $("#cidade").append('<option value=' + cidade.idCidade + '>' + cidade.nome + '</option>');
                    });
                },
                error: function (request, textStatus, errorThrown) {
                    $("#cidade").append('<option value="">Erro</option>');
                }
            });
        }
    </script>

</html>
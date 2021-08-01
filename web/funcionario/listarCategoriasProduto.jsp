<%-- 
    Document   : listarCategoriasProduto
    Author     : Giulia
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.ufpr.tads.web2.beans.CategoriaProduto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "/erro.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Categorias de Produto</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <c:if test="${empty sessionScope.logado}">
            <c:set var="msg" value="Usuário deve se autenticar para acessar o sistema."
                   scope="request"/>
            <jsp:forward page="/index.jsp"/>
        </c:if> 
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1>Bem vindo(a), ${logado.getNome()}</h1>
            </div>
        </div>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link disabled">Menu</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/FuncionarioServlet?action=">Atendimentos em Aberto</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/FuncionarioServlet?action=">Listar Todos os Atendimentos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/FuncionarioServlet?action=">Cadastro de Categorias de Produto</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/FuncionarioServlet?action=">Cadastro de Produtos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>
                </li>
            </ul>
        </nav>
        <div class="container">
            </br>
            <h2>Categorias de Produto:</h2>
            </br>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Opções 
                            <a href="${pageContext.request.contextPath}/CategoriaProdutoServlet?action=formNew">
                                <button type="button" class="btn btn-secondary">Novo</button>
                            </a>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="categoria" items="${listaCategoriasProduto}">  
                        <tr>
                            <td><c:out value="${categoria.nome}"/></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/CategoriaProdutoServlet?action=show&id=${categoria.id}"><img src="<c:url value="/img/visualizar.png"/>" width="30" height="30"/></a>
                                <a href="${pageContext.request.contextPath}/CategoriaProdutoServlet?action=formUpdate&id=${categoria.id}"><img src="<c:url value="/img/alterar.png"/>" width="30" height="30"/></a>
                                <a href="${pageContext.request.contextPath}/CategoriaProdutoServlet?action=remove&id=${categoria.id}" 
                                   onclick="return confirm('Confirma a exclusão da categoria ${categoria.nome}?')">
                                    <img src="<c:url value="/img/remover.png"/>" width="30" height="30"/>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>    
    </body>
    <footer style="position: fixed; bottom: 0;">
        <div class="container" style="background-color: rgba(0, 0, 0, 0.10);">
            <div class="text-center p-0">
                Em caso de problemas contactar o administrador: <jsp:getProperty name="configuracao" property="email"/>
            </div>
        </div>
    </footer>
</html>

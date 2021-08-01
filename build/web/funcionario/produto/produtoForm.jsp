<%-- 
    Document   : produtoForm
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
    </head>
    <body>
        <c:if test="${empty sessionScope.logado}">
            <c:set var="msg" value="Usuário deve se autenticar para acessar o sistema."
                   scope="request"/>
            <jsp:forward page="/index.jsp"/>
        </c:if> 
        <div class="container">
            <h2>Produto </h2>
            <form action="${pageContext.request.contextPath}/ProdutoServlet?action=${empty produto ? "new" : "update"}" method="post">
                <c:if test="${!empty produto}">
                    <div class="form-group">
                        <label for="id">Id: </label>
                        <input type="text" class="form-control" name="idProduto" placeholder="${produto.idProduto}" value="${produto.idProduto}" readonly>
                    </div>
                </c:if>
                <div class="form-group">
                    <label for="nome">Nome: </label>
                    <input type="text" maxlength="25" class="form-control" name="nome" placeholder="${produto.nome}" value="${produto.nome}" required>
                </div>
                <div class="form-group">
                    <label for="descricao">Descrição: </label>
                    <input type="text" maxlength="200" class="form-control" name="descricao" placeholder="${produto.descricao}" value="${produto.descricao}" required>
                </div>
                <div class="form-group">
                    <label for="peso">Peso: </label>
                    <input type="number" pattern="[0-9]+([\,][0-9][0-9])?" step="0.01"  class="form-control" name="peso" placeholder="${produto.peso}" value="${produto.peso}" required>
                </div>
                <div class="form-group">
                    <label for="peso">Preço: </label>
                    <input type="number" class="form-control" name="preco" pattern="[0-9]+([\,][0-9][0-9])?" step="0.01" placeholder="${produto.preco}" value="${produto.preco}" required>
                </div>
                <div class="form-group">
                    <label for="categoria">Categoria de Produto: </label>
                    <select name="categoria" class="form-control">
                        <c:forEach var="categoria" items="${categorias}">
                            <option value="${categoria.idCategoria}" ${categoria.idCategoria == produto.categoria.idCategoria ? "selected" : ""}>
                                <c:out value="${categoria.nome}" />
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">${empty produto ? "Salvar" : "Alterar"}</button>
            </form>
            </br>
            <form action="${pageContext.request.contextPath}/ProdutoServlet?action=listarProdutos" method="post">
                <input type="submit" value="Cancelar" class="btn btn-primary active"/>
            </form>
        </div>  
    </body>
</html>
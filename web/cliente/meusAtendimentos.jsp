<%-- 
    Document   : meusAtendimentos
    Created on : 28/07/2021, 21:59:45
    Author     : jessi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.ufpr.tads.web2.beans.Atendimento"%>
<%@page errorPage = "/erro.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Atendimentos</title>
     <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css"/>
 </head>
  <body>
      <c:if test="${empty sessionScope.logado}">
            <c:set var="msg" value="Usuário deve se autenticar para acessar o sistema." scope="request"/>
            <jsp:forward page="index.jsp"/>
        </c:if>
    <div class="wrapper page-extra">
     <nav class="top-section navbar">
         <a href="#" class=" nav-link buttons rounded"> <h2>Atendimentos</h2></a>
         <a href="${pageContext.request.contextPath}/ClienteServlet?action=portal" class="float-right btn btn-danger rounded">Voltar</a>
     </nav>   
       <div class="container">
        <div class="row login">
            <div class="col-md-12"><br>
             <h3> Bem vindo(a), ${logado.getNome()} </h3>
         <h1 class="title h1 m-0 mt-4 text-center"> Atendimentos </h1><br>
            <table class="table shadow ">
                <thead class="table-dark ">
                  <tr>
                    <th scope="col">Número</th>
                    <th scope="col">Produto</th>
                    <th scope="col">Atendimento</th>
                    <th scope="col">Ação</th>
                    </th>
                  </tr>
                </thead>
                <tbody>
                    <c:forEach var="atendimento" items="${listaAtendimentos}"> 
                  <tr>
                    <th scope="row"><c:out value="${atendimento.idAtendimento}"/></th>
                    <td><c:out value="${atendimento.produto.nome}"/></td>
                    <td><c:out value="${atendimento.tipoAtendimento.nome}"/></td>
                    <td>
                      <a href="${pageContext.request.contextPath}/ClienteServlet?action=mostraAtendimento&id=${atendimento.idAtendimento}" class="btn btn-sm btn-info "title="Visualizar">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                           <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                           <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                        </svg>
                      </a>
                      <a href="${pageContext.request.contextPath}/ClienteServlet?action=removeAtendimento&id=${atendimento.idAtendimento}"  class="btn btn-sm btn-danger " title="Excluir"
                        onclick="if (!confirm('Tem certeza que deseja excluir #${cliente.idCliente}?')) event.preventDefault();">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                          <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                          <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                        </svg>
                      </a>  
                    </td>
                  </tr>
                   </c:forEach>
                </tbody>
              </table>
          </form></div>
            <div class="footer">
             Em caso de problemas contactar o administrador: <jsp:getProperty name="configuracao" property="email"/>
            </div>
            </div>   
          </div>          
      </div>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/jquery-mask.min.js"></script>
    </body>
</html>
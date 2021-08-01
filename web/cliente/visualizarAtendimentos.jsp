<%-- 
    Document   : visualizarAtendimentos
    Created on : 30/07/2021, 17:05:18
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
        <title>Resolução de Atendimento</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css" />
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <c:if test="${empty sessionScope.logado}">
            <c:set var="msg" value="Usuário deve se autenticar para acessar o sistema." scope="request"/>
            <jsp:forward page="index.jsp"/>
        </c:if>
        <div class='wrapper page-extra'>
          <nav class='top-section navbar'>
            <h3> Cadastro </h3>
            <a href="${pageContext.request.contextPath}/ClienteServlet?action=portal" class="float-right btn btn-danger rounded">Voltar</a>
          </nav> 
        <div class="container">
        <div class="row login">
            <div class="col-md-12"><br>
            <h2>Atendimento # ${atendimento.idAtendimento} </h2>
           <form class="form shadow " method="post" action="${pageContext.request.contextPath}/ClienteServlet?action=novoAtendimento">     
         <input type="hidden" name="cliente" value="${cliente.id}"><br>
            <div class="form-group">
                <div class="col-sm-12">
                  <div class="form-group">
                      <label for="attendance">Tipo de atendimento</label>
                      <select  class="form-control" id="tipoAtendimento" name="tipoAtendimento" readOnly="true">
                          <c:out value="${atendimento.tipoAtendimento.nome}"/> 
                      </select>
                    </div>
                  </div>
              </div>
                                      
             <div class="col-sm-12">
                  <div class="form-group">
                      <label for="attendance">Tipo Produto</label>
                      <select  class="form-control" id="produto" name="tipoAtendimento" readOnly="true">
                        <c:out value="${atendimento.produto.nome}"/> 
                      </select>
                   </div>
             </div>
                      
            <div class="col-sm-12">
              <label for="description">Descrição do atendimento</label>
              <textarea id="descAtendimento" class="form-control" rows="10" name="reclamacao" minlength="2" maxlength="50" value="${atendimento.reclamacao}" readOnly="true"></textarea>
            </div>
            
              <div class="row">
              <div class="col-sm-6">
               <div class="form-group">
                <div class="row align-items-center">
                  <div class="col-sm-6 mt-4 mt-sm-0"><br>
                    <button type="submit"  class="btn btn-info"> Cadastrar </button>
                  </div>
                </div>
              </div>
             </div>
            </div>
            
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

<%-- 
    Document   : portal
    Created on : 27/07/2021, 17:11:50
    Author     : jessi
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="/erro.jsp" %>
<!DOCTYPE html>
<html>
 <head>
     <meta charset="UTF-8"/>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Cadastro</title>
     <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css" />
  <body>
    <div class='wrapper page-extra'>
     <nav class='top-section navbar'>
         <a href="#" class=" nav-link buttons rounded"> <h2>Home</h2></a>
          <a href="${pageContext.request.contextPath}/logout" class="float-right btn btn-danger rounded">Sair</a>
     </nav>   
       <div class="container">
        <div class="row login">
         <div class="col-md-12"> 
             <hr class="featurette-divider">
             <br><h2> Bem-vindo, <c:out value="${cliente.nome}" />!</h2>
             <hr class="featurette-divider">
        <div class="form shadow">     
              <div class="row">
          <div class="col-lg-4">
         <h2>Novo <br> Atendimento</h2>
         <p><a class="btn buttons" href="#" role="button">  Inserir </a></p>
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <h2>Histórico de<br> Atendimentos</h2>
            <p><a class="btn buttons" href="#" role="button">Visualizar</a></p>
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4">
           <h2>Dados <br>Cadastrais</h2>
            <p><a class="btn buttons" href="#" role="button">Visualizar</a></p>
          </div><!-- /.col-lg-4 -->
        </div><!-- /.row -->        
        </div>
            <div class= "footer">
              Em caso de problemas contactar o administrador:<br>
              <a href="mailto:${configuracao.emailAdmin}">
              <c:out value="${configuracao.emailAdmin}" /> </a>
                </div>
            </div>   
          </div>          
      </div>      
 </body>
</html>
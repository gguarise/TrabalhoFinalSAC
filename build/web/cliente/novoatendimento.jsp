<%-- 
    Document   : atendimentos
    Created on : 25/07/2021, 14:42:56
    Author     : jessi
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="/erro.jsp" %>
<!DOCTYPE html>
<html>
<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Atendimentos</title>
     <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
     <link rel="stylesheet" href="/trabalhoFinalSAC/style.css">
 </head>
  <body>
    <div class="wrapper page-extra">
     <nav class="top-section navbar">
         <h3> Atendimentos </h3>
          <a href="/trabalhoFinalSAC/logout" class="float-right btn btn-danger rounded">Sair</a>
     </nav>   
       <div class="container">
        <div class="row login">
         <div class="col-md-12"> 
         <h1 class="title h1 m-0 mt-4 text-center">Novo Atendimento</h1><br>
          <form class="form shadow " method="post" action="">     
         <input type="hidden" name="entity" value="individual">
            <div class="form-group">
                <div class="col-sm-12">
                    <div class="form-group">
                      <label for="product">Produto</label>
                      <select class="custom-select" id="tipoProduto" name="produto" required="true">
                        <option value="" disabled="disabled" selected="selected">Selecione...</option>
                        <option value="">Produto A</option>
                        <option value="">Produto B</option>
                        <option value="">Produto C</option>
                      </select>
                    </div>
                  </div>
                <div class="col-sm-12">
                    <div class="form-group">
                      <label for="attendance">Tipo de atendimento</label>
                      <select class="custom-select" id="tipoAtendimento" name="atendimento" required="true">
                          <option value="" disabled="disabled" selected="selected">Selecione...</option>
                          <option value=""> A</option>
                          <option value=""> B</option>
                          <option value=""> C</option>
                      </select>
                    </div>
                  </div>
              </div>
            <div class="col-sm-12">
              <label for="description">Descrição do atendimento</label>
              <textarea id="descAtendimento" class="form-control" rows="10" name="descricao" minlength="2" maxlength="50" value=""></textarea>
            </div>
              <div class="row">
              <div class="col-sm-6">
               <div class="form-group">
                <div class="row align-items-center">
                  <div class="col-sm-6 mt-4 mt-sm-0"><br>
                    <button type="submit" class="btn btn-secondary btn-lg btn-block"> Voltar </button>
                  </div>
                </div>
              </div>
             </div>
              <div class="col-sm-6">
               <div class="form-group">
                <div class="row align-items-center">
                  <div class="col-sm-6 mt-4 mt-sm-0"><br>
                    <button type="submit" class="btn buttons btn-lg btn-block"> Cadastrar </button>
                  </div>
                </div>
              </div>
             </div>
            </div>
          </form></div>
            <div class="footer">
              Em caso de problemas contactar o administrador:<br>
              <a href="mailto:">
               </a>
                </div>
            </div>   
          </div>          
      </div>
    </body>
</html>
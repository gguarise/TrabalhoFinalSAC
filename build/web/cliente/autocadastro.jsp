<%-- 
    Document   : cadastro
    Created on : 23/07/2021, 21:48:20
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
     <script type="text/javascript" >

        $(document).ready(function() {
             $( "#estado" ).change(function() {
              getCidades();
             });
        });

        function getCidades(){
            var estadoId = $("#estado").val();
            var url = "AJAXServlet";
                $.ajax({
                     url : url, // URL da sua Servlet
                     data : {
                     estadoId : estadoId
            }, // Parâmetro passado para a Servlet
            dataType : 'json',
            success : function(data) {
                // Se sucesso, limpa e preenche a combo de cidade
                // alert(JSON.stringify(data));
                $("#cidade").empty();
                $.each(data, function(i, obj) {
                    $("#cidade").append('<option value=' + obj.id + '>' + obj.nome + '</option>');
                });
            },
            error : function(request, textStatus, errorThrown) {
                alert(request.status + ', Error: ' + request.statusText);
                 // Erro
            }
        });
      }
    </script>
 </head>
  <body>
    <div class='wrapper page-extra'>
     <nav class='top-section navbar'>
         <h3> Cadastro </h3>
          <a href="${pageContext.request.contextPath}/logout" class="float-right btn btn-danger rounded">Sair</a>
     </nav>   
       <div class="container">
        <div class="row login">
         <div class="col-md-12"> 
             <br><h2> Bem-vindo!</h2>
         <h1 class="title h1 m-0 mt-4 text-center">Insira seus dados</h1><br>
          <form class="form shadow " method="post" action="">     
          <input type="hidden" name="entity" value="individual">
            <div class="form-group">
               <div class="row">
                  <div class="col-sm-6">
                   <div class="form-group">
                    <label for="first_name">Nome</label>
                    <input type="text" class="form-control" id="first_name" name="first_name" required="true" minlength="2" maxlength="50" value="">
                  </div> 
                </div> 
                  <div class="col-sm-6">
                   <div class="form-group">
                    <label for="first_name">Sobrenome</label>
                    <input type="text" class="form-control" id="last_name" name="last_name" required="true"  minlength="2" maxlength="50" value="">
                  </div> 
                </div>
              </div>
              <div class="row">
                <div class="col-12">
                  <div class="form-group">
                    <label for="email">E-mail</label>
                    <input type="email" class="form-control" id="email" name="email" required="true" data-error="email_required_field email_email_field email_customer_exists" maxlength="25" value="">
                    <p class="error"></p>
                  </div>
                </div>
                <div class="col-12">
                  <div class="form-group">
                    <label for="street">Rua</label>
                    <input type="text" class="form-control" id="street" name="street"required="true" autocomplete="off"  maxlength="50" value="">
                    <p class="error"></p>
                  </div>
                </div>
              </div>
              <div class="row">
                  <div class="col-sm-6">
                    <div class="form-group">
                      <label for="number">Nº</label>
                      <input type="number"class="form-control" id="number" name="number" required="true" value="" minlength="8" autocomplete="off" maxlength="15">
                      <p class="error"></p>
                    </div>
                  </div>
                  <div class="col-sm-6">
                    <div class="form-group">
                      <label for="neighborhood">Bairro</label>
                      <input type="text" class="form-control" id="neighborhood" name="neighborhood" required="true"  value="" minlength="2"  maxlength="20" >
                      <p class="error"></p>
                    </div>
                  </div>
                </div>
              <div class="row">
                <div class="col-sm-6">
                  <div class="form-group">
                    <label for="addressComplement">Complemento</label>
                    <input type="text" class="form-control"  id="addressComplement" name="complement" required="true" value="" maxlength="10" >
                  </div> 
                </div> 
                 <div class="col-sm-6">
                    <div class="form-group">
                      <label for="addressPostcode">CEP</label>
                      <input type="text" class="form-control" id="addressPostcode" name="postcode" data-mask="00.000-000" data-lbkey="cep"  required="" value="" maxlength="10">
                      <p class="error"></p>
                    </div>
                  </div>
                </div>
                <div class="row">        
                 <div class="col-sm-6">
                    <div class="form-group">
                      <label for="federativeUnit">UF</label>
                      <select class="custom-select" id="uf" name="uf" required="true">
                        <option value="" disabled="disabled" selected="selected">Selecione...</option>
                        <option value="AC">Acre</option>
                        <option value="AL">Alagoas</option>
                        <option value="AP">Amapa</option>
                        <option value="AM">Amazonas</option>
                        <option value="BA">Bahia</option>
                        <option value="CE">Ceara</option>
                        <option value="DF">Distrito Federal</option>
                        <option value="ES">Espirito Santo</option>
                        <option value="GO">Goias</option>
                        <option value="MA">Maranhao</option>
                        <option value="MT">Mato Grosso</option>
                        <option value="MS">Mato Grosso do Sul</option>
                        <option value="MG">Minas Gerais</option>
                        <option value="PA">Para</option>
                        <option value="PB">Paraiba</option>
                        <option value="PR">Parana</option>
                        <option value="PE">Pernambuco</option>
                        <option value="PI">Piaui</option>
                        <option value="RN">Rio Grande do Norte</option>
                        <option value="RS">Rio Grande do Sul</option>
                        <option value="RJ">Rio de Janeiro</option>
                        <option value="RO">Rondonia</option>
                        <option value="RR">Roraima</option>
                        <option value="SC">Santa Catarina</option>
                        <option value="SP">Sao Paulo</option>
                        <option value="SE">Sergipe</option>
                        <option value="TO">Tocantins</option>
                      </select>
                      <p class="error"></p>
                    </div>
                  </div>
               <div class="col-sm-6">
                    <div class="form-group">
                      <label for="city">Cidade</label>
                      <c:if test="${cidades != null}">
                      <select class="custom-select" id="cidade" name="cidade" required="true">
                        <c:forEach var="cidade" items="${cidades}">
                        <option value="${cidade.id}" ${cidade.id == cliente.endereco.cidade.id ? "selected" : ""}>
                         <c:out value="${cidade.nome}" />
                        </option>
                         </c:forEach>
                        </c:if>
                      </select>
                      <p class="error"></p>
                    </div>
                  </div>
                </div>
               <div class="form-individual">
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label for="date">Data de nascimento</label>
                        <input type="date" class="form-control form-control-blur" id="date" name="date" data-error="date_field" value="" required="true">
                        <p class="error"></p>
                      </div>
                    </div>
                  <div class="col-sm-6 form-individual">
                    <div class="form-group">
                      <label for="cpf">CPF</label>
                      <input type="text" class="form-control" id="cpf" name="cpf" required="true" data-mask="000.000.000-00" data-error="cgc_required_field cgc_cpf_field cgc_cgc_field cgc_customer_exists" value="" autocomplete="off" maxlength="14">
                      <p class="error"></p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-6">
                    <div class="form-group ">
                      <label for="phone">Telefone</label>
                      <input type="tel" class="form-control form-control-blur" id="phone" name="phone" required="true" data-mask="(00) 00000-0009" data-error="phone_required_field phone_phone_field" value="" minlength="8" autocomplete="off" maxlength="15">
                      <p class="error"></p>
                    </div>
                  </div>
                  <div class="col-sm-6">
                <div class="form-group">
                  <label for="password"> Insira uma senha </label>
                  <input type="password" class="form-control" id="password" name="password" required="true" data-error="password_min_length_field password_customer_wrong_password" minlength="6" autocomplete="off">
                  <p class="error"></p>
                </div>
              </div>
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
          </div>
        </form>
            <div class= "footer">
              Em caso de problemas contactar o administrador:<br>
              <a href="mailto:${configuracao.emailAdmin}">
              <c:out value="${configuracao.emailAdmin}" /> </a>
                </div>
            </div>   
          </div>          
      </div>      
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-mask.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>      
 </body>
</html>
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.servlets;

import com.ufpr.tads.web2.beans.Cidade;
import com.ufpr.tads.web2.beans.Cliente;
import com.ufpr.tads.web2.beans.Endereco;
import com.ufpr.tads.web2.beans.Estado;
import com.ufpr.tads.web2.facade.ClienteException;
import com.ufpr.tads.web2.facade.ClienteFacade;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Raphael
 */
@WebServlet(name = "AutoCadastroServlet", urlPatterns = {"/AutoCadastroServlet"})
public class AutoCadastroServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            ServletContext sc = request.getServletContext();
            
            try
            {
                Cliente cliente = new Cliente();
                Endereco endereco = new Endereco();
                Cidade cidade = new Cidade();
                Estado estado = new Estado();
                
                //Seta estado vindo do form
                estado.setSigla(request.getParameter("uf")); //Testar como vai vir do AJAX
                
                //Seta cidade vinda do form
                cidade.setEstado(estado);
                cidade.setNome(request.getParameter("cidade")); //Testar como vai vir do AJAX
                
                //Seta endereco vindo do form
                endereco.setCidade(cidade);
                endereco.setRua(request.getParameter("rua"));
                endereco.setNumero(Integer.parseInt(request.getParameter("numero")));
                String complemento = request.getParameter("complemento");
                if (complemento != null)
                    endereco.setComplemento(complemento);
                endereco.setBairro(request.getParameter("bairro"));
                endereco.setCep(Integer.parseInt(request.getParameter("cep")));
                
                //Seta cliente vindo do form
                cliente.setEndereco(endereco);
                cliente.setEmail(request.getParameter("email"));
                cliente.setSenha(request.getParameter("senha"));
                cliente.setPrimeiroNome(request.getParameter("primeiroNome"));
                cliente.setSobreNome(request.getParameter("sobreNome"));
                cliente.setTelefone(request.getParameter("telefone"));
                cliente.setCpf(Long.parseLong(request.getParameter("cpf")));
                
                ClienteFacade.adicionaCliente(cliente);
            }
            catch(ClienteException | NumberFormatException e)
            {
                request.setAttribute("msg", "ERRO: " + e.getMessage());
                RequestDispatcher rd = request.getRequestDispatcher("/erro.jsp");
                rd.forward(request, response);
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

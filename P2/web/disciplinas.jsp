<%-- 
    Document   : disciplinas
    Created on : 13 de jun. de 2021, 20:27:47
    Author     : Desktop
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="db.Disciplina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    request.setCharacterEncoding("UTF-8");
    String requestError = null;
    ArrayList<Disciplina> disciplinas = new ArrayList<>();
    try{
        if(request.getParameter("INSERT")!=null){
            String nome = request.getParameter("NOME");
            String diaDaSemana = request.getParameter("DIA_DA_SEMANA");
            String horario = request.getParameter("HORARIO");
            String qtdAulas = request.getParameter("QTD_AULAS");            
            Disciplina.insertDisciplina(nome, diaDaSemana, horario, Integer.parseInt(qtdAulas));
            response.sendRedirect(request.getRequestURI());
        }else if(request.getParameter("DELETE")!=null){
            String nome = request.getParameter("NOME");
            Disciplina.deleteDisciplina(nome);
            response.sendRedirect(request.getRequestURI());
        }else if(request.getParameter("CHANGE")!=null){
            String nome = request.getParameter("NOME");
            String p1 = request.getParameter("P1");
            String p2 = request.getParameter("P2");
            Disciplina.changeProva(nome, Integer.parseInt(p1), Integer.parseInt(p2));
            response.sendRedirect(request.getRequestURI());
        }
        disciplinas = Disciplina.getDisciplinas();
    }catch(Exception ex){
        requestError = ex.getMessage();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Disciplinas</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>            
        <%if(requestError!=null){%>
            <div style="color: red"><%= requestError %></div>
        <%}%>
        <%if(session.getAttribute("user.login") == null) {%>
            <div style="color:red">
                Erro: Você precisa estar identificado para ter acesso a este conteúdo!
            </div>
        <%}else{%>
            <form>
                <table border="1">
                     <tr>
                        <th>Disciplina</th>
                        <th>Dia da semana</th>
                        <th>Horário</th>
                        <th>Qtd Aulas</th>
                        <th>P1</th>
                        <th>P2</th>
                    </tr>
                    <%for (Disciplina disciplina: disciplinas) {%>
                        <tr>
                            <td><%= disciplina.getNome() %></td>
                            <td><%= disciplina.getDiaDaSemana() %></td>
                            <td><%= disciplina.getHorario() %></td>
                            <td><%= disciplina.getQtdAulas() %></td>
                            <form method="post">
                                <input type="hidden" name="NOME" value="<%= disciplina.getNome() %>"/>
                                <td><input type="text" name="P1" value="<%= disciplina.getP1() %>"/></td>
                                <td><input type="text" name="P2" value="<%= disciplina.getP2() %>"/></td>
                                <td><input type="submit" name="CHANGE" value="Salvar"/></td>
                            </form>
                            <td>
                                <form method="post">
                                    <input type="hidden" name="NOME" value="<%= disciplina.getNome() %>"/>
                                    <input type="submit" name="DELETE" value="Excluir"/>
                                </form>
                            </td>
                        </tr>
                    <%}%>
                </table>
                <hr/>
                <form method="post">
                    Disciplina:<input type="text" name="NOME"/>
                    Dia da Semana:<input type="text" name="DIA_DA_SEMANA"/>
                    Horario:<input type="text" name="HORARIO"/>
                    Qtd Aulas:<input type="text" name="QTD_AULAS"/>
                    <input type="submit" name="INSERT" value="Inserir"/>
                </form>
            </form>
        <%} %>
    </body>
</html>

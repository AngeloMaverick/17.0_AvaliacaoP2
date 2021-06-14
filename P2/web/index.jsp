<%-- 
    Document   : index
    Created on : 13 de jun. de 2021, 20:21:10
    Author     : Desktop
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="db.User"%>
<%@page import="db.Disciplina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    request.setCharacterEncoding("UTF-8");
    ArrayList<Disciplina> disciplinas = new ArrayList<>();
    disciplinas = Disciplina.getDisciplinas();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>P2</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <table border="1">
            <tr>
                <td>RA: 1290481923001</td>
            </tr>
            <tr>
                <td>Angelo Marcio Sousa Santos</td>
            </tr>
            <tr>
                <td>Ingressou na FatecPG no Segundo Semestre de 2019</td>
            </tr>
            <tr>
                <td><a href="https://github.com/AngeloMaverick">Github AngeloMaverick</a></td>
            </tr>
        </table>
        <%if(session.getAttribute("user.login")!=null){%>
            <table border="1">
                <tr>
                    <th>Disciplina</th>
                    <th>Média</th>
                </tr>
                <%for (Disciplina disciplina: disciplinas) {%>
                    <tr>
                        <td><%= disciplina.getNome() %></td>
                        <td><%= (float)(disciplina.getP1() + disciplina.getP2())/2 %></td>
                    </tr>
                <%}%>
            </table>
        <%}%>
    </body>
</html>

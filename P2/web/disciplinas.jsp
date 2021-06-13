<%-- 
    Document   : disciplinas
    Created on : 13 de jun. de 2021, 20:27:47
    Author     : Desktop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Disciplinas</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>            
        
        <%if(session.getAttribute("user.login") == null) {%>
            <div style="color:red">
                Erro: Você precisa estar identificado para ter acesso a este conteúdo!
            </div>
        <%}else{%>
            <form>
                <table border="1">
                     <tr>
                        <th>Dia da semana</th>
                        <th>Horário</th>
                        <th>Disciplina</th>
                        <th>P1</th>
                        <th>P2</th>
                    </tr>
                    <tr>
                        <td>Segunda-Feira</td>
                        <td>19h00-22h30</td>
                        <td>Programação Orientada a Objetos</td>
                        <td><input type="text" name="PooP1" value="<%= session.getAttribute("PooP1") %>"/></td>
                        <td><input type="text" name="PooP2" value="<%= session.getAttribute("PooP2") %>"/></td>
                    </tr>
                    <tr>
                        <td>Terça-Feira</td>
                        <td>19h00-22h30</td>
                        <td>Engenharia de Software III</td>
                        <td><input type="text" name="EsP1" value="<%= session.getAttribute("EsP1") %>"/></td>
                        <td><input type="text" name="EsP2" value="<%= session.getAttribute("EsP2") %>"/></td>
                    </tr>
                    <tr>
                        <td>Quarta-Feira</td>
                        <td>19h00-22h30</td>
                        <td>Sistemas Operacionais II</td>
                        <td><input type="text" name="SoP1" value="<%= session.getAttribute("SoP1") %>"/></td>
                        <td><input type="text" name="SoP2" value="<%= session.getAttribute("SoP2") %>"/></td>
                    </tr>
                    <tr>
                        <td>Quinta-Feira</td>
                        <td>19h00-22h30</td>
                        <td>Linguagem de Programação IV - INTERNET</td>
                        <td><input type="text" name="LpP1" value="<%= session.getAttribute("LpP1") %>"/></td>
                        <td><input type="text" name="LpP2" value="<%= session.getAttribute("LpP2") %>"/></td>
                    </tr>
                    <tr>
                        <td rowspan="2">Sexta-Feira</td>
                        <td>19h00-20h40</td>
                        <td>Metodologia da Pesquisa Científico-Tecnológica</td>
                        <td><input type="text" name="MpctP1" value="<%= session.getAttribute("MpctP1") %>"/></td>
                        <td><input type="text" name="MpctP2" value="<%= session.getAttribute("MpctP2") %>"/></td>
                    </tr>
                    <tr>

                        <td>20h50-22h30</td>
                        <td>Segurança da Informação</td>
                        <td><input type="text" name="SiP1" value="<%= session.getAttribute("SiP1") %>"/></td>
                        <td><input type="text" name="SiP2" value="<%= session.getAttribute("SiP2") %>"/></td>
                    </tr>
                    <tr>
                        <td>Sábado</td>
                        <td>8h00-11h30</td>
                        <td>Banco de Dados</td>
                        <td><input type="text" name="BdP1" value="<%= session.getAttribute("BdP1") %>"/></td>
                        <td><input type="text" name="BdP2" value="<%= session.getAttribute("BdP2") %>"/></td>
                    </tr>
                </table>
                <input type="submit" name="save" value="Salvar Notas" style="padding: 5px; margin: 5px;"/>
            </form>
        <%} %>
    </body>
</html>

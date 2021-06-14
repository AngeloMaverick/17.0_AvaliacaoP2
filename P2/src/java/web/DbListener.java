/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import db.User;
import db.Disciplina;
import java.sql.*;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Web application lifecycle listener.
 *
 * @author Desktop
 */
public class DbListener implements ServletContextListener {
public static final String CLASS_NAME = "org.sqlite.JDBC";
    public static final String URL = "jdbc:sqlite:C:\\Users\\Desktop\\Documents\\GitHub\\17.0_AvaliacaoP2\\P2.db";
    public static Exception exception = null;
    
    public static Connection getConnection() throws Exception{
        return DriverManager.getConnection(URL);
    }
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try{
            Class.forName(CLASS_NAME);
            Connection con = getConnection();
            Statement stmt = con.createStatement();
            stmt.execute(User.getCreateStatement());
            stmt.execute(Disciplina.getCreateStatement());
            if(User.getUsers().isEmpty()){
                User.insertUser("angelo", "Angelo Marcio Sousa Santos", "ANGELO", "1234");
            }
            if(Disciplina.getDisciplinas().isEmpty()){
                Disciplina.insertDisciplina("Programação Orientada a Objetos", "Segunda-Feira", "19h00-22h30", 4, 7, 0);
                Disciplina.insertDisciplina("Engenharia de Software III", "Terça-Feira", "19h00-22h30", 4, 10, 10);
                Disciplina.insertDisciplina("Sistemas Operacionais II", "Quarta-Feira", "19h00-22h30", 4, 10, 0);
                Disciplina.insertDisciplina("Linguagem de Programação IV - INTERNET", "Quinta-Feira", "19h00-22h30", 4, 10, 0);
                Disciplina.insertDisciplina("Metodologia da Pesquisa Científico-Tecnológica", "Sexta-Feira", "19h00-20h40", 2, 5, 0);
                Disciplina.insertDisciplina("Segurança da Informação", "Sexta-Feira", "20h50-22h30", 2, 10, 10);
                Disciplina.insertDisciplina("Banco de Dados", "Sábado", "8h00-11h30", 4, 10, 10);
            }
            stmt.close();
            con.close();
        }catch(Exception ex){
            exception = ex;
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}

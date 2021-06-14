/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.*;
import java.util.ArrayList;
import web.DbListener;

/**
 *
 * @author Desktop
 */
public class Disciplina {
    private String nome;
    private String diaDaSemana;
    private String horario;
    private Integer qtdAulas;
    private Integer p1;
    private Integer p2;
    
    public static String getCreateStatement(){
        return "CREATE TABLE IF NOT EXISTS DISCIPLINAS("
                + "NOME VARCHAR(200) UNIQUE NOT NULL,"
                + "DIA_DA_SEMANA VARCHAR(30) NOT NULL,"
                + "HORARIO VARCHAR(30) NOT NULL,"
                + "QTD_AULAS NUMBER(2) NOT NULL,"
                + "P1 NUMBER(2),"
                + "P2 NUMBER(2)"
                + ")";
    }
    
    public static ArrayList<Disciplina> getDisciplinas() throws Exception{
        ArrayList<Disciplina> list = new ArrayList<>();
        Connection con = DbListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM DISCIPLINAS");
        while(rs.next()){
            String nome = rs.getString("NOME");
            String diaDaSemana = rs.getString("DIA_DA_SEMANA");
            String horario = rs.getString("HORARIO");
            Integer qtdAulas = rs.getInt("QTD_AULAS");
            Integer p1 = rs.getInt("P1");
            Integer p2 = rs.getInt("P2");            
            list.add(new Disciplina(nome, diaDaSemana, horario, qtdAulas, p1, p2));
        } 
        stmt.close();
        con.close();
        return list;
    }
    
    public static void insertDisciplina(String nome, String diaDaSemana, String horario, Integer qtdAulas, Integer p1, Integer p2) throws Exception{
        Connection con = DbListener.getConnection();
        String sql = "INSERT INTO DISCIPLINAS(NOME, DIA_DA_SEMANA, HORARIO, QTD_AULAS, P1, P2) "
                + "VALUES(?,?,?,?,?,?)";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, nome);
        stmt.setString(2, diaDaSemana);
        stmt.setString(3, horario);
        stmt.setInt(4, qtdAulas);
        stmt.setInt(5, p1);
        stmt.setInt(6, p2);
        stmt.execute();
        stmt.close();
        con.close();
    }
    
    public static void insertDisciplina(String nome, String diaDaSemana, String horario, Integer qtdAulas) throws Exception{
        Connection con = DbListener.getConnection();
        String sql = "INSERT INTO DISCIPLINAS(NOME, DIA_DA_SEMANA, HORARIO, QTD_AULAS, P1, P2) "
                + "VALUES(?,?,?,?,0,0)";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, nome);
        stmt.setString(2, diaDaSemana);
        stmt.setString(3, horario);
        stmt.setInt(4, qtdAulas);
        stmt.execute();
        stmt.close();
        con.close();
    }
    
    public static void deleteDisciplina(String nome) throws Exception{
        Connection con = DbListener.getConnection();
        String sql = "DELETE FROM DISCIPLINAS WHERE NOME = ?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, nome);
        stmt.execute();
        stmt.close();
        con.close();
    }
    
    public static void changeProva(String nome, Integer p1, Integer p2) throws Exception{
        Connection con = DbListener.getConnection();
        String sql = "UPDATE DISCIPLINAS SET P1 = ?, P2 = ? WHERE NOME = ?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, p1);
        stmt.setInt(2, p2);
        stmt.setString(3, nome);
        stmt.execute();
        stmt.close();
        con.close();
    }

    public Disciplina(String nome, String diaDaSemana, String horario, Integer qtdAulas, Integer p1, Integer p2) {
        this.nome = nome;
        this.diaDaSemana = diaDaSemana;
        this.horario = horario;
        this.qtdAulas = qtdAulas;
        this.p1 = p1;
        this.p2 = p2;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDiaDaSemana() {
        return diaDaSemana;
    }

    public void setDiaDaSemana(String diaDaSemana) {
        this.diaDaSemana = diaDaSemana;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public Integer getQtdAulas() {
        return qtdAulas;
    }

    public void setQtdAulas(Integer qtdAulas) {
        this.qtdAulas = qtdAulas;
    }

    public Integer getP1() {
        return p1;
    }

    public void setP1(Integer p1) {
        this.p1 = p1;
    }

    public Integer getP2() {
        return p2;
    }

    public void setP2(Integer p2) {
        this.p2 = p2;
    }

    
}
package br.com.infox.dal;
//Shift + Alt + F p/ identação

import java.sql.*;

/**
 *
 * @author Felipe Pereira
 */
public class ModuloConexao {

    //método responsável por estabelecer a conexão com o banco
    //connection é um framework, um conjunto de funcionalidades que vem do pacote java.sql
    //conector é o método
    //conexao é a variável
    public static Connection conector() {
        Connection conexao = null;
        //a linha abaixo, "chama" o driver
        String driver = "com.mysql.cj.jdbc.Driver";
        //armazenando informações ref ao banco
        String url = "jdbc:mysql://localhost:3306/dbinfox";
        String user = "root";
        String password = "fatec";
        //estabelecendo a conexão com o banco
        //ctrl + space p/ construir a syntex do try
        //try se der tudo certo, ele estabelece a conexão
        try {
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, user, password);
            return conexao;
        } catch (ClassNotFoundException e) {
            //System.out.println("Driver não encontrado: " + e);
            return null;
        } catch (SQLException e) {
            //System.out.println("Erro na conexão com o banco de dados: " + e);
            return null;
        }
        //os "sout" foram comentados, pois é p/ verificar o erro
    }
}

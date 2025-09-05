<%@page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Newsletter JSP</title>

      <style>

    body{
        background: linear-gradient(to right, #48D1CC, #00FF00);
            background-position: center;
            margin: 0;
            padding: 0;
            height: 100vh;
        color: white;
    }

    #retorno {
        text-align: left;
            border: 5px solid black;
            min-height: 10vh;
            background: yellowgreen;
            font-family:Verdana, Geneva, Tahoma, sans-serif;
            padding: 30px;
            text-decoration: none;
    }

    #retorno a {
        text-decoration: none;
        color: white;
    }

    #retorno a:hover {
            background-color: midnightblue;
        }
    </style>
</head>

<body>

<%
    //cria as variaveis para armazenar as informações 
    //digitadas pelo usuário

   String thnome = request.getParameter("tnome");
   String themail = request.getParameter("temail");

    //variaveis para o banco de dados
    String database    = "instituto_jave" ;
    String endereco = "jdbc:mysql://localhost:3306/" + database;
    String usuario  = "root";
    String senha    = "" ;

    //Variavel para o Driver
    String driver = "com.mysql.jdbc.Driver" ;

    //Carregar o driver na memória
    Class.forName( driver ) ;

    //Cria a variavel para conectar com o banco de dados
    Connection conexao ;

    //Abrir a conexao com o banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, senha) ;

    String sql = "INSERT INTO newsletter (nome, email) values (?,?)" ;



    PreparedStatement stm = conexao.prepareStatement(sql);
    stm.setString(1, thnome);
    stm.setString(2, themail);

    stm.execute();
    stm.close();
%>

<div id="retorno">
<h2>Esta feito!</h2>
<h3><a href="principal.html">Voltar a pagina inicial</h3>
</div>
</body>
</html>
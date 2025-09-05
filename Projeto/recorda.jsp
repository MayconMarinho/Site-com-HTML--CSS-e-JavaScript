<%@page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Consulta JSP</title>
    <style>

    body{
        background: linear-gradient(to right, #5f0c4e, #e05606);
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
            background: orangered;
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

   String fnome = request.getParameter("txtNome");
   String ftelefone = request.getParameter("txtFone");
   String fendereco = request.getParameter("txtEndereco");
   String festado = request.getParameter("txtEstado");
   String fdoacao = request.getParameter("txtDoar");
   String fdescricao = request.getParameter("txtDesc");

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

    String sql = "INSERT INTO colaboradores_cadastro (nome, telefone, endereco, estado, tipo_doacao, descricao) values (?,?,?,?,?,?)" ;



    PreparedStatement stm = conexao.prepareStatement(sql);
    stm.setString(1, fnome);
    stm.setString(2, ftelefone);
    stm.setString(3, fendereco);
    stm.setString(4, festado);
    stm.setString(5, fdoacao);
    stm.setString(6, fdescricao);

    stm.execute();
    stm.close();
%>


<div id="retorno">
<h2>Dados salvos com sucesso!</h2>
<h3><a href="principal.html">Clique aqui para retornar</h3>
</div>
</body>
</html>
<%@page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Consulta JSP</title>
    <style>

    body {
        background: linear-gradient(to right, #5f0c4e, #e05606);
            background-position: center;
            margin: 0;
            padding: 0;
            height: 100vh;
            color: white;
    }

        tr:nth-child(even) {
            background-color: #FF4500;
        }

        tr:nth-child(odd) {
            background-color: #8A2BE2;
        }
        tr:hover{
            background-color: #C71585;
        }

        td {
            padding: 15px;
        }

        h4 a{
            text-decoration: none;
            color: white;
        }

        h4 a:hover {
            background-color: midnightblue;
        }


    </style>
</head>
<body>

<h1 align=center>Colaboradores</h1>
<h4 align=center><a href="principal.html">Clique aqui para retornar a pagina inicial</a></h4>
    <%
        //variaveis para o banco de dados
        String database    = "instituto_jave" ;
        String endereco = "jdbc:mysql://localhost:3306/"+database;
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

        String sql = "SELECT * FROM colaboradores_cadastro" ;

        //Cria o statement para executar o comando no banco
        PreparedStatement stm = conexao.prepareStatement(sql) ;

        ResultSet  dados = stm.executeQuery() ;

        out.print("<table border=1 width='500' align=center>");
        out.print("<tr>") ;
            out.print("<th>Nome</th>") ;
            out.print("<th>Telefone</th>") ;
            out.print("<th>Endereco</th>") ;
            out.print("<th>Estado</th>") ;
            out.print("<th>Doacao</th>") ;
            out.print("<th>Descricao</th>") ;
        out.print("</tr>") ;
        while( dados.next() ) 
        {
            out.print("<tr>") ;
                out.print("<td>") ;
                    out.print( dados.getString("nome") ) ;
                out.print("</td>") ;

                out.print("<td>") ;
                    out.print( dados.getString("telefone") ) ;
                out.print("</td>") ;

                out.print("<td>") ;
                    out.print( dados.getString("endereco") ) ;
                out.print("</td>") ;

                out.print("<td>") ;
                    out.print( dados.getString("estado") ) ;
                out.print("</td>") ;

                out.print("<td>") ;
                    out.print( dados.getString("tipo_doacao") ) ;
                out.print("</td>") ;                

                out.print("<td>") ;
                    out.print( dados.getString("descricao") ) ;
                out.print("</td>") ;

            out.print("</tr>") ;

        }

        out.print("</table>") ;
        
    %>

    

</body>
</html>
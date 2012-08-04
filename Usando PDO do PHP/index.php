<?php
include_once 'database.php';
?>
<!doctype html>
<html lang="pt-BR">
    <head>
        <meta charset="utf-8"/>
        <title>Usando PDO - PHP</title>
        
        <link type="text/css" rel="stylesheet" href="style.css" />
        
    </head>
    <body>
        <h1>Cadastro de Usuários</h1>
        
        <?php
        if(isset($_SESSION['message'])){
            echo '<p class="message">'.$_SESSION['message'].'</p>';
            unset($_SESSION['message']);
        }
        ?>
        
        <form method="post" action="create.php">
            
            <label for="name">Nome:</label>
            <input type="text" name="name" id="name" />
            
            <label for="username">Usuário:</label>
            <input type="text" name="username" id="username" />
            
            <label for="password">Senha:</label>
            <input type="password" name="password" id="password" />
            
            <input type="submit" value="Salvar" />
        </form>
        
        <table cellspacing="0" width="40%">
            <tr>
                <th>
                    Nome
                </th>
                <th>
                    Usuário
                </th>
                <th>
                    Excluir
                </th>
            </tr>
            <?php foreach($pdo->query('SELECT * FROM users') as $c): ?>
                <tr>
                    <td>
                        <?php echo $c['name']; ?>
                    </td>
                    <td>
                        <?php echo $c['username']; ?>
                    </td>
                    <td>
                        <a onclick="return window.confirm('Deseja mesmo excluir?')" href="delete.php?id=<?php echo base64_encode($c['id']) ?>">Excluir</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </table>
        
    </body>
</html>
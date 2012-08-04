<?php
// Iclui o arquivo de conexão com banco de dados
include_once 'database.php';

// Verifica se o formulário foi submetido
if($_SERVER['REQUEST_METHOD'] == 'POST'){
    /* Armazena os dados enviados pelo formulário em uma 
     * variável normal para não trabalhar com a variável global $_POST (não é seguro)
     */
    $post = $_POST;
    
    // Verifica se todos campos vieram pelo formulário e se estão preenchidos
    if(isset($post['name'])     && $post['name']     && 
       isset($post['username']) && $post['username'] && 
       isset($post['password']) && $post['password']){
           
        // Prepara uma sentença para ser executada
        $statement = $pdo->prepare('INSERT INTO users (name, username, password) VALUES (:name, :username, :password)');
        
        // Filtra os dados e armazena em variáveis (o filtro padrão é FILTER_SANITIZE_STRING que remove tags HTML)
        $name     = filter_var($post['name']);
        $username = filter_var($post['username']);
        $password = filter_var($post['password']);
        
        // Adiciona os dados acima para serem executados na sentença
        $statement->bindParam(':name',     $name);
        $statement->bindParam(':username', $username);
        $statement->bindParam(':password', $password);
        
        // Executa a sentença já com os valores
        if($statement->execute()){
            // Definimos a mensagem de sucesso
            $_SESSION['message'] = 'Usuário cadastrado com sucesso';
        }else{
            // Definimos a mensagem de erro
            $_SESSION['message'] = 'Falha ao cadastrar usuário';
        } 
        
    }else{
        // Definimos a mensagem de erro
        $_SESSION['message'] = 'Preencha todos os campos';
    }
}

// Redirecionamos para a página inicial
header('Location: index.php');

?>
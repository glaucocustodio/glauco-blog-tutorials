<?php
// Inclui o arquivo de conexão com banco de dados
include_once 'database.php';

// Verifica se é uma requisão do tipo GET
if($_SERVER['REQUEST_METHOD'] == 'GET'){
    $get = $_GET;
    
    /* Verifica se veio o id do registro pela URL e se tem um valor definido
     * Obs: função base64_decode decodifica uma string, é o inverso de base64_encode usada por segurança
     */
    if(isset($get['id']) && base64_decode($get['id'])){
        // Executa query responsável por remover o usuário
        $delete = $pdo->exec('DELETE FROM videos WHERE id = '. base64_decode($get['id']));
        
        // Verifica se o usuário foi removido com sucesso
        if($delete){
            // Definimos a mensagem de sucesso
            $_SESSION['message'] = 'Vídeo excluido com sucesso';
        }else{
            // Definimos a mensagem de erro
            $_SESSION['message'] = 'Falha ao excluir vídeo';
        }
    }else{
        // Definimos a mensagem de erro
        $_SESSION['message'] = 'Falha ao excluir vídeo';
    }
}

// Redirecionamos para a página inicial
header('Location: index.php');
?>
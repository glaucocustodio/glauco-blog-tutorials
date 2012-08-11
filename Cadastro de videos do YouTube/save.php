<?php
// Inclui arquivo de conexão com banco de dados
include_once 'database.php';

// Verifica se o formulário foi submetido e se é uma requisão do tipo POST
if($_SERVER['REQUEST_METHOD'] == 'POST'){
    // Armazena os dados enviados em uma variável
    $post = $_POST;
    
    // Verifica se o título foi preenchido e se tem pelo menos 5 caracteres
    if(isset($post['title']) && $post['title'] && strlen($post['title']) >= 5){
        // Filtra o título (remove tags HTML)
        $title = filter_var($post['title']);
        
        // Verifica se o endereço do vídeo foi preenchido
        if(isset($post['url']) && $post['url']){
            // Analisa o endereço do vídeo (parse)
            $subString = parse_url($post['url']);
            
            // Verifica se tem o índice 'query' no array obtido pelo parse acima
            if(isset($subString['query']) && $subString['query']){
                // Analisa a string de 'query' para encontrar o id do vídeo
                parse_str($subString['query'], $output);
                  
                // Se tiver a variável 'v' na url e tiver um id setado, então cadastra o vídeo
                if(isset($output['v']) && $output['v']){
                    
                    // Prepara uma sentença para ser executada
                    $statement = $pdo->prepare('INSERT INTO videos (title, video_id) VALUES (:title, :video_id)');
                    // Preenche os parâmetros com os dados a serem salvos
                    $statement->bindParam(':title', $title);
                    $statement->bindParam(':video_id',   $output['v']);
                    
                    // Cadastra o vídeo no banco de dados
                    if($statement->execute()){
                        // Definimos a mensagem de sucesso
                        $_SESSION['message'] = 'Vídeo cadastrado com sucesso';
                    }else{
                        // Definimos a mensagem de erro
                        $_SESSION['message'] = 'Falha ao cadastrar vídeo';
                    } 
                    
                }else{
                    $_SESSION['message'] = 'Endereço do vídeo inválido';
                }
            }else{
                $_SESSION['message'] = 'Endereço do vídeo inválido';
            }
            
        }else{
            $_SESSION['message'] = 'Endereço do vídeo inválido';
        }
        
    }else{
        $_SESSION['message'] = 'Título deve ter no mínimo 5 caracteres';
    }
}
// Redireciona para a página inicial
header('Location: index.php');
?>
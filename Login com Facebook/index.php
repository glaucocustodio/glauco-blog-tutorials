<?php
    // Verifica o tipo de requisição e se tem a variável 'code' na url
    if($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['code'])){

	   // Informe o id da app
       $appId = '104463303035318';
	   // Senha da app
       $appSecret = 'sua_app_secret_aqui';
	   // Url informada no campo "Site URL" 
       $redirectUri = urlencode('http://projetos.com/glauco-blog-tutorials/Login%20com%20Facebook/');
	   // Obtém o código da query string
       $code = $_GET['code'];

	   // Monta a url para obter o token de acesso
       $token_url = "https://graph.facebook.com/oauth/access_token?"
       . "client_id=" . $appId . "&redirect_uri=" . $redirectUri
       . "&client_secret=" . $appSecret . "&code=" . $code;
       
       // Requisita token de acesso
       $response = @file_get_contents($token_url);
       
       if($response){
           $params = null;
           parse_str($response, $params);
           
           // Se veio o token de acesso
           if(isset($params['access_token']) && $params['access_token']){
             $graph_url = "https://graph.facebook.com/me?access_token=" 
             . $params['access_token'];
      
             // Obtém dados através do token de acesso
             $user = json_decode(file_get_contents($graph_url));
             
             // Se obteve os dados necessários
             if(isset($user->email) && $user->email){
               
               /*
                * Autenticação feita com sucesso.
                * Loga usuário na sessão. Substitua as linhas abaixo pelo seu código de registro de usuários logados
                */
               $_SESSION['user_data']['email'] = $user->email;
               $_SESSION['user_data']['name'] = $user->name;
               
               /*
                * Aqui você pode adicionar um código que cadastra o email do usuário no banco de dados
                * A cada requisição feita em páginas de área restrita você verifica se o email
                * que está na sessão é um email cadastrado no banco
                */
             }
           }else{
             $_SESSION['fb_login_error'] = 'Falha ao logar no Facebook';
           }
       }else{
           $_SESSION['fb_login_error'] = 'Falha ao logar no Facebook';
       }

    }else if($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['error'])){
        $_SESSION['fb_login_error'] = 'Permissão não concedida';
    }
?>
<!doctype html>
<html lang="pt-BR">
    <head>
        <meta charset="utf-8"/>
        <title>Login com Facebook</title>
        
        <link type="text/css" rel="stylesheet" href="style.css" />
        
    </head>
    <body>
        <h1>Login com Facebook</h1>
        
        <?php if(isset($_SESSION['fb_login_error']) && $_SESSION['fb_login_error']): ?>
            <p class="message"><?php echo $_SESSION['fb_login_error'] ?></p>
        <?php unset($_SESSION['fb_login_error']); endif; ?>
        
        <?php if(isset($_SESSION['user_data']) && !empty($_SESSION['user_data'])): ?>
            <div id="facebook-data">
                <p>
                    <strong>Usuário logado com sucesso!</strong>
                </p>
                <p>
                    <strong>Nome: </strong><?php echo $_SESSION['user_data']['name'] ?>
                </p>
                <p>
                    <strong>E-mail: </strong><?php echo $_SESSION['user_data']['email'] ?>
                </p>
            </div>
        <?php else: ?>
            <a href="https://www.facebook.com/dialog/oauth?client_id=104463303035318&scope=email&redirect_uri=<?php echo urlencode('http://projetos.com/glauco-blog-tutorials/Login%20com%20Facebook/') ?>">Entrar com Facebook</a>
        <?php endif; ?>
        
        <a class="fixed" href="http://blog.glaucocustodio.com" target="_blank">Blog Glauco Custódio - http://blog.glaucocustodio.com</a>
    </body>
</html>
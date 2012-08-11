<?php
// Inclui arquivo de conexão com o banco de dados
include_once 'database.php';
?>
<!doctype html>
<html lang="pt-BR">
    <head>
        <meta charset="utf-8"/>
        <title>Cadastro de vídeos do YouTube</title>
        
        <link type="text/css" rel="stylesheet" href="reset.css" />
        <link type="text/css" rel="stylesheet" href="colorbox.css" />
        <link type="text/css" rel="stylesheet" href="style.css" />
        
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <script type="text/javascript" src="jquery.colorbox.js"></script>
        
        <script type="text/javascript">
        $(function(){
          $("a.lightbox").colorbox({iframe:true, innerWidth:425, innerHeight:344});  
        })
        </script>
        
    </head>
    <body>
        <h1>Cadastro de vídeos do YouTube</h1>
        
        <?php
        if(isset($_SESSION['message'])){
            echo '<p class="message">'.$_SESSION['message'].'</p>';
            unset($_SESSION['message']);
        }
        ?>
        
        <form method="post" action="save.php">
            
            <label for="title">Título:</label>
            <input type="text" name="title" id="title" size="40" maxlength="40"/>
            
            <label for="url">Endereço:</label>
            <input type="text" name="url" id="url" size="60"/>
            
            <input type="submit" value="Cadastrar" />
        </form>
        
        <ul id="video-list">        
        <?php foreach($pdo->query('SELECT * FROM videos ORDER BY id DESC') as $c): ?>
            <li>
                <p>
                    <strong>
                        <?php echo $c['title']; ?>
                    </strong>
                </p>
                <a title="<?php echo $c['title'] ?>" class="lightbox" href="http://www.youtube.com/embed/<?php echo $c['video_id'] ?>?rel=0&amp;wmode=transparent">
                    <img src="http://i1.ytimg.com/vi/<?php echo $c['video_id'] ?>/default.jpg" alt="<?php echo $c['title']; ?>" />
                </a>
                
                <a class="delete" onclick="return confirm('Deseja mesmo excluir esse vídeo?')" href="delete.php?id=<?php echo base64_encode($c['id']); ?>">Excluir</a>
            </li>
        <?php endforeach; ?>
        </ul>
        
        <div class="clear"></div>
        
        <a class="fixed" href="http://blog.glaucocustodio.com" target="_blank">Blog Glauco Custódio - http://blog.glaucocustodio.com</a>
    </body>
</html>
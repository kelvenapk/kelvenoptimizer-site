
<?php
session_start();
if (!isset($_SESSION['admin'])) {
    header('Location: login.php');
    exit;
}
?>
<!doctype html>
<html lang="pt">
<head>
  <meta charset="utf-8"/>
  <title>Admin - Editar Site</title>
  <style>
    body{background:#0f0f0f;color:#00ff00;font-family:Arial;padding:2rem}
    textarea{width:100%;height:400px;background:#1a1a1a;color:#00ff00;padding:1rem;border:none;border-radius:8px}
    button{background:#00ff00;color:#000;padding:1rem;border:none;font-weight:bold;cursor:pointer;border-radius:8px}
  </style>
</head>
<body>
  <h1>🛠️ Editar Site</h1>
  <form method="post">
    <textarea name="conteudo"><?= htmlspecialchars(file_get_contents('../index.html')) ?></textarea>
    <br><button>Salvar</button>
  </form>
  <?php if ($_POST): ?>
    <?php file_put_contents('../index.html', $_POST['conteudo']); ?>
    <p style="color:#00ff00;">✅ Site atualizado!</p>
  <?php endif; ?>
  <p><a href="logout.php">Sair</a></p>
</body>
</html>
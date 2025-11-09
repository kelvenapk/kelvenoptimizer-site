<?php
session_start();
$senha = '98871718k'; // 🔒 Senha personalizada
if (($_POST['senha'] ?? '') === $senha) {
    $_SESSION['admin'] = true;
    header('Location: index.php');
    exit;
}
?>
<!doctype html>
<html lang="pt">
<head>
  <meta charset="utf-8"/>
  <title>Admin - Login</title>
  <style>
    body{background:#0f0f0f;color:#00ff00;font-family:Arial;display:flex;justify-content:center;align-items:center;height:100vh}
    form{background:#1a1a1a;padding:2rem;border-radius:12px}
    input[type=password]{padding:.7rem;width:100%;margin:.5rem 0;border:none;border-radius:6px}
    button{background:#00ff00;color:#000;border:none;padding:.7rem;width:100%;font-weight:bold;cursor:pointer;border-radius:6px}
  </style>
</head>
<body>
  <form method="post">
    <h2>🔐 Admin Login</h2>
    <input type="password" name="senha" placeholder="Senha" required>
    <button>Entrar</button>
  </form>
</body>
</html>
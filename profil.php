<?php
session_start();

if (!isset($_SESSION['id_utilisateur'])) {
    header("Location: login.html");
    exit;
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Profil - HappyTrip</title>
</head>
<body>

<h2>Bienvenue, <?php echo $_SESSION['nom']; ?> !</h2>

<p>Vous êtes connecté à votre espace HappyTrip.</p>

<a href="logout.php">Se déconnecter</a>

</body>
</html>

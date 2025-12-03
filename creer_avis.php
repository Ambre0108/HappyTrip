<?php
session_start();
if (!isset($_SESSION['id_utilisateur'])) {
    header("Location: login.php");
    exit();
}

$code_pays = $_GET['code_pays'];
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Créer un avis</title>
<link rel="stylesheet" href="style_avis.css"> <!-- ton style actuel -->
</head>

<body>

<div id="avis-form-container">
    <h2>Donner un avis sur ce voyage</h2>

    <form id="avisForm">
        <input type="hidden" name="code_pays" value="<?= htmlspecialchars($code_pays) ?>">

        <label>Note :</label>
        <div id="stars">
            <!-- Tes 5 SVG d'origine -->
        </div>

        <label>Commentaire :</label>
        <textarea name="commentaire" placeholder="Votre expérience..."></textarea>

        <input type="hidden" name="mode" value="insert">

        <button type="submit">Envoyer</button>
    </form>
</div>

<script src="avis.js"></script> <!-- Ton script d'étoiles -->
</body>
</html>
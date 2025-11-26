<?php

$pdo = new PDO("mysql:host=localhost;dbname=happytrip;charset=utf8", "root", "");

// Vérifier si un pays est demandé
if (!isset($_GET['code'])) {
    die("Aucun pays sélectionné.");
}

$code = $_GET['code'];

// Récupérer infos dans la BD
$query = $pdo->prepare("SELECT * FROM pays WHERE code = :code");
$query->execute(['code' => $code]);
$pays = $query->fetch(PDO::FETCH_ASSOC);

if (!$pays) {
    die("Aucune information trouvée pour ce pays.");
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><?php echo $pays['nom']; ?> - HappyTrip</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <h1><?php echo $pays['nom']; ?></h1>

    <div class="card">
        <p><strong>Capitale :</strong> <?php echo $pays['capitale']; ?></p>
        <p><strong>Continent :</strong> <?php echo $pays['continent']; ?></p>
        <p><strong>Langue officielle :</strong> <?php echo $pays['langue']; ?></p>
        <p><strong>Population :</strong> <?php echo $pays['population']; ?></p>
        <p><strong>Monnaie :</strong> <?php echo $pays['monnaie']; ?></p>
        <p><strong>Description :</strong> <?php echo $pays['description']; ?></p>
    </div>

    <a href="carte.html">⬅ Retour à la carte</a>
</body>
</html>

<?php
// 1) Connexion à la base
$host = "localhost";
$user = "root";
$pass = "root"; // MAMP par défaut
$db = "happytrip";

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die("Erreur connexion : " . $conn->connect_error);
}

// 2) Vérifier que ?code existe
if (!isset($_GET['code'])) {
    die("Aucun pays sélectionné.");
}

$code = $_GET['code'];

// 3) Récupérer informations du pays
$sql = "
SELECT 
    p.nom_pays,
    p.continent,
    b.score_bonheur,
    b.pib_par_habitant,
    b.soutien_social,
    b.esperance_vie,
    t.nombre_touristes,
    t.revenus_tourisme
FROM pays p
LEFT JOIN indicateurbonheur b ON p.id_pays = b.id_pays
LEFT JOIN tourisme t ON p.id_pays = t.id_pays
WHERE p.code_iso = ?
";

$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $code);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    die("Pays non trouvé : " . htmlspecialchars($code));
}

$data = $result->fetch_assoc();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title><?php echo $data['nom_pays']; ?> - HappyTrip</title>
</head>
<body>

<h1><?php echo $data['nom_pays']; ?></h1>

<ul>
    <li><strong>Continent : </strong><?php echo $data['continent']; ?></li>
    <li><strong>Score Bonheur : </strong><?php echo $data['score_bonheur']; ?></li>
    <li><strong>PIB / Habitant : </strong><?php echo $data['pib_par_habitant']; ?></li>
    <li><strong>Soutien social : </strong><?php echo $data['soutien_social']; ?></li>
    <li><strong>Espérance de vie : </strong><?php echo $data['esperance_vie']; ?></li>
    <li><strong>Nombre de touristes : </strong><?php echo $data['nombre_touristes']; ?></li>
    <li><strong>Revenus du tourisme : </strong><?php echo $data['revenus_tourisme']; ?></li>
</ul>

<br>
<a href="carte.html">← Retour à la carte</a>

</body>
</html>

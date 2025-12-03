<?php
session_start();

if(!isset($_SESSION['id_utilisateur'])){
    header("Location: login.php");
    exit();
}

try {
    $pdo = new PDO(
        "mysql:host=localhost;dbname=happytrip;charset=utf8",
        "root","root",
        [PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION]
    );
} catch(PDOException $e) {
    die($e->getMessage());
}

// Récupération des champs avec protection contre warnings
$id_utilisateur = $_SESSION['id_utilisateur'];
$code_pays = $_POST['code_pays'] ?? null;
$villes = $_POST['villes'] ?? null;
$budget = $_POST['budget'] ?? null;
$activites = $_POST['activites'] ?? null;
$hebergement = $_POST['hebergement'] ?? null;
$accompagnement = $_POST['accompagnement'] ?? null;
$priorite = $_POST['priorite'] ?? null;

// Gestion de la date
$date_depart = !empty($_POST['date_depart']) ? $_POST['date_depart'] : ($_POST['date_depart_approx'] ?? null);
$date_retour = !empty($_POST['date_retour']) ? $_POST['date_retour'] : null;

// Préparer et exécuter l'insertion
$sql = $pdo->prepare("
    INSERT INTO destinations 
    (id_utilisateur, code_pays, villes, date_depart, date_retour, budget, activites, hebergement, accompagnement, priorite)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
");

$sql->execute([
    $id_utilisateur,
    $code_pays,
    $villes,
    $date_depart,
    $date_retour,
    $budget,
    $activites,
    $hebergement,
    $accompagnement,
    $priorite
]);

header("Location: profil.php");
exit();

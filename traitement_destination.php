<?php
session_start();

if (!isset($_SESSION['id_utilisateur'])) {
    header("Location: login.php");
    exit();
}

try {
    $pdo = new PDO(
        "mysql:host=localhost;dbname=happytrip;charset=utf8mb4",
        "root",
        "root",
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
} catch (PDOException $e) { die($e->getMessage()); }

// --- RÉCUPÉRATION DES DONNÉES FORMULAIRES ---
$idUser = $_SESSION['id_utilisateur'];
$idDestination = $_POST['id_destination'] ?? null;

$code_pays = $_POST['code_pays'];
$villes = $_POST['villes'] ?? null;

$type_date = $_POST['type_date']; // exacte ou approx

$date_depart = $_POST['date_depart'] ?? null;
$date_retour = $_POST['date_retour'] ?? null;
$date_approx = $_POST['date_depart_approx'] ?? null;

$budget = $_POST['budget'] ?? null;
$activites = $_POST['activites'] ?? null;
$hebergement = $_POST['hebergement'] ?? null;
$accompagnement = $_POST['accompagnement'] ?? null;
$priorite = $_POST['priorite'] ?? null;

// --- VÉRIFICATION DES DATES ---
if ($type_date === "exacte") {

    // les champs approx doivent être ignorés
    $date_approx = null;

    if ($date_depart && $date_retour && $date_retour < $date_depart) {
        die("Erreur : la date de retour ne peut pas être antérieure à la date de départ.");
    }

} else if ($type_date === "approx") {

    // les dates exactes doivent être ignorées
    $date_depart = null;
    $date_retour = null;

    if (!$date_approx) {
        die("Erreur : vous devez entrer une date approximative.");
    }
}

// --- MODE AJOUT ---
if (!$idDestination) {

    $sql = "INSERT INTO destinations 
            (id_utilisateur, code_pays, villes, 
             date_depart, date_retour, date_depart_approx,
             budget, activites, hebergement, accompagnement, priorite,
             date_creation)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";

    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        $idUser, $code_pays, $villes,
        $date_depart, $date_retour, $date_approx,
        $budget, $activites, $hebergement, $accompagnement, $priorite
    ]);

} 
// --- MODE MODIFICATION ---
else {

    $sql = "UPDATE destinations SET
                code_pays = ?,
                villes = ?,
                date_depart = ?,
                date_retour = ?,
                date_depart_approx = ?,
                budget = ?,
                activites = ?,
                hebergement = ?,
                accompagnement = ?,
                priorite = ?
            WHERE id_destination = ? AND id_utilisateur = ?";

    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        $code_pays, $villes,
        $date_depart, $date_retour, $date_approx,
        $budget, $activites, $hebergement, $accompagnement, $priorite,
        $idDestination, $idUser
    ]);
}

// Retour au profil
header("Location: profil.php");
exit();
?>

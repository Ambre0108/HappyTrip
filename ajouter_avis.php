<?php
session_start();

if (!isset($_SESSION['id_utilisateur'])) {
    exit("Utilisateur non connecté");
}

$host = "localhost";
$user = "root";
$pass = "root";
$db = "happytrip";

$conn = new mysqli($host, $user, $pass, $db);
$conn->set_charset("utf8mb4");

$utilisateur = $_SESSION['id_utilisateur'];

$code_pays   = $_POST['code_pays'] ?? null;
$commentaire = $_POST['commentaire'] ?? "";
$note        = intval($_POST['note'] ?? 0);

if (!$code_pays || $note == 0) {
    exit("Paramètres manquants");
}

/* Vérifier si un avis existe déjà */
$sqlCheck = "SELECT * FROM avis WHERE id_utilisateur = ? AND code_pays = ?";
$stmt = $conn->prepare($sqlCheck);
$stmt->bind_param("is", $utilisateur, $code_pays);
$stmt->execute();
$exists = $stmt->get_result()->num_rows > 0;

if ($exists) {
    // Mise à jour
    $sql = "UPDATE avis SET commentaire = ?, note = ?, date_avis = NOW()
            WHERE id_utilisateur = ? AND code_pays = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("siis", $commentaire, $note, $utilisateur, $code_pays);

} else {
    // Insertion
    $sql = "INSERT INTO avis (id_utilisateur, code_pays, commentaire, note, date_avis)
            VALUES (?, ?, ?, ?, NOW())";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("issi", $utilisateur, $code_pays, $commentaire, $note);
}

if (!$stmt->execute()) {
    exit("Erreur SQL : " . $stmt->error);
}

/* Supprimer la destination correspondante */
$delete = $conn->prepare("DELETE FROM destinations WHERE id_utilisateur = ? AND code_pays = ?");
$delete->bind_param("is", $utilisateur, $code_pays);
$delete->execute();

echo "ok";

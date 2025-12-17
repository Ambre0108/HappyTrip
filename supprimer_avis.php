<?php
session_start();
if (!isset($_SESSION['id_client'])) {
    exit("Utilisateur non connecté");
}

$host = "localhost";
$user = "root";
$pass = "root";
$db = "happytrip";

$conn = new mysqli($host, $user, $pass, $db);
$conn->set_charset("utf8mb4");

$id_client = $_SESSION['id_client'];
$id_art = intval($_POST['id_art'] ?? 0);

if (!$id_art) exit("Paramètre manquant");

$sql = "DELETE FROM avis WHERE id_client = ? AND id_art_ = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ii", $id_client, $id_art);

if ($stmt->execute()) {
    echo "ok";
} else {
    echo "Erreur SQL: " . $stmt->error;
}
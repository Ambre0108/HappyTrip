<?php
session_start();

if (!isset($_SESSION['id_utilisateur'])) {
    echo "not_logged";
    exit;
}

$host = "localhost";
$user = "root";
$pass = "root";
$db = "happytrip";

$conn = new mysqli($host, $user, $pass, $db);

$utilisateur = $_SESSION['id_utilisateur'];
$code_pays = $_POST['code_pays'];

$sql = "DELETE FROM avis WHERE id_utilisateur = ? AND code_pays = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("is", $utilisateur, $code_pays);
$stmt->execute();

echo "ok";
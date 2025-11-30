<?php
session_start();

header('Content-Type: application/json');

if (!isset($_SESSION['id_utilisateur'])) {
    echo json_encode(["logged" => false]);
    exit;
}

$host = "localhost";
$user = "root";
$pass = "root";
$db = "happytrip";

$conn = new mysqli($host, $user, $pass, $db);

$utilisateur = $_SESSION['id_utilisateur'];
$code_pays = $_GET['pays'];

$sql = "SELECT commentaire, note FROM avis WHERE id_utilisateur = ? AND code_pays = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("is", $utilisateur, $code_pays);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 1) {
    echo json_encode([
        "logged" => true,
        "exists" => true,
        "data" => $result->fetch_assoc()
    ]);
} else {
    echo json_encode([
        "logged" => true,
        "exists" => false
    ]);
}
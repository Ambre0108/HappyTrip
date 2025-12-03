<?php
session_start();

if (!isset($_SESSION['id_utilisateur'])) {
    die("Non autorisé");
}

try {
    $pdo = new PDO(
        "mysql:host=localhost;dbname=happytrip;charset=utf8",
        "root", "root",
        [ PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION ]
    );
} catch (PDOException $e) {
    die("Erreur : " . $e->getMessage());
}

$id = $_POST['id_destination'] ?? null;

if (!$id) {
    die("Destination inconnue");
}

$stmt = $pdo->prepare("DELETE FROM destinations WHERE id_destination = ? AND id_utilisateur = ?");
$stmt->execute([$id, $_SESSION['id_utilisateur']]);

header("Location: profil.php");
exit();

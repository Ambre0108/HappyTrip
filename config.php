<?php
try {
    $pdo = new PDO(
        "mysql:host=localhost;dbname=happytrip;charset=utf8",
        "root",
        "root" // ← sur MAMP le mot de passe est "root"
    );
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (Exception $e) {
    die("Erreur de connexion : " . $e->getMessage());
}
?>
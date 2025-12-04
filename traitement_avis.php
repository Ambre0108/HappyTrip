<?php
session_start();

if (!isset($_SESSION['id_utilisateur'])) {
    exit("Utilisateur non connecté");
}

try {
    $pdo = new PDO(
        "mysql:host=localhost;dbname=happytrip;charset=utf8mb4",
        "root","root",
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
} catch (PDOException $e) {
    exit("Erreur DB : " . $e->getMessage());
}

$utilisateur  = $_SESSION['id_utilisateur'];
$code_pays    = $_POST['code_pays'] ?? null;
$commentaire  = $_POST['commentaire'] ?? "";
$note         = intval($_POST['note'] ?? 0);

if (!$code_pays || $note < 1) {
    exit("Paramètres manquants");
}

/* Vérifier si l'avis existe */
$check = $pdo->prepare("SELECT 1 FROM avis WHERE id_utilisateur = ? AND code_pays = ?");
$check->execute([$utilisateur, $code_pays]);
$exists = $check->fetch();

/* Update */
if ($exists) {
    $sql = $pdo->prepare("
        UPDATE avis 
        SET commentaire = ?, note = ?, date_avis = NOW() 
        WHERE id_utilisateur = ? AND code_pays = ?
    ");
    $sql->execute([$commentaire, $note, $utilisateur, $code_pays]);

} else {
    /* Insert */
    $sql = $pdo->prepare("
        INSERT INTO avis (id_utilisateur, code_pays, commentaire, note, date_avis)
        VALUES (?, ?, ?, ?, NOW())
    ");
    $sql->execute([$utilisateur, $code_pays, $commentaire, $note]);
}

/* Supprimer la destination associée */
$delete = $pdo->prepare("DELETE FROM destinations WHERE id_utilisateur = ? AND code_pays = ?");
$delete->execute([$utilisateur, $code_pays]);

echo "ok";

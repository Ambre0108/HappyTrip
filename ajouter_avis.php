<?php
session_start();

$host = "localhost";
$user = "root";
$pass = "root";
$db = "happytrip";

$conn = new mysqli($host, $user, $pass, $db);

$utilisateur = $_SESSION['id_utilisateur'];
$code_pays = $_POST['code_pays'];
$commentaire = $_POST['commentaire'];
$note = $_POST['note'];
$mode = $_POST['mode']; // insert ou update

if ($mode === "update") {

    $sql = "UPDATE avis 
            SET commentaire = ?, note = ?, date_avis = NOW() 
            WHERE id_utilisateur = ? AND code_pays = ?";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("siis", $commentaire, $note, $utilisateur, $code_pays);

} else {

    $sql = "INSERT INTO avis (id_utilisateur, code_pays, commentaire, note)
            VALUES (?, ?, ?, ?)";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("issi", $utilisateur, $code_pays, $commentaire, $note);
}

$stmt->execute();
echo "ok";
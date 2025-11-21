<?php
session_start();

$host = "localhost";
$user = "root";
$pass = "root";
$db = "happytrip";

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Erreur connexion : " . $conn->connect_error);
}

$nom = $_POST['nom'];
$email = $_POST['email'];
$mdp = $_POST['mdp'];

// Vérifier si email déjà utilisé
$sql = "SELECT id_utilisateur FROM utilisateur WHERE email = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $email);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows > 0) {
    echo "Email déjà utilisé. <a href='register.html'>Retour</a>";
    exit;
}

$hash = password_hash($mdp, PASSWORD_DEFAULT);

// Insérer nouvel utilisateur
$sql = "INSERT INTO utilisateur (nom, email, mot_de_passe) VALUES (?,?,?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sss", $nom, $email, $hash);

if ($stmt->execute()) {
    echo "Compte créé ! <a href='login.html'>Se connecter</a>";
} else {
    echo "Erreur : " . $conn->error;
}
?>

<?php
session_start();

// Connexion MySQL (MAMP)
$host = "localhost";
$user = "root";
$pass = "root";
$db = "happytrip";

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Erreur connexion : " . $conn->connect_error);
}

$email = $_POST['email'];
$mdp = $_POST['mdp'];

// Vérifier si email existe
$sql = "SELECT id_utilisateur, nom, mot_de_passe FROM utilisateur WHERE email = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $email);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows === 1) {
    $stmt->bind_result($id, $nom, $hash);
    $stmt->fetch();

    if (password_verify($mdp, $hash)) {
        // Connexion OK
        $_SESSION['id_utilisateur'] = $id;
        $_SESSION['nom'] = $nom;

        header("Location: profil.php");
        exit;
    } else {
        echo "Mot de passe incorrect";
    }
} else {
    echo "Email non trouvé.";
}
?>

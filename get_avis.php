<?php
session_start();
header("Content-Type: application/json");

$host = "localhost";
$user = "root";
$pass = "root";
$db = "happytrip";

$conn = new mysqli($host, $user, $pass, $db);

$code = $_GET["pays"];

// Récupérer les avis AVEC le nom de l'utilisateur
$sql = "SELECT 
            a.commentaire, 
            a.note, 
            a.date_avis, 
            u.nom
        FROM avis a 
        JOIN utilisateur u ON u.id_utilisateur = a.id_utilisateur
        WHERE a.code_pays = ?
        ORDER BY a.date_avis DESC";

$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $code);
$stmt->execute();
$result = $stmt->get_result();

$avis = [];
$total = 0;
$count = 0;

while ($row = $result->fetch_assoc()) {
    $avis[] = $row;
    $total += $row["note"];
    $count++;
}

$moyenne = $count > 0 ? round($total / $count, 1) : 0;

echo json_encode([
    "avis" => $avis,
    "moyenne" => $moyenne,
    "count" => $count
]);

<?php
header("Content-Type: application/json");


$host = "localhost";
$user = "root";
$pass = "root";
$db = "happytrip";

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    echo json_encode(["error" => "Erreur connexion DB"]);
    exit;
}

// 2) Vérifier paramètre
if (!isset($_GET['code'])) {
    echo json_encode(["error" => "Code pays manquant"]);
    exit;
}

$code = $_GET['code'];

// 3) Requête
$sql = "
SELECT 
    p.nom_pays,
    p.continent,
    p.description,
    b.score_bonheur,
    b.pib_par_habitant,
    b.soutien_social,
    b.esperance_vie,
    t.nombre_touristes,
    t.revenus_tourisme
    
    

FROM pays p
LEFT JOIN indicateurbonheur b ON p.id_pays = b.id_pays
LEFT JOIN tourisme t ON p.id_pays = t.id_pays
WHERE p.code_iso = ?
";

$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $code);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    echo json_encode(["error" => "Pays introuvable"]);
    exit;
}

$data = $result->fetch_assoc();

// 4) Retourner en JSON
echo json_encode($data);

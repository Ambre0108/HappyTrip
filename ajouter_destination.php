<?php
session_start();

if (!isset($_SESSION['id_utilisateur'])) {
    header("Location: login.php");
    exit();
}

try {
    $pdo = new PDO(
        "mysql:host=localhost;dbname=happytrip;charset=utf8mb4",
        "root",
        "root",
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
} catch (PDOException $e) { die($e->getMessage()); }

// Récupérer les pays
$pays = $pdo->query("SELECT code_iso, nom_pays FROM pays ORDER BY nom_pays ASC")->fetchAll();

// 🔥 Mode modification
$destination = null;
$idDestination = null;

if (isset($_GET['id_destination'])) {

    $idDestination = intval($_GET['id_destination']);

    $stmt = $pdo->prepare("
        SELECT * FROM destinations 
        WHERE id_destination = ? AND id_utilisateur = ?
    ");
    $stmt->execute([$idDestination, $_SESSION['id_utilisateur']]);
    $destination = $stmt->fetch();
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<title><?= $destination ? "Modifier une destination" : "Ajouter une destination" ?></title>

<style>
body {
    font-family: Poppins, sans-serif;
    background:#E6F1FF;
    padding:40px;
    display:flex;
    justify-content:center;
}

.form-card {
    width:650px;
    background:white;
    padding:30px;
    border-radius:20px;
    box-shadow:0 5px 20px rgba(0,0,0,0.1);
}

input, select, textarea {
    width:100%;
    padding:12px;
    margin-top:8px;
    border-radius:10px;
    border:1px solid #c9d7e8;
    font-size:15px;
}

label { 
    font-weight:600; 
    margin-top:15px; 
    display:block; 
}

button {
    padding:12px 20px;
    border:none;
    border-radius:12px;
    cursor:pointer;
    font-size:16px;
    transition:0.2s;
}

.btn-add {
    background:#1E4C8A;
    color:white;
}
.btn-add:hover { background:#163A6B; }

.btn-cancel {
    background:#b6b6b6;
}
.btn-cancel:hover { background:#9a9a9a; }

.form-buttons {
    display:flex;
    justify-content:space-between;
    margin-top:30px;
}
select {
    width:100%;
    padding:12px;
    margin-top:8px;
    border-radius:12px;
    border:2px solid #a7b9d0ff;
    background:white;
    font-size:15px;
    appearance:none;
    -webkit-appearance:none;
    -moz-appearance:none;
    background-image:url('data:image/svg+xml;utf8,<svg fill="%231E4C8A" height="20" viewBox="0 0 24 24" width="20" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/></svg>');
    background-repeat:no-repeat;
    background-position:right 12px center;
    background-size:18px;
    transition:0.2s ease;
}

select:hover {
    border-color:#1E4C8A;
}

select:focus {
    outline:none;
    border-color:#1E4C8A;
    box-shadow:0 0 5px rgba(30,76,138,0.3);
}
</style>

</head>
<body>

<div class="form-card">
<h2><?= $destination ? "✏️ Modifier une destination" : "🧭 Ajouter une prochaine destination" ?></h2>

<form action="traitement_destination.php" method="POST">

    <!-- MODE MODIFICATION -->
    <?php if ($destination): ?>
        <input type="hidden" name="id_destination" value="<?= $destination['id_destination'] ?>">
    <?php endif; ?>

    <!-- PAYS -->
    <label>Pays</label>
    <select name="code_pays" required>
        <?php foreach ($pays as $p): ?>
        <option value="<?= $p['code_iso'] ?>"
            <?= $destination && $destination['code_pays'] == $p['code_iso'] ? "selected" : "" ?>>
            <?= $p['nom_pays'] ?>
        </option>
        <?php endforeach; ?>
    </select>

    <!-- VILLES -->
    <label>Villes / Régions</label>
    <input type="text" name="villes" 
           value="<?= $destination['villes'] ?? '' ?>" 
           placeholder="Tokyo, Kyoto...">

    <!-- TYPE DE DATE -->
    <label>Type de date</label>
    <select name="type_date" id="type_date" required>
        <option value="exacte" 
            <?= isset($destination) && !$destination['date_depart_approx'] ? "selected" : "" ?>>
            Date exacte
        </option>

        <option value="approx"
            <?= isset($destination) && $destination['date_depart_approx'] ? "selected" : "" ?>>
            Date approximative
        </option>
    </select>

    <!-- DATE EXACTE -->
    <div id="zone_exacte">
        <label>Date de départ</label>
        <input type="date" name="date_depart" 
            value="<?= $destination['date_depart'] ?? '' ?>">

        <label>Date de retour</label>
        <input type="date" name="date_retour" 
            value="<?= $destination['date_retour'] ?? '' ?>">
    </div>

    <!-- DATE APPROX -->
    <div id="zone_approx" style="display:none; margin-top:10px;">
        <label>Date approximative</label>
        <input type="text" name="date_depart_approx" 
               placeholder="Ex : Mai 2027, Été 2025, 2026-2027..."
               value="<?= $destination['date_depart_approx'] ?? '' ?>">
    </div>

    <!-- BUDGET -->
    <label>Budget estimé</label>
    <select name="budget">
        <option value="">-- Choisir --</option>
        <?php 
            $budgets = ["< 500 €","500 - 1000 €","1000 - 2000 €","> 2000 €"];
            foreach($budgets as $b):
        ?>
        <option value="<?= $b ?>" 
            <?= ($destination && $destination['budget']==$b) ? "selected" : "" ?>>
            <?= $b ?>
        </option>
        <?php endforeach; ?>
    </select>

    <!-- ACTIVITÉS -->
    <label>Activités envisagées</label>
    <textarea name="activites" rows="3"><?= $destination['activites'] ?? '' ?></textarea>

    <!-- HÉBERGEMENT -->
    <label>Hébergement</label>
    <select name="hebergement">
        <?php 
        $hebergements = ["", "Hôtel", "Airbnb", "Auberge de jeunesse", "Camping", "Chez l'habitant"];
        foreach ($hebergements as $h):
        ?>
        <option value="<?= $h ?>" <?= ($destination && $destination['hebergement']==$h) ? "selected" : "" ?>>
            <?= $h ?: "-- Choisir --" ?>
        </option>
        <?php endforeach; ?>
    </select>

    <!-- ACCOMPAGNEMENT -->
    <label>Avec qui ?</label>
    <select name="accompagnement">
        <?php 
        $acco = ["", "Solo", "Couple", "Amis", "Famille", "Groupe"];
        foreach ($acco as $a):
        ?>
        <option value="<?= $a ?>" <?= ($destination && $destination['accompagnement']==$a) ? "selected" : "" ?>>
            <?= $a ?: "-- Choisir --" ?>
        </option>
        <?php endforeach; ?>
    </select>


    <!-- BOUTONS -->
    <div class="form-buttons">
        <a href="profil.php">
            <button type="button" class="btn-cancel">Annuler</button>
        </a>

        <button type="submit" class="btn-add">
            <?= $destination ? "Modifier" : "Ajouter" ?>
        </button>
    </div>
</form>

</div>

<script>
// Toggle date exacte / approx
function toggleDateFields() {
    const type = document.getElementById("type_date").value;

    const exacteZone = document.getElementById("zone_exacte");
    const approxZone = document.getElementById("zone_approx");

    const dateDepart = document.querySelector('input[name="date_depart"]');
    const dateRetour = document.querySelector('input[name="date_retour"]');
    const dateApprox = document.querySelector('input[name="date_depart_approx"]');

    if (type === "exacte") {
        exacteZone.style.display = "block";
        approxZone.style.display = "none";

        dateDepart.disabled = false;
        dateRetour.disabled = false;
        dateApprox.disabled = true;

        dateApprox.value = "";
    }
    else {
        exacteZone.style.display = "none";
        approxZone.style.display = "block";

        dateDepart.disabled = true;
        dateRetour.disabled = true;
        dateApprox.disabled = false;

        dateDepart.value = "";
        dateRetour.value = "";
    }
}

document.getElementById("type_date").addEventListener("change", toggleDateFields);
toggleDateFields();
</script>

</body>
</html>

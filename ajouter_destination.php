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

// 🔥 Détection mode modification
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
<title>Ajouter une destination</title>

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
</style>

</head>
<body>

<div class="form-card">
<h2><?= $destination ? "✏️ Modifier une destination" : "🧭 Ajouter une prochaine destination" ?></h2>

<form action="traitement_destination.php" method="POST">

    <!-- MODE MODIFICATION : ID HIDDEN -->
    <?php if ($destination): ?>
        <input type="hidden" name="id_destination" value="<?= $destination['id_destination'] ?>">
    <?php endif; ?>

    <label>Pays</label>
    <select name="code_pays" required>
        <?php foreach ($pays as $p): ?>
        <option value="<?= $p['code_iso'] ?>"
            <?= $destination && $destination['code_pays'] == $p['code_iso'] ? "selected" : "" ?>>
            <?= $p['nom_pays'] ?>
        </option>
        <?php endforeach; ?>
    </select>

    <label>Villes / Régions</label>
    <input type="text" name="villes" 
           value="<?= $destination['villes'] ?? '' ?>" 
           placeholder="Tokyo, Kyoto...">

    <label>Date de départ</label>
    <input type="date" name="date_depart" value="<?= $destination['date_depart'] ?? '' ?>">

    <label>Date de retour</label>
    <input type="date" name="date_retour" value="<?= $destination['date_retour'] ?? '' ?>">

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

    <label>Activités envisagées</label>
    <textarea name="activites" rows="3"><?= $destination['activites'] ?? '' ?></textarea>

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

    <label>Priorité</label>
    <select name="priorite">
        <?php 
        $prio = ["", "Faible", "Moyenne", "Haute"];
        foreach ($prio as $p):
        ?>
        <option value="<?= $p ?>" <?= ($destination && $destination['priorite']==$p) ? "selected" : "" ?>>
            <?= $p ?: "-- Choisir --" ?>
        </option>
        <?php endforeach; ?>
    </select>

    <div class="form-buttons">

        <!-- Bouton Annuler -->
        <a href="profil.php">
            <button type="button" class="btn-cancel">Annuler</button>
        </a>

        <!-- Bouton Ajouter / Modifier -->
        <button type="submit" class="btn-add">
            <?= $destination ? "Modifier" : "Ajouter" ?>
        </button>

    </div>
</form>

</div>

<script>
// Bloquer date retour < date départ
document.addEventListener("DOMContentLoaded", function() {
    const depart = document.querySelector('input[name="date_depart"]');
    const retour = document.querySelector('input[name="date_retour"]');

    depart.addEventListener('change', () => retour.min = depart.value);

    retour.addEventListener('change', () => {
        if (retour.value < depart.value) {
            alert("La date de retour ne peut pas être avant la date de départ.");
            retour.value = depart.value;
        }
    });
});
</script>

</body>
</html>

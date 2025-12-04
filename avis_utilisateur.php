<?php
session_start();
if (!isset($_SESSION['id_utilisateur'])) {
    header("Location: login.php");
    exit();
}

try {
    $pdo = new PDO("mysql:host=localhost;dbname=happytrip;charset=utf8","root","root",[
        PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION
    ]);
} catch (PDOException $e) { die($e->getMessage()); }

$id = $_SESSION['id_utilisateur'];
$order = $_GET['tri'] ?? "date_desc";

switch($order){
    case "date_asc":  $sqlOrder = "ORDER BY a.date_avis ASC"; break;
    case "note_asc":  $sqlOrder = "ORDER BY a.note ASC"; break;
    case "note_desc": $sqlOrder = "ORDER BY a.note DESC"; break;
    default:          $sqlOrder = "ORDER BY a.date_avis DESC"; break;
}

$avis = $pdo->query("
    SELECT a.*, p.nom_pays 
    FROM avis a 
    JOIN pays p ON p.code_iso = a.code_pays
    WHERE a.id_utilisateur = $id
    $sqlOrder
")->fetchAll();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<title>Mes avis</title>
<link rel="stylesheet" href="style_avis.css">
</head>
<body>

<div class="container">
    <h1>📝 Mes avis</h1>

    <div class="tri-bar">
        <form method="GET">
            <select name="tri" onchange="this.form.submit()">
                <option value="date_desc" <?= $order=="date_desc"?"selected":"" ?>>Plus récent → plus ancien</option>
                <option value="date_asc"  <?= $order=="date_asc"?"selected":"" ?>>Plus ancien → plus récent</option>
                <option value="note_desc" <?= $order=="note_desc"?"selected":"" ?>>Note décroissante ★★★★★ → ★</option>
                <option value="note_asc"  <?= $order=="note_asc"?"selected":"" ?>>Note croissante ★ → ★★★★★</option>
            </select>
        </form>
    </div>

    <div class="avis-list">
        <?php if(!$avis): ?>
            <p>Aucun avis pour le moment.</p>
        <?php else: ?>
            <?php foreach($avis as $a): ?>
                <div class="avis-card">
                    <h3><?= htmlspecialchars($a['nom_pays']) ?></h3>

                    <div class="stars">
                        <?php for($i=1;$i<=5;$i++): ?>
                            <img src="images/<?= $i <= $a['note'] ? 'etoile_remplie.svg' : 'etoile_vide.svg' ?>" class="star-small">
                        <?php endfor; ?>
                    </div>

                    <p class="date"><?= date("d/m/Y", strtotime($a['date_avis'])) ?></p>

                    <?php if(!empty($a['commentaire'])): ?>
                    <p class="comment"><?= nl2br(htmlspecialchars($a['commentaire'])) ?></p>
                    <?php endif; ?>

                    <button class="btn-delete" data-pays="<?= $a['code_pays'] ?>">Supprimer</button>
                </div>
            <?php endforeach; ?>
        <?php endif; ?>
    </div>

    <a class="btn-retour" href="profil.php">⬅ Retour au profil</a>
</div>

<script src="avis.js"></script>

</body>
</html>
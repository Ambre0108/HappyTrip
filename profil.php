<?php
session_start();

// Vérification si l'utilisateur est connecté
if (!isset($_SESSION['id_utilisateur'])) {
    header("Location: login.php");
    exit();
}

// Connexion PDO à MySQL (MAMP)
try {
    $pdo = new PDO(
        "mysql:host=localhost;dbname=happytrip;charset=utf8",
        "root",  // utilisateur MySQL
        "root",  // mot de passe MAMP
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        ]
    );
} catch (PDOException $e) {
    die("Erreur connexion BDD : " . $e->getMessage());
}

// Récupérer les infos utilisateur
$stmt = $pdo->prepare("SELECT nom, email FROM utilisateur WHERE id_utilisateur = ?");
$stmt->execute([$_SESSION['id_utilisateur']]);
$user = $stmt->fetch();

// Récupérer les Tops (avis les mieux notés)
$tops = $pdo->prepare("
    SELECT code_pays, commentaire, note, date_avis
    FROM avis
    WHERE id_utilisateur = ?
    ORDER BY note DESC
");
$tops->execute([$_SESSION['id_utilisateur']]);
$tops = $tops->fetchAll();

// Récupérer les Flops (avis les moins notés)
$flops = $pdo->prepare("
    SELECT code_pays, commentaire, note, date_avis
    FROM avis
    WHERE id_utilisateur = ?
    ORDER BY note ASC
");
$flops->execute([$_SESSION['id_utilisateur']]);
$flops = $flops->fetchAll();

?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Profil utilisateur</title>
    <style>
        body { font-family: Arial; background:#f2f2f2; padding:40px; }
        .card { background:white; padding:20px; border-radius:12px; margin-bottom:25px; box-shadow:0 3px 8px rgba(0,0,0,0.1); max-width:600px; margin:auto; }
        .profil-header { text-align:center; margin-bottom:20px; }
        .profil-header img { width:100px; height:100px; margin-bottom:10px; }
        .avis-item { background:#fafafa; padding:10px; border-radius:8px; margin-bottom:10px; }
        .date { color:#777; font-size:13px; }
        h3 { margin-top:0; }
    </style>
</head>
<body>

<!-- Profil utilisateur -->
<div class="card profil-header">
    <img src="images/avatar_noir.svg" alt="Avatar">
    <p><strong>Nom :</strong> <?= htmlspecialchars($user['nom']) ?></p>
    <p><strong>Email :</strong> <?= htmlspecialchars($user['email']) ?></p>
</div>

<!-- Tops -->
<div class="card">
    <h3>⭐ Mes Tops</h3>
    <?php if (!$tops): ?>
        <p>Aucun avis pour le moment.</p>
    <?php else: ?>
        <?php foreach ($tops as $t): ?>
            <div class="avis-item">
                <strong>Pays :</strong> <?= htmlspecialchars($t['code_pays']) ?><br>
                <strong>Note :</strong> <?= $t['note'] ?>/5
                <p><?= nl2br(htmlspecialchars($t['commentaire'])) ?></p>
                <div class="date">Avis du <?= date("d/m/Y", strtotime($t['date_avis'])) ?></div>
            </div>
        <?php endforeach; ?>
    <?php endif; ?>
</div>

<!-- Flops -->
<div class="card">
    <h3>👎 Mes Flops</h3>
    <?php if (!$flops): ?>
        <p>Aucun avis pour le moment.</p>
    <?php else: ?>
        <?php foreach ($flops as $f): ?>
            <div class="avis-item">
                <strong>Pays :</strong> <?= htmlspecialchars($f['code_pays']) ?><br>
                <strong>Note :</strong> <?= $f['note'] ?>/5
                <p><?= nl2br(htmlspecialchars($f['commentaire'])) ?></p>
                <div class="date">Avis du <?= date("d/m/Y", strtotime($f['date_avis'])) ?></div>
            </div>
        <?php endforeach; ?>
    <?php endif; ?>
</div>

</body>
</html>
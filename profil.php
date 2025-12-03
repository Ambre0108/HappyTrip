<?php
session_start();
if (!isset($_SESSION['id_utilisateur'])) {
    header("Location: login.php");
    exit();
}

try {
    $pdo = new PDO(
        "mysql:host=localhost;dbname=happytrip;charset=utf8mb4",
        "root", "root",
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC]
    );
    $pdo->exec("SET NAMES utf8mb4");
} catch (PDOException $e) {
    die("Erreur de connexion : " . $e->getMessage());
}

function afficherEtoiles($note) {
    $html = "";
    for ($i = 1; $i <= 5; $i++) {
        $html .= '<img src="images/' . ($i <= $note ? "etoile_remplie" : "etoile_vide") . '.svg" class="etoile">';
    }
    return $html;
}

// Récupération info utilisateur
$user = $pdo->prepare("SELECT id_utilisateur, nom, email FROM utilisateur WHERE id_utilisateur = ?");
$user->execute([$_SESSION['id_utilisateur']]);
$user = $user->fetch();

// avis tops
$tops = $pdo->prepare("SELECT p.nom_pays, a.commentaire, a.note, a.date_avis
    FROM avis a
    JOIN pays p ON p.code_iso = a.code_pays
    WHERE a.id_utilisateur = ? AND a.note >= 4
    ORDER BY a.note DESC, a.date_avis DESC LIMIT 3");
$tops->execute([$_SESSION['id_utilisateur']]);
$tops = $tops->fetchAll();

// avis flops
$flops = $pdo->prepare("SELECT p.nom_pays, a.commentaire, a.note, a.date_avis
    FROM avis a
    JOIN pays p ON p.code_iso = a.code_pays
    WHERE a.id_utilisateur = ? AND a.note <= 2
    ORDER BY a.note ASC, a.date_avis DESC LIMIT 3");
$flops->execute([$_SESSION['id_utilisateur']]);
$flops = $flops->fetchAll();

// Destinations
$destinations = $pdo->prepare("
    SELECT d.*, p.nom_pays 
    FROM destinations d
    JOIN pays p ON p.code_iso = d.code_pays
    WHERE d.id_utilisateur = ?
    ORDER BY d.date_creation DESC
");
$destinations->execute([$_SESSION['id_utilisateur']]);
$destinations = $destinations->fetchAll();

$nbDestinations = count($destinations);

// Nombre pays visités
$nbPaysVisit = $pdo->prepare("SELECT COUNT(DISTINCT code_pays) FROM avis WHERE id_utilisateur = ?");
$nbPaysVisit->execute([$_SESSION['id_utilisateur']]);
$nbPaysVisit = $nbPaysVisit->fetchColumn();

// Tous les avis
$allAvis = $pdo->prepare("
    SELECT p.nom_pays, a.code_pays, a.commentaire, a.note, a.date_avis
    FROM avis a
    JOIN pays p ON p.code_iso = a.code_pays
    WHERE a.id_utilisateur = ?
    ORDER BY a.date_avis DESC
");
$allAvis->execute([$_SESSION['id_utilisateur']]);
$allAvis = $allAvis->fetchAll();

?>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<title>Profil utilisateur</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

<style>
body {
    font-family:'Poppins',sans-serif;
    background:#E6F1FF;
    margin:0; padding:20px;
    display:flex; justify-content:center;
}
.container { width:900px; display:flex; flex-direction:column; gap:15px; }

.profile-header {
    background:white;
    padding:20px;
    text-align:center;
    border-radius:20px;
    box-shadow:0 3px 8px rgba(0,0,0,0.1);
    display:flex; flex-direction:column; align-items:center;
}
.avatar {
    width:100px; height:100px;
    background:#1E4C8A;
    mask:url('images/avatar_noir.svg') center/cover no-repeat;
}

.stats {
    display:flex;
    justify-content:center;
    gap:20px;
    font-size:14px;
    color:#333;
    margin-top:5px;
}

.sections {
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:15px;
}

.section {
    background:white;
    padding:15px;
    border-radius:15px;
    box-shadow:0 2px 6px rgba(0,0,0,0.08);
    font-size:14px;
}

.section-green { border-left:5px solid #38A169; }
.section-red { border-left:5px solid #E53E3E; }
.section-orange { border-left:5px solid #ED8936; }
.section-blue { border-left:5px solid #1E5FA1; }

.etoile { width:14px; }

.avis-item {
    background:#e3f4ff;
    border-radius:10px;
    padding:12px;
    margin-bottom:10px;
}

.avis-footer {
    display:flex;
    justify-content:space-between;
    margin-top:8px;
    align-items:center;
}

/* 🔵 STYLE DESTINATION — OPTION A */
.dest-card {
    background:#e3f4ff;
    border-radius:12px;
    padding:15px;
    margin-bottom:15px;
    box-shadow:0 2px 5px rgba(0,0,0,0.1);
    display:flex;
    flex-direction:column;
    gap:6px;
    position:relative;
}

/* Boutons destinés alignés en bas à droite */
.dest-actions {
    display:flex;
    justify-content:flex-end;
    gap:10px;
    margin-top:10px;
}

/* Boutons généraux */
.btn {
    padding:6px 12px;
    border:none;
    border-radius:6px;
    cursor:pointer;
    color:white;
    font-size:13px;
    transition:0.2s;
}

.btn-delete { background:#E53E3E; }
.btn-delete:hover { background:#C53030; }

.btn-complete { background:#38A169; }
.btn-complete:hover { background:#2F855A; }

/* Bouton ajouter une destination */
.btn-add-link { text-decoration:none; }
.btn-add {
    background:#1E5FA1;
    color:white;
    padding:10px 20px;
    border-radius:12px;
    font-size:16px;
    display:flex;
    align-items:center;
    gap:10px;
    border:none;
    cursor:pointer;
    box-shadow:0 2px 6px rgba(0,0,0,0.15);
}
.btn-add:hover { background:#174A7C; }

/* Sélecteur de tri */
.sort-select {
    margin-bottom:15px;
    padding:12px;
    border-radius:12px;
    border:1px solid #c9d7e8;
    font-size:15px;
}

.hidden-avis { display:none; }

/* boutton voir plus */
.btn-see-all {
    background:#1E5FA1;
    color:white;
    padding:10px 18px;
    border-radius:10px;
    font-size:15px;
    border:none;
    cursor:pointer;
    display:block;
    margin:15px auto;
}
.btn-see-all:hover { background:#174A7C; }
select {
    width:100%;
    padding:12px;
    margin-top:8px;
    border-radius:12px;
    border:1px solid #c9d7e8;
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

.btn-delete-avis {
    appearance:none;
    -webkit-appearance:none;
    -moz-appearance:none;
    box-shadow:none !important;
    border:none;
}
.btn-edit {
    background:#ED8936;       /* Orange comme demandé */
    color:white;
    padding:6px 12px;
    border:none;
    border-radius:6px;
    cursor:pointer;
    font-size:13px;
    transition:0.2s;
}
.btn-edit:hover {
    background:#DD6B20;
}



</style>
</head>
<body>

<div class="container">

<!-- HEADER -->
<div class="profile-header">
    <div class="avatar"></div>
    <h2><?= htmlspecialchars($user['nom']) ?></h2>
    <p><?= htmlspecialchars($user['email']) ?></p>

    <div class="stats">
        <span><strong>🌍 Pays visités : <?= $nbPaysVisit ?></strong></span>
        <span><strong>🧭 Destination(s) prévue(s) : <?= $nbDestinations ?></strong></span>
    </div>
</div>

<div class="sections">

<!-- TOPS -->
<div class="section section-green">
    <h3>⭐ Tops</h3>
    <?php if(!$tops): ?><p>Aucun avis</p>
    <?php else: foreach($tops as $t): ?>
        <div class="avis-item">
            <strong><?= $t['nom_pays'] ?></strong><br>
            <?= afficherEtoiles($t['note']) ?>
            <p><?= nl2br(htmlspecialchars($t['commentaire'])) ?></p>
            <small><?= date("d/m/Y", strtotime($t['date_avis'])) ?></small>
        </div>
    <?php endforeach; endif; ?>
</div>

<!-- FLOPS -->
<div class="section section-red">
    <h3>👎 Flops</h3>
    <?php if(!$flops): ?><p>Aucun avis</p>
    <?php else: foreach($flops as $f): ?>
        <div class="avis-item">
            <strong><?= $f['nom_pays'] ?></strong><br>
            <?= afficherEtoiles($f['note']) ?>
            <p><?= nl2br(htmlspecialchars($f['commentaire'])) ?></p>
            <small><?= date("d/m/Y", strtotime($f['date_avis'])) ?></small>
        </div>
    <?php endforeach; endif; ?>
</div>

<!-- PROCHAINES DESTINATIONS — OPTION A -->
<div class="section section-orange" style="grid-column:span 2;">
    <h3>🧭 Mes prochaines destinations</h3>

    <?php if(!$destinations): ?>
        <p>Aucune destination</p>

    <?php else: foreach($destinations as $d): ?>
        <div class="dest-card">

            <strong><?= $d['nom_pays'] ?></strong>

            <?php if($d['villes']): ?>🌆 <em><?= $d['villes'] ?></em><br><?php endif; ?>

            <?php if($d['date_depart']): ?>
                📅 Du <?= date("d/m/Y", strtotime($d['date_depart'])) ?>
                au <?= date("d/m/Y", strtotime($d['date_retour'])) ?><br>
            <?php endif; ?>

            <?php if($d['activites']): ?>🗺️ Activités : <?= nl2br(htmlspecialchars($d['activites'])) ?><br><?php endif; ?>
            <?php if($d['budget']): ?>💰 Budget : <?= htmlspecialchars($d['budget']) ?> €<?php endif; ?>

            <div class="dest-actions">

                <!-- Bouton Modifier -->
                <a href="ajouter_destination.php?id_destination=<?= $d['id_destination'] ?>">
                    <button class="btn btn-edit">Modifier</button>
                </a>

                <!-- Supprimer -->
                <form action="supprimer_destination.php" method="POST" onsubmit="return confirm('Supprimer cette destination ?')">
                    <input type="hidden" name="id_destination" value="<?= $d['id_destination'] ?>">
                    <button class="btn btn-delete">Supprimer</button>
                </form>

                <!-- Voyage effectué -->
                <button class="btn btn-complete" onclick="ouvrirPopupAvis('<?= $d['code_pays'] ?>','<?= $d['nom_pays'] ?>')">
                    ✓ Voyage effectué
                </button>

            </div>

        </div>
    <?php endforeach; endif; ?>

    <!-- Bouton ajouter destination centré -->
    <div style="text-align:center; margin-top:20px;">
        <a href="ajouter_destination.php" class="btn-add-link">
            <button class="btn-add">
                <img src="images/plus_blanc.svg" width="18">
                Ajouter une destination
            </button>
        </a>
    </div>

</div>

<!-- AVIS -->
<div class="section section-blue" style="grid-column:span 2;">
    <h3>📝 Voir mes avis</h3>

    <label>Trier par :</label>
    <select id="sortAvis" class="sort-select">
        <option value="date_desc">Les plus récents</option>
        <option value="date_asc">Les plus anciens</option>
        <option value="note_desc">Note décroissante</option>
        <option value="note_asc">Note croissante</option>
    </select>

    <div id="avisList">
        <?php if(!$allAvis): ?>
            <p>Aucun avis enregistré</p>
        <?php else:
            $count = 0;
            foreach($allAvis as $a):
                $count++;
                $hidden = $count > 3 ? "hidden-avis" : "";
        ?>
            <div class="avis-item <?= $hidden ?>" data-date="<?= strtotime($a['date_avis']) ?>" data-note="<?= $a['note'] ?>">
                <strong><?= $a['nom_pays'] ?></strong><br>
                <?= afficherEtoiles($a['note']) ?>
                <p><?= nl2br(htmlspecialchars($a['commentaire'])) ?></p>
                <div class="avis-footer">
                    <small><?= date("d/m/Y", strtotime($a['date_avis'])) ?></small>
                    <button class="btn-delete btn-delete-avis" data-pays="<?= $a['code_pays'] ?>">Supprimer</button>
                </div>
            </div>
        <?php endforeach; endif; ?>

        <?php if(count($allAvis) > 3): ?>
            <button id="voirPlus" class="btn-see-all">Voir tous les avis</button>
            <button id="voirMoins" class="btn-see-all" style="display:none;">Réduire</button>
        <?php endif; ?>

    </div>
</div>

</div>
</div>

<script>
// tri avis
document.getElementById("sortAvis").addEventListener("change", function() {
    let list = document.getElementById("avisList");
    let avis = Array.from(list.getElementsByClassName("avis-item"));

    avis.sort((a, b) => {
        let mode = document.getElementById("sortAvis").value;
        if (mode === "date_desc") return b.dataset.date - a.dataset.date;
        if (mode === "date_asc") return a.dataset.date - b.dataset.date;
        if (mode === "note_desc") return b.dataset.note - a.dataset.note;
        if (mode === "note_asc") return a.dataset.note - b.dataset.note;
    });

    avis.forEach(el => list.insertBefore(el, list.firstChild));
});

// suppression avis
document.querySelectorAll(".btn-delete-avis").forEach(btn => {
    btn.addEventListener("click", () => {
        if (!confirm("Supprimer cet avis ?")) return;

        let form = new FormData();
        form.append("code_pays", btn.dataset.pays);

        fetch("delete_avis.php", { method:"POST", body:form })
            .then(r => r.text())
            .then(res => {
                if (res === "ok") location.reload();
                else alert(res);
            });
    });
});

// voir plus / voir moins
let voirPlus = document.getElementById("voirPlus");
let voirMoins = document.getElementById("voirMoins");

if (voirPlus) {
    voirPlus.addEventListener("click", () => {
        document.querySelectorAll(".hidden-avis").forEach(el => el.style.display = "block");
        voirPlus.style.display = "none";
        voirMoins.style.display = "block";
    });
}

if (voirMoins) {
    voirMoins.addEventListener("click", () => {
        document.querySelectorAll(".hidden-avis").forEach(el => el.style.display = "none");
        voirMoins.style.display = "none";
        voirPlus.style.display = "block";
    });
}
</script>

</body>
</html>
<?php
session_start();
$nom = $_SESSION['nom'] ?? null;
?>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>HappyTrip - Accueil</title>
  <link rel="stylesheet" href="style.css" />

  <style>
      /* --- BANNIÈRE MODERNE ET CENTRÉE --- */
      .top-banner {
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          padding: 20px 0;
          background: linear-gradient(90deg, #8c6239, #c69c6d);
          color: white;
          text-align: center;
          backdrop-filter: blur(8px);
          box-shadow: 0 4px 12px rgba(0,0,0,0.25);
          z-index: 9999;
      }

      .banner-center {
          max-width: 100%;
      }

      .top-banner h1 {
          margin: 0;
          font-size: 26px;
          font-weight: 700;
      }

      /* Nom de l'utilisateur sous le titre */
      .username {
          margin: 6px 0 0 0;
          font-size: 18px;
          font-weight: 600;
          opacity: 0.95;
      }

      .top-banner p {
          margin: 4px 0 0;
          font-size: 15px;
          opacity: 0.95;
      }

      /* --- PROFIL + DÉCONNEXION À DROITE --- */
      .banner-actions {
          position: absolute;
          right: 25px;
          top: 50%;
          transform: translateY(-50%);
          
          display: flex !important;
          flex-direction: row;
          align-items: center;
          gap: 30px !important;
      }

      .profile-icon {
          font-size: 26px;
          text-decoration: none;
          color: white;
      }

      .icon-img {
          width: 40px;     /* Taille parfaite */
          height: 40px;
          object-fit: contain;
          display: block;
          filter: brightness(0) invert(1); /* rend l'icône blanche si elle ne l'est pas */
          transition: 0.25s;
      }

      .icon-img:hover {
        transform: scale(1.12);
        opacity: 0.85;
      }

      .logout-btn {
          text-decoration: none;
          color: white;
          background: #d9534f;
          padding: 8px 14px;
          border-radius: 10px;
          font-weight: 600;
          transition: 0.25s;
      }

      .logout-btn:hover {
          background: #b52b27;
      }
        /* Bouton avec tooltip */
      .icon-btn {
          position: relative;
      }

/* Tooltip en dessous */
      .icon-btn::after {
          content: attr(data-tooltip);
          position: absolute;
          top: 120%;            /* 🔥 Bas de l'icône */
          left: 50%;
          transform: translateX(-50%);
          font-size: 14px;
          color: white;         /* 🔥 Texte blanc visible */
          opacity: 0;
          transition: 0.25s;
          pointer-events: none;
      }

/* Apparition au survol */
        .icon-btn:hover::after {
            opacity: 1;
        }


  .icon-btn:hover::after,
  .icon-btn:hover::before {
      opacity: 1;
  }

      /* Décaler ton overlay pour laisser la place à la bannière */
      body.accueil .overlay {
          margin-top: 170px !important;
      }
  </style>
</head>

<body class="accueil">

  <!-- 🔵 BANNIÈRE HAUT DE PAGE -->
  <div class="top-banner">

      <!-- Texte centré -->
      <div class="banner-center">
          <h1>Bienvenue sur HappyTrip !!</h1>

          <?php if ($nom): ?>
              <div class="username">
                  <?= htmlspecialchars($nom); ?>
              </div>
          <?php endif; ?>

          <?php if (!$nom): ?>
              <p>N'hésitez pas à vous connecter pour profiter de toutes les options</p>
          <?php endif; ?>
      </div>

      <!-- Zone droite si utilisateur connecté -->
      <?php if ($nom): ?>
      <div class="banner-actions">
          <a href="profil.php" class="icon-btn" data-tooltip="Profil">
              <img src="images/avatar.svg" class="icon-img" alt="Profil">
          </a>

          <a href="logout.php" class="icon-btn" data-tooltip="Déconnexion">
              <img src="images/disconnect.svg" class="icon-img" alt="Déconnexion">
          </a>

      </div>
      <?php endif; ?>

  </div>


  <!-- 🎨 CONTENU DE TA PAGE D'ACCUEIL (inchangé) -->
  <div class="overlay">
    <h1>HappyTrip, l’agence de voyage qui vous<br>rendra heureux !!</h1>

    <div class="boutons">
      <div class="colonne">
        <a href="presentation.html" class="btn">C’est quoi HappyTrip ?</a>
        <a href="login.html" class="btn">Connexion</a>
      </div>

      <div class="colonne">
        <a href="carte.html" class="btn">Découvrir la carte 🌍</a>
        <a href="accueil_quiz.html" class="btn">Quiz 🎯</a>
      </div>
    </div>
  </div>

</body>
</html>

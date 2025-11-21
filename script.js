// --- Données pour chaque pays qu'on veut rendre cliquable ---
const COUNTRY_DATA = {
  FR: {
    nom: "France",
    rang: "29ᵉ",
    score: "6.66",
    pib: "≈ 39 300 €/an",
    touristes: "117,1 M (2020)",
    revenus: "≈ 71,3 Md€ (2024)",
    desc: "Art de vivre, patrimoine et diversité des paysages : la France allie bien-être et richesse culturelle."
  },
  AU: {
    nom: "Australie",
    rang: "10ᵉ",
    score: "7.16",
    pib: "≈ 41 300 €/an",
    touristes: "9,47 M (2020)",
    revenus: "≈ 45,6 Md€ (2024)",
    desc: "Grands espaces, plages et douceur de vivre : un équilibre entre aventure et sérénité."
  },
  US: {
    nom: "États-Unis",
    rang: "23ᵉ",
    score: "6.89",
    pib: "≈ 46 500 €/an",
    touristes: "79,4 M (2020)",
    revenus: "≈ 210,9 Md€ (2024)",
    desc: "Diversité extrême de paysages et de cultures : une énergie unique, symbole de liberté."
  },
  BO: {
    nom: "Bolivie",
    rang: "69ᵉ",
    score: "5.66",
    pib: "≈ 23 000 €/an",
    touristes: "1,24 M (2020)",
    revenus: "≈ 0,67 Md€ (2024)",
    desc: "Authenticité andine, paysages d’altitude et traditions fortes : un voyage humain et dépaysant."
  }
};

// --- Panneau d'informations ---
const panel = document.getElementById("infoPanel");
const backdrop = document.getElementById("backdrop");
const closeBtn = document.getElementById("closePanel");

function openPanel(data) {
  document.getElementById("pays").textContent = data.nom;
  document.getElementById("rang").textContent = data.rang;
  document.getElementById("score").textContent = data.score;
  document.getElementById("pib").textContent = data.pib;
  document.getElementById("touristes").textContent = data.touristes;
  document.getElementById("revenus").textContent = data.revenus;
  document.getElementById("desc").textContent = data.desc;

  panel.classList.remove("hidden");
  backdrop.classList.remove("hidden");
}

function closePanel() {
  panel.classList.add("hidden");
  backdrop.classList.add("hidden");
}

if (closeBtn) closeBtn.addEventListener("click", closePanel);
if (backdrop) backdrop.addEventListener("click", closePanel);
document.addEventListener("keydown", (e) => {
  if (e.key === "Escape") closePanel();
});

// --- Gestion de la carte SVG ---
const obj = document.getElementById("worldMap");

if (!obj) {
  console.error("⚠️ Élément #worldMap introuvable dans la page.");
} else {
  obj.addEventListener("load", () => {
    const svgDoc = obj.contentDocument;

    if (!svgDoc) {
      console.error("⚠️ Impossible d'accéder au contenu de world.svg. Vérifie le chemin data=\"images/world.svg\".");
      return;
    }

    const svg = svgDoc.querySelector("svg");
    if (!svg) {
      console.error("⚠️ Balise <svg> introuvable dans world.svg.");
      return;
    }

    // Tous les pays deviennent 'cliquables'
    svg.querySelectorAll("path, g").forEach((el) => el.classList.add("country"));

    // On branche nos 4 pays d'intérêt
    ["FR", "AU", "US", "BO"].forEach((id) => {
      const el = svg.getElementById(id);
      if (!el) {
        console.warn(`⚠️ Pays avec id="${id}" introuvable dans le SVG.`);
        return;
      }

      el.style.cursor = "pointer";
      el.style.fill = "#0E3772";

      el.addEventListener("click", () => {
        console.log("Pays cliqué :", id);
        openPanel(COUNTRY_DATA[id]);
      });
    });

    // Effet de survol
    svg.addEventListener("mouseover", (e) => {
      if (e.target.classList.contains("country")) {
        e.target.style.filter = "brightness(1.15)";
      }
    });

    svg.addEventListener("mouseout", (e) => {
      if (e.target.classList.contains("country")) {
        e.target.style.filter = "";
      }
    });

    console.log("✅ SVG chargé et listeners installés.");
  });
}
window.addEventListener("load", () => {
    const map = document.getElementById("worldMap");

    map.addEventListener("load", () => {
        const svgDoc = map.contentDocument;
        const countries = svgDoc.querySelectorAll("path, g");

        countries.forEach(country => {
            country.addEventListener("click", () => {
                const code = country.id;  // exemple : FR, MX, AR
                if (code) {
                    window.location.href = "pays.php?code=" + code;
                }
            });
        });
    });
});


function timeAgo(dateString) {
    let date = new Date(dateString);
    let now = new Date();
    let seconds = Math.floor((now - date) / 1000);

    if (seconds < 60) return "il y a quelques secondes";
    let minutes = Math.floor(seconds / 60);
    if (minutes < 60) return `il y a ${minutes} min`;

    let hours = Math.floor(minutes / 60);
    if (hours < 24) return `il y a ${hours} h`;

    let days = Math.floor(hours / 24);
    if (days < 30) return `il y a ${days} jours`;

    let months = Math.floor(days / 30);
    if (months < 12) return `il y a ${months} mois`;

    let years = Math.floor(months / 12);
    return `il y a ${years} ans`;
}

// Conversion ID SVG → codes BD
const SVG_TO_DB = {
    US: "USA",
    FR: "FRA",
    CA: "CAN",
    MX: "MEX",
    PL: "POL",
    ES: "ESP",
    IT: "ITA",
    DE: "DEU",
    BE: "BEL",
    AU: "AUS",
    BO: "BOL",
    BR: "BRA",
    CN: "CHN",
    IN: "IND"
};

let radarChart = null;

$(document).ready(function () {

    // --- COULEURS DE BASE ---
    $("path").attr("fill", "#D4D4D4");
    $("path").attr("stroke-width", "0.1");
    $("path").attr("stroke", "#000");

    let lastClicked = null;

    // --- CLIC SUR UN PAYS ---
    $("path").click(function () {

        let svgCode = $(this).attr("id");
        let dbCode = SVG_TO_DB[svgCode];

        if (!dbCode) {
            console.warn("Aucun mapping pour :", svgCode);
            return;
        }

        $("path").attr("fill", "#D4D4D4");

        $(this).attr("fill", "#D34426");
        lastClicked = this;

        $.get("getCountry.php?code=" + dbCode, function (data) {

            $("#pays").text(data.nom_pays);
            $("#rang").text(data.rang_bonheur || "—");
            $("#score").text(data.score_bonheur || "—");
            $("#pib").text(data.pib_par_habitant || "—");
            $("#touristes").text(data.nombre_touristes || "—");
            $("#revenus").text(data.revenus_tourisme || "—");
            $("#desc").text(data.description || "Pas de description disponible.");

            chargerAvis(dbCode);
            afficherFormulaireAvis(dbCode);

            $("#infoPanel").removeClass("hidden");
            $("#backdrop").removeClass("hidden");

            $("#btnRadar").off().on("click", function () {
                $("#radarContainer").removeClass("hidden");
                genererRadar(data);
            });
        });
    });

    // --- SURVOL ---
    $("path").mouseover(function () {
        if (this !== lastClicked) {
            $(this).attr("fill", "#2029BF");
        }
    });

    $("path").mouseout(function () {
        if (this !== lastClicked) {
            $(this).attr("fill", "#D4D4D4");
        }
    });

    // --- FERMER PANEL ---
    $("#closePanel").click(function () {
        $("#infoPanel").addClass("hidden");
        $("#backdrop").addClass("hidden");

        if (lastClicked) {
            $(lastClicked).attr("fill", "#D4D4D4");
            lastClicked = null;
        }
    });

    // ============================================
    //             CHARGER LES AVIS
    // ============================================
    function chargerAvis(codePays) {

    fetch("get_avis.php?pays=" + codePays)
        .then(r => r.json())
        .then(data => {

            const container = document.getElementById("avis-container");
            container.innerHTML = "";

            // --- Affichage moyenne + count ---
            if (data.count === 0) {
                container.innerHTML = "<p>Aucun avis pour ce pays pour l’instant.</p>";
            } else {
                container.innerHTML = `
                    <div class="avis-stats-box">
                        <strong>${data.count} avis - ${data.moyenne}/5</strong>
                        <img src="images/etoile_remplie.svg" class="star-mini">
                    </div>
                `;
            }

            // Si aucun avis → stop
            if (data.count === 0) return;

            // Afficher les avis
            data.avis.forEach(avis => {

                let starsHTML = "";
                for (let i = 1; i <= 5; i++) {
                    starsHTML += `
                        <img src="images/${i <= avis.note ? "etoile_remplie.svg" : "etoile_vide.svg"}">
                    `;
                }

                container.innerHTML += `
                    <div class="avis">
                        <div class="avis-header">
                            <strong>${avis.nom}</strong>
                            <span class="stars-display">${starsHTML}</span>
                        </div>
                        <p>${avis.commentaire}</p>
                        <small>${timeAgo(avis.date_avis)}</small>
                    </div>
                `;
            });
        });
}



    // ============================================
    //        AFFICHAGE FORMULAIRE + UPDATE
    // ============================================
    // ============================================
//        AFFICHAGE FORMULAIRE + UPDATE + DELETE
// ============================================
function afficherFormulaireAvis(codePays) {

    fetch("check_session.php")
        .then(r => r.text())
        .then(logged => {

            const zoneForm = document.getElementById("avis-form-container");

            if (logged === "0") {
                zoneForm.innerHTML = `
                    <p><a href="login.html">Connectez-vous</a> pour écrire un avis.</p>
                `;
                return;
            }

            // Vérifier si l'utilisateur a DÉJÀ un avis
            fetch("get_user_avis.php?pays=" + codePays)
                .then(r => r.json())
                .then(info => {

                    let deja = info.exists;
                    let ancienAvis = info.data;

                    zoneForm.innerHTML = `
                        <button id="btn-rediger-avis" style="
                            margin-top: 10px;
                            background:#1e5fa1;
                            color:white;
                            padding:8px 14px;
                            border:none;
                            border-radius:8px;
                            cursor:pointer;
                        ">${deja ? "✏️ Modifier mon avis" : "✍️ Rédiger un avis"}</button>

                        <div id="formulaire-avis" style="display:none; margin-top:10px;">
                            <h4>${deja ? "Modifier votre avis" : "Laisser un avis"}</h4>

                            ${deja ? `
                                <button id="btn-supprimer-avis" class="btn-supprimer-avis">
                                    Supprimer mon avis
                                </button>
                            ` : ""}

                            <div class="stars-input" id="input-stars">
                                <img data-value="1" src="images/etoile_vide.svg">
                                <img data-value="2" src="images/etoile_vide.svg">
                                <img data-value="3" src="images/etoile_vide.svg">
                                <img data-value="4" src="images/etoile_vide.svg">
                                <img data-value="5" src="images/etoile_vide.svg">
                            </div>

                            <form id="form-avis">
                                <input type="hidden" name="note" id="note-value" required>
                                <textarea name="commentaire" required placeholder="Votre avis..." style="width:95%; height:80px;">${deja ? ancienAvis.commentaire : ""}</textarea>
                                <input type="hidden" name="code_pays" value="${codePays}">
                                <input type="hidden" name="mode" value="${deja ? "update" : "insert"}">
                                <br>
                                <button type="submit" style="
                                    margin-top: 10px;
                                    background:#1e5fa1;
                                    color:white;
                                    padding:8px 14px;
                                    border:none;
                                    border-radius:8px;
                                    cursor:pointer;
                                ">${deja ? "Mettre à jour" : "Publier"}</button>
                            </form>
                        </div>
                    `;

                    // --- Préselection étoiles ---
                    let stars = document.querySelectorAll("#input-stars img");
                    let noteField = document.getElementById("note-value");
                    let noteInitiale = deja ? ancienAvis.note : 0;

                    noteField.value = noteInitiale;

                    stars.forEach(s => {
                        s.src = (s.dataset.value <= noteInitiale)
                            ? "images/etoile_remplie.svg"
                            : "images/etoile_vide.svg";
                    });

                    // --- Interaction étoiles ---
                    stars.forEach(star => {
                        star.addEventListener("mouseover", () => {
                            let val = star.dataset.value;
                            stars.forEach(s => {
                                s.src = (s.dataset.value <= val)
                                    ? "images/etoile_remplie.svg"
                                    : "images/etoile_vide.svg";
                            });
                        });

                        star.addEventListener("click", () => {
                            noteField.value = star.dataset.value;
                        });
                    });

                    document.getElementById("input-stars").addEventListener("mouseleave", () => {
                        let val = noteField.value || 0;
                        stars.forEach(s => {
                            s.src = (s.dataset.value <= val)
                                ? "images/etoile_remplie.svg"
                                : "images/etoile_vide.svg";
                        });
                    });

                    // --- Ouvrir formulaire ---
                    document.getElementById("btn-rediger-avis").onclick = function () {
                        document.getElementById("formulaire-avis").style.display = "block";
                        this.style.display = "none";
                    };

                    // --- Soumettre avis ---
                    document.getElementById("form-avis").onsubmit = function (e) {
                        e.preventDefault();

                        fetch("ajouter_avis.php", {
                            method: "POST",
                            body: new FormData(this)
                        })
                            .then(r => r.text())
                            .then(res => {
                                if (res === "ok") {
                                    chargerAvis(codePays);
                                    afficherFormulaireAvis(codePays);
                                }
                            });
                    };

                    // --- SUPPRESSION AVIS ---
                    if (deja) {
                        document.getElementById("btn-supprimer-avis").onclick = function () {

                            if (!confirm("Voulez-vous vraiment supprimer votre avis ?")) return;

                            let formData = new FormData();
                            formData.append("code_pays", codePays);

                            fetch("delete_avis.php", {
                                method: "POST",
                                body: formData
                            })
                            .then(r => r.text())
                            .then(res => {
                                if (res === "ok") {
                                    chargerAvis(codePays);
                                    afficherFormulaireAvis(codePays);
                                }
                            });
                        };
                    }

                });
        });
    }
});
function genererRadar(data) {

    console.log("➡️ genererRadar exécuté", data);

    // Supprimer l'ancien graphique
    if (radarChart) {
        radarChart.destroy();
    }

    // ATTENTION ⚠️ : D'ABORD déclarer ctx
    const ctx = document.getElementById('radarChart').getContext('2d');

    // Ensuite seulement on peut le log !
    console.log("ctx =", ctx);

    if (!ctx) {
        console.error("❌ canvas introuvable ! Le graphique ne peut pas se dessiner.");
        return;
    }

    radarChart = new Chart(ctx, {
        type: 'radar',
        data: {
            labels: ["Score bonheur", "PIB", "Soutien social", "Espérance de vie", "Revenus tourisme"],
            datasets: [{
                label: "Indicateurs",
                data: [
                    parseFloat(data.score_bonheur),
                    parseFloat(data.pib_par_habitant),
                    parseFloat(data.soutien_social),
                    parseFloat(data.esperance_vie),
                    parseFloat(data.revenus_tourisme)
                ],
                backgroundColor: "rgba(54,162,235,0.3)",
                borderColor: "rgba(54,162,235,1)",
                borderWidth: 2
            }]
        }
    });
}

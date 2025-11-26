// conversion SVG → code BD
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



$(document).ready(function () {

    // --- COULEURS DE BASE ---
    $("path").attr("fill", "#D4D4D4");
    $("path").attr("stroke-width", "0.1");
    $("path").attr("stroke", "#000000");

    let lastClicked = null; // pour mémoriser le pays sélectionné

    // --- CLIC SUR UN PAYS ---
    $("path").click(function () {

        let svgCode = $(this).attr("id");

        let dbCode = SVG_TO_DB[svgCode];
        if (!dbCode) {
            console.warn("Aucun mapping pour le code :", svgCode);
            return;
        }

        // Réinitialise la couleur de tous les pays
        $("path").attr("fill", "#D4D4D4");

        // Surligne le pays cliqué
        $(this).attr("fill", "#D34426");
        lastClicked = this;

        // Récupération via MySQL
        $.get("getCountry.php?code=" + dbCode, function (data) {

            let p = data;

            $("#pays").text(p.nom_pays);
            $("#rang").text(p.rang || "—");
            $("#score").text(p.score_bonheur || "—");
            $("#pib").text(p.pib_par_habitant || "—");
            $("#touristes").text(p.nombre_touristes || "—");
            $("#revenus").text(p.revenus_tourisme || "—");
            $("#desc").text(p.description || "Pas de description disponible.");


            $("#infoPanel").removeClass("hidden");
            $("#backdrop").removeClass("hidden");
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


    
    $("#closePanel").click(function () {

        $("#infoPanel").addClass("hidden");
        $("#backdrop").addClass("hidden");

        if (lastClicked) {
            $(lastClicked).attr("fill", "#D4D4D4");
            lastClicked = null;
        }
    });

});

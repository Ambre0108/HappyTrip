document.addEventListener("DOMContentLoaded", () => {

    // ===============================
    //      ÉTOILES NOTE
    // ===============================
    let stars = document.querySelectorAll("#input-stars img");
    let noteField = document.getElementById("note-value");

    stars.forEach(star => {

        // Hover = affichage dynamique
        star.addEventListener("mouseover", () => {
            let val = star.dataset.value;
            stars.forEach(s => {
                s.src = (s.dataset.value <= val)
                    ? "images/etoile_remplie.svg"
                    : "images/etoile_vide.svg";
            });
        });

        // Click = fixer la note
        star.addEventListener("click", () => {
            noteField.value = star.dataset.value;
        });
    });

    // Quand la souris quitte la zone
    document.getElementById("input-stars").addEventListener("mouseleave", () => {
        let val = noteField.value || 0;
        stars.forEach(s => {
            s.src = (s.dataset.value <= val)
                ? "images/etoile_remplie.svg"
                : "images/etoile_vide.svg";
        });
    });

    // ===============================
    //     ENVOI DU FORMULAIRE
    // ===============================
    let form = document.getElementById("form-avis");

    if (form) {
        form.addEventListener("submit", function (e) {
            e.preventDefault();

            fetch("ajouter_avis.php", {
                method: "POST",
                body: new FormData(form)
            })
                .then(r => r.text())
                .then(res => {
                    if (res === "ok") {
                        alert("Votre avis a bien été enregistré !");
                        window.location.href = "profil.php";
                    } else {
                        alert("Erreur : " + res);
                    }
                });
        });
    }

    // ===============================
    //     SUPPRESSION AVIS INDIVIDUEL
    // ===============================
    let deleteBtn = document.getElementById("btn-supprimer-avis");

    if (deleteBtn) {
        deleteBtn.addEventListener("click", function () {

            if (!confirm("Voulez-vous vraiment supprimer votre avis ?")) return;

            let codePays = deleteBtn.dataset.pays;

            let formData = new FormData();
            formData.append("code_pays", codePays);

            fetch("delete_avis.php", {
                method: "POST",
                body: formData
            })
                .then(r => r.text())
                .then(res => {
                    if (res === "ok") {
                        alert("Avis supprimé.");
                        window.location.href = "profil.php";
                    } else {
                        alert("Erreur : " + res);
                    }
                });
        });
    }

    // ===============================
    //     SUPPRESSION DANS LA LISTE
    // ===============================
    document.querySelectorAll(".btn-delete").forEach(btn => {

        btn.addEventListener("click", () => {
            if (!confirm("Supprimer cet avis ?")) return;

            let formData = new FormData();
            formData.append("code_pays", btn.dataset.pays);

            fetch("delete_avis.php", {
                method: "POST",
                body: formData
            })
            .then(r => r.text())
            .then(res => {
                if (res === "ok") {
                    alert("Avis supprimé.");
                    location.reload();
                } else {
                    alert("Erreur : " + res);
                }
            });
        });
    });

});

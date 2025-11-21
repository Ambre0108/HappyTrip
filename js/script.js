$(document).ready(function() {
    //Fonction permettant la récupération des informations d'un pays
    function getInfoByName (code){
        //Paramètres nécessaires pour la requête
        var apiKey = "" //A remplir
        var settings = {
            "async": true,
            "crossDomain": true,
            "url": "https://restcountries-v1.p.rapidapi.com/alpha/"+code,
            "method": "GET",
            "headers": {
                "x-rapidapi-host": "restcountries-v1.p.rapidapi.com",
                "x-rapidapi-key": apiKey
            }
        }
        //Envoie de la requête au serveur
        $.ajax(settings).done(function (response) {
            //Suppression de l'ancienne description du pays
            $("#info").remove();
            //Récupération de la monnaie du pays
            var currencie = ""
            for (elt in response.currencies){
                currencie += response.currencies[elt]+" "
            }
            //Récupération des indicatifs téléphonique
            var callingCode = ""
            for (elt in response.callingCodes){
                callingCode += "(+"+response.callingCodes[elt]+") "
            }
            //Afffichage des informations
            $("#info-country").append(
                "<div id='info'><h1>"+response.name+"</h1><hr class='bg-white'><p><strong>Capitale : </strong>"+response.capital+"</p><p><strong>Localisation : </strong>"+response.region+" / "+response.subregion+"</p><p><strong>Population : </strong>"+response.population+"</p><p><strong>Superficie : </strong>"+response.area+" km²</p><p><strong>Monnaie : </strong>"+currencie+"</p><p><strong>Indicatif téléphonique : </strong>"+callingCode+"</p></div>"
            )
        });
    }

    //Couleur de la carte
    $("path").attr("fill","#D4D4D4")
    //Contour des pays
    $("path").attr("stroke-width","0.1")
    $("path").attr("stroke","#0000000")

    //Evenement lors du clique sur un pays
    $( "path" ).click(function() {
        //Remise à zéro des couleurs
        $(".svg-pan-zoom_viewport path").attr("fill","#D4D4D4")
        $(".svg-pan-zoom-control-background").css("opacity","1")
        $(".svg-pan-zoom-control rect").attr("fill","black")
        //Mise en rouge du pays qui a été cliqué
        $(this).attr("fill","#D34426");
        //Affichage des informations
        getInfoByName ($(this).attr("id"))
    });
    
    //Affichage du pays en bleu lors du survol avec la souris
    $( "path" ).mouseover(function() {
        $(this).attr("fill","#2029BF")
        $("#country").text($(this).attr("title"));
    });
    //Affichage par défault lors de la perte du focus
    $( "path" ).mouseout(function() {
        //Seulement si le pays n'a pas été cliqué
        if ($(this).attr("fill") != "#D34426"){
            $(this).attr("fill","#D4D4D4")
        }
    });

    //Gestion du zoom
    var panZoomTiger = svgPanZoom('#map', {
        viewportSelector: '.svg-pan-zoom_viewport'
        , panEnabled: true
        , controlIconsEnabled: true
        , zoomEnabled: true
        , dblClickZoomEnabled: true
        , mouseWheelZoomEnabled: true
        , preventMouseEventsDefault: true
        , zoomScaleSensitivity: 0.8
        , minZoom: 0.5
        , maxZoom: 10
        , fit: true
        , contain: false
        , center: true
        , refreshRate: 'auto'
        , beforeZoom: function(){}
        , onZoom: function(){}
        , beforePan: function(){}
        , onPan: function(){}
        , onUpdatedCTM: function(){}
        , eventsListenerElement: null
    });
})
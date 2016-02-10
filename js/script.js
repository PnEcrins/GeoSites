// Gestion événementielle du bouton afficher/cacher de la sidebar
$(document).ready(function(){
    $("show-sidebar").click(function(){
        $("#sidebar").toggle();
        if($("#sidebar").is(":visible")){
        	var isVisible = true;
            document.getElementById("containerCarte").className = "col-md-offset-4 col-md-8";
            carte.invalidateSize();            
        }
        else{
        	var isVisible = false;
            document.getElementById("containerCarte").className = "col-md-12";
            carte.invalidateSize();
        }
    });    
});

// Ajout de la couche des sites à la carte
// Mettre le script php ici
/*$.getJSON("data/site_geol.geojson", function(data) {
    var geojsonLayer = new L.GeoJSON(data);
    carte.addLayer(geojsonLayer);
});*/
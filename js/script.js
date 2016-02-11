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

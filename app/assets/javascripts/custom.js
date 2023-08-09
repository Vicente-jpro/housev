$(function(){

    $("#sub-menu-land").hide();
    $("#sub-menu-house").hide();
    
    $(".land").mouseenter(function(){
        $(".land").show();
    });

    $(".land").mouseleave(function(){
        $("#sub-menu-land").hide();
    });

    
    $(".house").mouseenter(function(){
        $(".house").show();
    });

    $(".house").mouseleave(function(){
        $("#sub-menu-house").hide();
    });
});
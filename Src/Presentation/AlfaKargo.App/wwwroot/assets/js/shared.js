
$(document).ready(function(){
    $("#lang-all").click(function(){
        $("#lang-drop-down").toggleClass("open");
        $("#chevron").toggleClass("chevron-toggle");
    });
    $("#aze").click(function(){
        $("#aze").toggleClass("selected");
        $("#eng").removeClass("selected");
        $("#rus").removeClass("selected");
        $("#lang").text("AZ");
    });
    $("#eng").click(function(){
        $("#eng").toggleClass("selected");
        $("#aze").removeClass("selected");
        $("#rus").removeClass("selected");
        $("#lang").text("EN");
    });
    $("#rus").click(function(){
        $("#rus").toggleClass("selected");
        $("#aze").removeClass("selected");
        $("#eng").removeClass("selected");
        $("#lang").text("RU");
    });
    $(".menu-bar2 .icon").click(function () {
        $(".mini-menu2").toggleClass("active-menu");
    });
    $(".menu-bar .icon").click(function () {
        console.log("aa")
        $(".mini-menu").toggleClass("active-menu");
    });
    $(".close2").click(function () {
        console.log("test");
        $(".mini-menu2").toggleClass("active-menu");
    });
    $(".close").click(function () {
        console.log("test");
        $(".mini-menu").toggleClass("active-menu");
    });
});

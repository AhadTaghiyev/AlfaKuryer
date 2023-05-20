
$(document).ready(function(){
    $("#lang-all").click(function(){
        $("#lang-drop-down").toggleClass("open");
        $("#chevron").toggleClass("chevron-toggle");
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

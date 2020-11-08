$(document).ready(function () {
    const options = {
        time: '0.0s',
        label: '🌓'
    }

    const darkmode = new Darkmode(options);
    darkmode.showWidget();
    DarkModeTitle(darkmode.isActivated());

    $(".darkmode-toggle").click(function () {
        DarkModeTitle(darkmode.isActivated());
    });

    function DarkModeTitle(value) {
        if (value === false) {
            $("nav").removeClass("navbar-dark");
            $("nav").removeClass("bg-dark");
            $("nav").addClass("navbar-light");
            $("nav").addClass("bg-white");
            $(".dropdown-menu").removeClass("bg-dark");
            $(".dropdown-menu").addClass("bg-white");
            $(".shadow").addClass("bg-white");
            $(".shadow").removeClass("bg-dark");
            $(".card").removeClass("elegant-color");
        } else {
            $("nav").addClass("navbar-dark");
            $("nav").addClass("bg-dark");
            $("nav").removeClass("navbar-light");
            $("nav").removeClass("bg-white");
            $(".dropdown-menu").addClass("bg-dark");
            $(".dropdown-menu").removeClass("bg-white");
            $(".shadow").removeClass("bg-white");
            $(".shadow").addClass("bg-dark");
            $(".card").addClass("elegant-color");
        }
    }
});
// Smooth scrolling for navigation links
$(document).ready(function () {
    $("nav ul li a").on("click", function (event) {
        if (this.hash !== "") {
            event.preventDefault();
            var hash = this.hash;
            $('html, body').animate({
                scrollTop: $(hash).offset().top
            }, 800, function () {
                window.location.hash = hash;
            });
        }
    });
});

// Initialize Bootstrap carousel for testimonials
$('#testimonialCarousel').carousel({
    interval: 3000 // Carousel slides every 3 seconds
});

// Google Maps initialization
function initMap() {
    var templeLocation = { lat: 26.7876, lng: 82.1992 }; // Coordinates for Krishna Mandir
    var map = new google.maps.Map(document.getElementById('map-container'), {
        zoom: 15,
        center: templeLocation
    });
    var marker = new google.maps.Marker({
        position: templeLocation,
        map: map,
        title: 'Krishna Mandir'
    });
}

// Image gallery lightbox initialization
lightbox.option({
    'resizeDuration': 200,
    'wrapAround': true,
    'alwaysShowNavOnTouchDevices': true
});

// Dynamic year update in footer
document.addEventListener('DOMContentLoaded', function () {
    const currentYear = new Date().getFullYear();
    document.querySelector('footer p').innerHTML = `&copy; ${currentYear} Krishna Mandir. All Rights Reserved.`;
});

// Lazy loading for carousel images
$(document).ready(function () {
    $('.carousel').on('slide.bs.carousel', function (event) {
        var img = $(event.relatedTarget).find('img');
        var src = img.data('src');
        if (typeof src !== "undefined" && img.attr('src') !== src) {
            img.attr('src', src);
        }
    });
});

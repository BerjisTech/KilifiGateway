// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"

alert('loaded')

function processImage(image_url, element_class) {
    var colorThief = new ColorThief();
    if (image_url.complete) {
        // Get the dominant color.
        var dominantColor = colorThief.getColor(img);

        // Get the palette (we'll just use the first two colors here).
        var palette = colorThief.getPalette(img, 2);

        // Now you can set the gradient on your element.
        var accomodation = document.querySelector(`.${element_class}`);
        accomodation.style.background = `linear-gradient(to right, rgba(${palette[0].join(',')}), rgba(${palette[1].join(',')})), url('${img.src}') no-repeat`;
        accomodation.style.backgroundSize = 'cover';
    } else {
        img.addEventListener('load', processImage);
    }

}
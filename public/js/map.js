// Création de la map avec l'objet L

var map = L.map('map').setView([40.708504, -74.009333], 12);

// Importation du layer
L.tileLayer('https://korona.geog.uni-heidelberg.de/tiles/roads/x={x}&y={y}&z={z}', {
    maxZoom: 20,
}).addTo(map);

$.ajax({
    url: 'http://127.0.0.1:8000/api',
    type: 'GET',
    dataType: 'json'
}).done(function (data) {
    console.log(data);
}).fail(function (error) {
    console.log(error.status + ' ' + error.statusText);
});
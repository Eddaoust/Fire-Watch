// Création de la map avec l'objet L

var map = L.map('map').setView([40.708504, -74.009333], 12);

// Importation du layer
L.tileLayer('https://korona.geog.uni-heidelberg.de/tiles/roads/x={x}&y={y}&z={z}', {
    maxZoom: 20,
}).addTo(map);
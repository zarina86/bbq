document.addEventListener("turbo:load", () => {
  ymaps.ready(init);
  
  function init(){
    const Mapnew = document.getElementById("map");

    if (!Mapnew) return false;

    const address = Mapnew.getAttribute('data-address');
  
    const myMap = new ymaps.Map("map", {
      center: [49.57, 82.37],
      zoom: 10
    });

    const myGeocoder = ymaps.geocode(address);

    myGeocoder.then(
      function (res) {
        coordinates = res.geoObjects.get(0).geometry.getCoordinates();

        myMap.geoObjects.add(
            new ymaps.Placemark(
              coordinates,
              {iconContent: address},
              {preset: 'islands#blueStretchyIcon'}
            )
        );

        myMap.setCenter(coordinates);
        myMap.setZoom(15);
      }, function (err) {
        alert('Ошибка при определении местоположения');
      }
    );
  }  
})

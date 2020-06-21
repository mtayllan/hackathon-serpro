//= require application
//= require shards

window.onload = () => {
  const onSuccess = (position) => {
    document.getElementsByName('latitude').value = position.coords.latitude;
    document.getElementsByName('longitude').value = position.coords.longitude;
    console.log('Posição encontrada :)');
  }

  const onError = (error) => {
    console.log(error);
    iziToast.error({
      'message': 'Ops, não conseguimos encontrar sua localização para obter os resultados mais próximos'
    });

  }
  navigator.geolocation.getCurrentPosition(onSuccess, onError);
}

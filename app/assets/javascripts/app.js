//= require application
//= require shards

window.onload = () => {
  const onSuccess = (position) => {
    document.querySelector('input[name=latitude]').value = position.coords.latitude;
    document.querySelector('input[name=longitude]').value = position.coords.longitude;
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

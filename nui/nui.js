$(function () {
    window.addEventListener("message", function (event) {
      var convertedMinutes = event.data.deathtimer
      var convertedSeconds = event.data.deathtimer
  
      convertedMinutes = Math.floor(event.data.deathtimer / 60)
      convertedSeconds = Math.floor(event.data.deathtimer % 60)
  
      var item = event.data;
      // Desmaiado
      if (item.setDisplay) {
        $("#fainting").fadeIn(200);
        $("#clock").html(`${convertedMinutes}:${convertedSeconds}`);
      } else {
        $("#fainting").fadeOut(200);
      }
  
      // Morto
      if (item.setDisplayDead) {
        $("#Death").fadeIn(200);
        $("#clock").html(`${convertedMinutes}:${convertedSeconds}`);
      } else {
        $("#Death").fadeOut(200);
      }
    });
  });
  
  const DeathV = document.querySelector('#DeathB');
  
  DeathV.addEventListener('click', event => {
    mta.triggerEvent('desistir')
  });
  
  function abrirModal() {
    document.getElementById("popup-1").classList.toggle("active");
  }
  
  function fecharModal() {
    document.getElementById("popup-1").classList.toggle("active");
  }
  
  function simAceita() {
    document.getElementById("popup-1").classList.toggle("active");
    mta.triggerEvent('desistir')
  }
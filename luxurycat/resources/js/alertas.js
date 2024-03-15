var botonesAbrirModal = document.querySelectorAll('.editar');
botonesAbrirModal.forEach(function (boton) {
  boton.addEventListener('click', function () {
    var modal = new bootstrap.Modal(document.getElementById('exampleModal'));
    modal.show();
  });
});

var elementosEliminar = document.querySelectorAll('.eliminar');
elementosEliminar.forEach(function (elemento) {
  elemento.addEventListener('click', function () {
    swal({
      title: "Eliminado correctamente!",
      text: "El elemento se ha eliminado",
      icon: "success",
      button: "Aceptar"
    });
  });
});
// Constante para completar la ruta de la API.
const Admin_API = "services/admin/administrador.php";
const TIPO_ADMIN_API = "services/admin/tipoadmin.php";

// Constante para establecer el formulario de buscar.
const SEARCH_FORM = document.getElementById("searchForm");

// Constantes para establecer los elementos de la tabla.
const TABLE_BODY = document.getElementById("tableBody");

// Constantes para establecer los elementos del componente Modal.
const SAVE_MODAL = new bootstrap.Modal("#saveModal"),
  MODAL_TITLE = document.getElementById("modalTitle");

// Constantes para establecer los elementos del formulario de guardar.
const SAVE_FORM = document.getElementById("saveForm"),
  ADMIN_ID = document.getElementById("admin_id"),
  admin_nombre = document.getElementById("admin_nombre"),
  admin_apellido = document.getElementById("admin_apellido"),
  admin_usuario = document.getElementById("admin_usuario"),
  admin_cotraseña = document.getElementById("admin_contraseña"),
  admin_correo = document.getElementById("admin_correo"),
  tipo_admin_id = document.getElementById("tipoadmin_id");

const RADIO_ESTADO_ACTIVO = document.getElementById("activo");
const RADIO_ESTADO_INACTIVO = document.getElementById("inactivo");

/*
 *   Función asíncrona para llenar la tabla con los registros disponibles.
 *   Parámetros: form (objeto opcional con los datos de búsqueda).
 *   Retorno: ninguno                AQUI ME QUEDE.
 */
const fillTable = async (form = null) => {
  // Se inicializa el contenido de la tabla.
  TABLE_BODY.innerHTML = "";
  // Se verifica la acción a realizar.
  form ? (action = "searchRows") : (action = "readAll");
  // Petición para obtener los registros disponibles.
  const DATA = await fetchData(Admin_API, action, form);
  // Se comprueba si la respuesta es satisfactoria, de lo contrario se muestra un mensaje con la excepción.
  if (DATA.status) {
    // Se recorre el conjunto de registros fila por fila.
    DATA.dataset.forEach((row) => {
      let color_estado;

      if (row.admin_estado == 1) {
        color_estado = "#71D17A";
      } else {
        color_estado = "#F87777";
      }
      // Se crean y concatenan las filas de la tabla con los datos de cada registro.
      TABLE_BODY.innerHTML += `
                  <tr>
                  <td class="col-1">${row.admin_id}</td>
                  <td class="col-1">${row.admin_nombre}</td>
                  <td class="col-1">${row.admin_apellido}</td>
                  <td class="col-1">${row.admin_usuario}</td>
                  <td class="col-1">${row.admin_correo}</td>
                  <td class="col-1">${row.tipo_admin_nombre}</td>
                  <td class="col-2">
  
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" style="fill: ${color_estado};">
                          <path d="M12 2C6.486 2 2 6.486 2 12s4.486 10 10 10 10-4.486 10-10S17.514 2 12 2z"></path></svg>
  
                  </td>
                  <td class="col-1">
                      <div class="container-fluid">
                          <div class="row">
                              <div class="col-3 editar" onclick="openUpdate(${row.admin_id})">
                                  <img src="../../resources/svg/editar.svg" alt="" />
                              </div>
                              <div class="col-3 eliminar" onclick="openDelete(${row.admin_id})">
                                  <img src="../../resources/svg/eliminar.svg" alt="" />
                              </div>
                          </div>
                      </div>
                  </td>
              </tr>
              `;
    });
  } else {
    sweetAlert(4, DATA.error, true);
  }
};

// Método del evento para cuando el documento ha cargado.
document.addEventListener("DOMContentLoaded", () => {
  loadTemplate();
  fillTable();
});

// Método del evento para cuando se envía el formulario de buscar.
SEARCH_FORM.addEventListener("submit", (event) => {
  // Se evita recargar la página web después de enviar el formulario.
  event.preventDefault();
  // Constante tipo objeto con los datos del formulario.
  const FORM = new FormData(SEARCH_FORM);
  // Llamada a la función para llenar la tabla con los resultados de la búsqueda.
  fillTable(FORM);
});

// Método del evento para cuando se envía el formulario de guardar.
SAVE_FORM.addEventListener("submit", async (event) => {
  // Se evita recargar la página web después de enviar el formulario.
  event.preventDefault();
  // Se verifica la acción a realizar.
  ADMIN_ID.value ? (action = "updateRow") : (action = "createRow");
  // Constante tipo objeto con los datos del formulario.
  const FORM = new FormData(SAVE_FORM);
  // Petición para guardar los datos del formulario.
  const DATA = await fetchData(Admin_API, action, FORM);
  // Se comprueba si la respuesta es satisfactoria, de lo contrario se muestra un mensaje con la excepción.
  if (DATA.status) {
    // Se cierra la caja de diálogo.
    SAVE_MODAL.hide();
    // Se muestra un mensaje de éxito.
    sweetAlert(1, DATA.message, true);
    // Se carga nuevamente la tabla para visualizar los cambios.
    fillTable();
  } else {
    sweetAlert(2, DATA.error, false);
  }
});

/*
 *   Función para preparar el formulario al momento de insertar un registro.
 *   Parámetros: ninguno.
 *   Retorno: ninguno.
 */

const openCreate = () => {
  // Se muestra la caja de diálogo con su título.
  SAVE_MODAL.show();
  MODAL_TITLE.textContent = "Crear administrador";
  // Se prepara el formulario.
  SAVE_FORM.reset();
  fillSelect(TIPO_ADMIN_API, "readAll", "tipoadmin_id");
  
  admin_cotraseña.disabled = false;
};

/*
 *   Función asíncrona para preparar el formulario al momento de actualizar un registro.
 *   Parámetros: id (identificador del registro seleccionado).
 *   Retorno: ninguno.
 */

const openUpdate = async (admin_id) => {
  // Se define una constante tipo objeto con los datos del registro seleccionado.
  const FORM = new FormData();
  FORM.append("admin_id", admin_id);
  // Petición para obtener los datos del registro solicitado.
  const DATA = await fetchData(Admin_API, "readOne", FORM);
  // Se comprueba si la respuesta es satisfactoria, de lo contrario se muestra un mensaje con la excepción.
  if (DATA.status) {
    // Se muestra la caja de diálogo con su título.
    SAVE_MODAL.show();
    MODAL_TITLE.textContent = "Actualizar administrador";
    // Se prepara el formulario.
    SAVE_FORM.reset();
    // Se inicializan los campos con los datos.
    const ROW = DATA.dataset;
    ADMIN_ID.value = ROW.admin_id;
    admin_nombre.value = ROW.admin_nombre;
    admin_apellido.value = ROW.admin_apellido;
    admin_usuario.value = ROW.admin_usuario;
    admin_correo.value = ROW.admin_correo;
    if (ROW.admin_estado == 1) {
      RADIO_ESTADO_ACTIVO.checked = true;
    } else if (ROW.admin_estado === 0) {
      RADIO_ESTADO_INACTIVO.checked = true;
    }
    fillSelect(TIPO_ADMIN_API, "readAll", "tipoadmin_id", ROW.tipo_admin_id);
    admin_cotraseña.disabled = true;
  } else {
    sweetAlert(2, DATA.error, false);
  }
};

/*
 *   Función asíncrona para eliminar un registro.
 *   Parámetros: id (identificador del registro seleccionado).
 *   Retorno: ninguno.
 */

const openDelete = async (admin_id) => {
  // Llamada a la función para mostrar un mensaje de confirmación, capturando la respuesta en una constante.
  const RESPONSE = await confirmAction(
    "¿Desea eliminar la marca de forma permanente?"
  );
  // Se verifica la respuesta del mensaje.
  if (RESPONSE) {
    // Se define una constante tipo objeto con los datos del registro seleccionado.
    const FORM = new FormData();
    FORM.append("admin_id", admin_id);
    // Petición para eliminar el registro seleccionado.
    const DATA = await fetchData(Admin_API, "deleteRow", FORM);
    // Se comprueba si la respuesta es satisfactoria, de lo contrario se muestra un mensaje con la excepción.
    if (DATA.status) {
      // Se muestra un mensaje de éxito.
      await sweetAlert(1, DATA.message, true);
      // Se carga nuevamente la tabla para visualizar los cambios.
      fillTable();
    } else {
      sweetAlert(2, DATA.error, false);
    }
  }
};

/*
 *   Función para abrir un reporte parametrizado de productos de una categoría.
 *   Parámetros: id (identificador del registro seleccionado).
 *   Retorno: ninguno.
 */

const openReport = (admin_id) => {
  // Se declara una constante tipo objeto con la ruta específica del reporte en el servidor.
  const PATH = new URL(`${SERVER_URL}reports/admin/productos_categoria.php`);
  // Se agrega un parámetro a la ruta con el valor del registro seleccionado.
  PATH.searchParams.append("admin_id", admin_id);
  // Se abre el reporte en una nueva pestaña.
  window.open(PATH.href);
};

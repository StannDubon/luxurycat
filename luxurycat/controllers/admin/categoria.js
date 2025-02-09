// Constante para completar la ruta de la API.
const CATEGORIA_API = 'services/admin/categoria.php';

// Constante para establecer el formulario de buscar.
const SEARCH_FORM = document.getElementById('searchForm');
const SEARCH_INPUT = document.getElementById('searchInput');

// Constantes para establecer los elementos de la tabla.
const TABLE_BODY = document.getElementById('tableBody');

// Constantes para establecer los elementos del componente Modal.
const SAVE_MODAL = new bootstrap.Modal('#saveModal'),
    MODAL_TITLE = document.getElementById('modalTitle');

// Constantes para establecer los elementos del formulario de guardar.
const SAVE_FORM = document.getElementById('saveForm'),
    CATEGORIA_ID = document.getElementById('categoria_id'),
    CATEGORIA_NOMBRE = document.getElementById('categoria_nombre'),
    CATEGORIA_DESCRIPCION = document.getElementById('categoria_descripcion')

const RADIO_ESTADO_ACTIVO = document.getElementById("activo");
const RADIO_ESTADO_INACTIVO = document.getElementById("inactivo");


// Método del evento para cuando el documento ha cargado.
document.addEventListener("DOMContentLoaded", () => {
    // Llamada a la función para mostrar el encabezado y pie del documento.
    loadTemplate();
    // Llamada a la función para llenar la tabla con los registros existentes.
    fillTable();
  });



const openCreate = () => {
    // Se muestra la caja de diálogo con su título.
    SAVE_MODAL.show();
    MODAL_TITLE.textContent = "Crear marca";
    // Se prepara el formulario.
    //SAVE_FORM.reset();

  };

SEARCH_INPUT.addEventListener('input', (event) => {
    // Constante tipo objeto con los datos del formulario.
    event.preventDefault();
    const FORM = new FormData();
    FORM.append('search', SEARCH_INPUT.value);
    // Llamada a la función para llenar la tabla con los resultados de la búsqueda.
    fillTable(FORM);
});

// Método del evento para cuando se envía el formulario de guardar.
SAVE_FORM.addEventListener('submit', async (event) => {
    // Se evita recargar la página web después de enviar el formulario.
    event.preventDefault();
    // Se verifica la acción a realizar.
    (CATEGORIA_ID.value) ? action = 'updateRow' : action = 'createRow';
    // Constante tipo objeto con los datos del formulario.
    const FORM = new FormData(SAVE_FORM);
    // Petición para guardar los datos del formulario.
    const DATA = await fetchData(CATEGORIA_API, action, FORM);
    // Se comprueba si la respuesta es satisfactoria, de lo contrario se muestra un mensaje con la excepción.
    if (DATA.status) {
        // Se cierra la caja de diálogo.
        SAVE_MODAL.hide();
        CATEGORIA_ID.value=null
        // Se muestra un mensaje de éxito.
        sweetAlert(1, DATA.message, true);
        // Se carga nuevamente la tabla para visualizar los cambios.
        fillTable();
    } else {
        sweetAlert(2, DATA.error, false);
    }
});



/*
*   Función asíncrona para llenar la tabla con los registros disponibles.
*   Parámetros: form (objeto opcional con los datos de búsqueda).
*   Retorno: ninguno.
*/
const fillTable = async (form = null) => {
    TABLE_BODY.innerHTML = '';
    if (form === null) {
        form = new FormData();
    }
    const searchValue = form.get('search');
    const action = searchValue ? 'searchRows' : 'readAll';

    const DATA = await fetchData(CATEGORIA_API, action, form);
    if (DATA.status) {
        if (action === 'searchRows' && DATA.dataset.length === 0) {
            TABLE_BODY.innerHTML += `
                <tr>
                <td class="col-2"></td>
                <td class="col-4"><b>${DATA.error}</b></td>
                <td class="col-2"></td>
                <td class="col-2"></td>
                <td class="col-2"></td>
                </tr>
            `;
        } else {
            DATA.dataset.forEach(row => {
                let color_estado;
    
                if (row.categoria_estado == 1) {
                    color_estado = "#71D17A";
                } else {
                    color_estado = "#F87777";
                }
                TABLE_BODY.innerHTML += `
                    <tr>
                    <td class="col-2">${row.categoria_id}</td>
                    <td class="col-4">${row.categoria_nombre}</td>
                    <td class="col-2">${row.categoria_descripcion}</td>
                    <td class="col-2">

                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" style="fill: ${color_estado};" onclick="openState(${row.categoria_id})">
                    <path d="M12 2C6.486 2 2 6.486 2 12s4.486 10 10 10 10-4.486 10-10S17.514 2 12 2z"></path></svg>

                    </td>
                    <td class="col-2">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-3 editar"  onclick="openUpdate(${row.categoria_id})"> <img src="../../resources/svg/editar.svg" alt="" />
                                </div>
                                <div class="col-3 eliminar"  onclick="openDelete(${row.categoria_id})"> <img src="../../resources/svg/eliminar.svg" alt="" />
                                </div>
                            </div>
                        </div>
                    </td>
                    </tr>
                `;
            });
        }
    } else {
        TABLE_BODY.innerHTML += `
        <tr>
        <td class="col-2"></td>
        <td class="col-4"><b>${DATA.error}</b></td>
        <td class="col-2"></td>
        <td class="col-2"></td>
        <td class="col-2"></td>
        </tr>`;
    }
}


/*
*   Función asíncrona para cambiar el estado de un registro.
*   Parámetros: id (identificador del registro seleccionado).
*   Retorno: ninguno.
*/
const openState = async (id) => {
    // Llamada a la función para mostrar un mensaje de confirmación, capturando la respuesta en una constante.
    const RESPONSE = await confirmAction('¿Desea cambiar el estado de la marca?');
    try {
        if (RESPONSE) {
            const FORM = new FormData();
            FORM.append('categoria_id', id);
            console.log(id);
            const DATA = await fetchData(CATEGORIA_API, 'changeStatus', FORM);
            console.log(DATA.status);
            if (DATA.status) {
                await sweetAlert(1, DATA.message, true);
                fillTable();
            } else {
                sweetAlert(2, DATA.error, false);
            }
        }
    }
    catch (Error) {
        console.log(Error + ' Error al cargar el mensaje');
    }
}

/*
*   Función para preparar el formulario al momento de insertar un registro.
*   Parámetros: ninguno.
*   Retorno: ninguno.
*/


/*
*   Función asíncrona para preparar el formulario al momento de actualizar un registro.
*   Parámetros: id (identificador del registro seleccionado).
*   Retorno: ninguno.
*/
const openUpdate = async (id) => {
    const FORM = new FormData();
    FORM.append('categoria_id', id);
    const DATA = await fetchData(CATEGORIA_API, 'readOne', FORM);
    if (DATA.status) {
        SAVE_MODAL.show();

        MODAL_TITLE.textContent = 'Actualizar marca';
        SAVE_FORM.reset();
        const ROW = DATA.dataset;
        CATEGORIA_ID.value = ROW.categoria_id;
        CATEGORIA_NOMBRE.value = ROW.categoria_nombre;
        CATEGORIA_DESCRIPCION.value = ROW.categoria_descripcion;

        if (ROW.categoria_estado == 1) {
            RADIO_ESTADO_ACTIVO.checked = true;
        } else if (ROW.categoria_estado == 0) {
            RADIO_ESTADO_INACTIVO.checked = true;
        }
    } else {
        sweetAlert(2, DATA.error, false);
    }

}

/*
*   Función asíncrona para eliminar un registro.
*   Parámetros: id (identificador del registro seleccionado).
*   Retorno: ninguno.
*/
const openDelete = async (id) => {
    const RESPONSE = await confirmAction('¿Desea eliminar la categoría de forma permanente?');
    try {
        if (RESPONSE) {
            const FORM = new FormData();
            FORM.append('categoria_id', id);
            const DATA = await fetchData(CATEGORIA_API, 'deleteRow', FORM);
            if (DATA.status) {
                await sweetAlert(1, DATA.message, true);
                fillTable();
            } else {
                sweetAlert(2, DATA.error, false);
            }
        }
    }
    catch (Error) {
        console.log(Error + ' Error al cargar el mensaje');
    }

}
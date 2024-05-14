<?php
// Se incluye la clase del modelo.
require_once ('../../models/data/administrador_data.php');

// Se comprueba si existe una acción a realizar, de lo contrario se finaliza el script con un mensaje de error.
if (isset($_GET['action'])) {
    // Se crea una sesión o se reanuda la actual para poder utilizar variables de sesión en el script.
    session_start();
    // Se instancia la clase correspondiente.
    $admin = new Admindata;
    // Se declara e inicializa un arreglo para guardar el resultado que retorna la API.
    $result = array('status' => 0, 'message' => null, 'dataset' => null, 'error' => null, 'exception' => null);
    // Se compara la acción a realizar cuando un administrador ha iniciado sesión.
    switch ($_GET['action']) {

        case 'searchRows':
            // Validación de la cadena de búsqueda.
            if (!Validator::validateSearch($_POST['search'])) {
                $result['error'] = Validator::getSearchError();
            } elseif ($result['dataset'] = $admin->searchRows()) {
                $result['status'] = 1;
                $result['message'] = 'Existen ' . count($result['dataset']) . ' coincidencias';
            } else {
                $result['error'] = 'No hay coincidencias';
            }
            break;

        case 'createRow':
            $_POST = Validator::validateForm($_POST);
            // Validación de los datos del formulario para crear una nueva marca.
            if (
                !$admin->setNombre($_POST['Nombre']) or
                !$admin->setEstado($_POST['Estado'])
            ) {
                $result['error'] = $admin->getDataError();
            } elseif ($admin->createRow()) {
                $result['status'] = 1;
                $result['message'] = 'Administrador creada correctamente';
            } else {
                $result['error'] = 'Ocurrió un problema al crear el administrador';
            }
            break;

        case 'readAll':
            // Lectura de todas las marcas.
            if ($result['dataset'] = $admin->readAll()) {
                $result['status'] = 1;
                $result['message'] = 'Existen ' . count($result['dataset']) . ' registros';
            } else {
                $result['error'] = 'No existen administradores registrados';
            }
            break;

        case 'readOne':
            // Lectura de una marca específica.
            if (!$admin->setId($_POST['id'])) {
                $result['error'] = $admin->getDataError();
            } elseif ($result['dataset'] = $admin->readOne()) {
                $result['status'] = 1;
            } else {
                $result['error'] = 'Administrador inexistente';
            }
            break;

        case 'updateRow':
            $_POST = Validator::validateForm($_POST);
            // Validación de los datos del formulario para actualizar una marca.
            if (
                !$admin->setNombre($_POST['Nombre']) or
                !$admin->setEstado($_POST['Estado'])
            ) {
                $result['error'] = $admin->getDataError();
            } elseif ($admin->updateRow()) {
                $result['status'] = 1;
                $result['message'] = 'Administrador modificado correctamente';
            } else {
                $result['error'] = 'Ocurrió un problema al modificar el administrador';
            }
            break;

        case 'deleteRow':
            // Eliminación de una marca.
            if (!$admin->setId($_POST['id'])) {
                $result['error'] = $admin->getDataError();
            } elseif ($admin->deleteRow()) {
                $result['status'] = 1;
                $result['message'] = 'Administrador eliminado correctamente';
            } else {
                $result['error'] = 'Ocurrió un problema al eliminar al administrador';
            }
            break;

        default:
            $result['error'] = 'Acción no disponible dentro de la sesión';
    }

    // Se obtiene la excepción del servidor de base de datos por si ocurrió un problema.
    $result['exception'] = Database::getException();
    // Se indica el tipo de contenido a mostrar y su respectivo conjunto de caracteres.
    header('Content-type: application/json; charset=utf-8');
    // Se imprime el resultado en formato JSON y se retorna al controlador.
    print (json_encode($result));

} else {
    print (json_encode('Recurso no disponible'));
}

<?php
// Se incluye la clase del modelo.
require_once ('../../models/data/marca_data.php');

// Se comprueba si existe una acción a realizar, de lo contrario se finaliza el script con un mensaje de error.
if (isset($_GET['action'])) {
    // Se crea una sesión o se reanuda la actual para poder utilizar variables de sesión en el script.
    session_start();
    // Se instancia la clase correspondiente.
    $marca = new MarcaData;
    // Se declara e inicializa un arreglo para guardar el resultado que retorna la API.
    $result = array('status' => 0, 'message' => null, 'dataset' => null, 'error' => null, 'exception' => null);
    // Se compara la acción a realizar cuando un administrador ha iniciado sesión.
    switch ($_GET['action']) {

        case 'searchRows':
            // Validación de la cadena de búsqueda.
            if (!Validator::validateSearch($_POST['search'])) {
                $result['error'] = Validator::getSearchError();
            } elseif ($result['dataset'] = $marca->searchRows()) {
                $result['status'] = 1;
                $result['message'] = 'Existen ' . count($result['dataset']) . ' coincidencias';
            } else {
                $result['error'] = 'No hay coincidencias';
            }
            break;

        case 'createRow':
            if (!isset($_POST['marca_nombre']) || !isset($_POST['marca_estado'])) {
                $result['error'] = 'Los campos requeridos no están presentes en la solicitud';
            } else {
                $_POST = Validator::validateForm($_POST);
                // Validación de los datos del formulario para crear una nueva marca.
                if (
                    !$marca->setNombre($_POST['marca_nombre']) ||
                    !$marca->setEstado($_POST['marca_estado'])
                ) {
                    $result['error'] = $marca->getDataError();
                } elseif ($marca->createRow()) {
                    $result['status'] = 1;
                    $result['message'] = 'Marca creada correctamente';
                } else {
                    $result['error'] = 'Ocurrió un problema al crear la marca';
                }
            }
            break;

        case 'readAll':
            // Lectura de todas las marcas.
            if ($result['dataset'] = $marca->readAll()) {
                $result['status'] = 1;
                $result['message'] = 'Existen ' . count($result['dataset']) . ' registros';
            } else {
                $result['error'] = 'No existen marcas registradas';
            }
            break;

        case 'readOne':
            // Lectura de una marca específica.
            if (!$marca->setId($_POST['id'])) {
                $result['error'] = $marca->getDataError();
            } elseif ($result['dataset'] = $marca->readOne()) {
                $result['status'] = 1;
            } else {
                $result['error'] = 'Marca inexistente';
            }
            break;

        case 'updateRow':
            $_POST = Validator::validateForm($_POST);
            // Validación de los datos del formulario para actualizar una marca.
            if (
                !$marca->setNombre($_POST['Nombre']) or
                !$marca->setEstado($_POST['Estado'])
            ) {
                $result['error'] = $marca->getDataError();
            } elseif ($marca->updateRow()) {
                $result['status'] = 1;
                $result['message'] = 'Marca modificada correctamente';
            } else {
                $result['error'] = 'Ocurrió un problema al modificar la marca';
            }
            break;

        case 'deleteRow':
            // Eliminación de una marca.
            if (!$marca->setId($_POST['id'])) {
                $result['error'] = $marca->getDataError();
            } elseif ($marca->deleteRow()) {
                $result['status'] = 1;
                $result['message'] = 'Marca eliminada correctamente';
            } else {
                $result['error'] = 'Ocurrió un problema al eliminar la marca';
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

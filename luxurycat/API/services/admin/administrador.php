<?php

require_once('../../models/data/administrador_data.php');

const POST_SEARCH = 'search';
const POST_ID = 'admin_id';
const POST_NOMBRE = 'admin_nombre';
const POST_APELLIDO = 'admin_apellido';
const POST_CORREO = 'admin_correo';
const POST_USUARIO = 'admin_usuario';
const POST_CONTRASEÑA = 'admin_contraseña';
const POST_CONFIRMAR_CONTRASEÑA = 'confirmar_contraseña';
const POST_ESTADO = 'admin_estado';



if (isset($_GET['action'])) {
    session_start();
    $administrador = new AdministradorData;
    $result = array('status' => 0, 'session' => 0, 'message' => null, 'dataset' => null, 'error' => null, 'exception' => null, 'username' => null);

    if (isset($_SESSION['admin_id'])) {
        $result['session'] = 1;
        switch ($_GET['action']) {
            case 'searchRows':
                if (!Validator::validateSearch($_POST[POST_SEARCH])) {
                    $result['error'] = Validator::getSearchError();
                } elseif ($result['dataset'] = $administrador->searchRows()) {
                    $result['status'] = 1;
                    $result['message'] = 'Existen ' . count($result['dataset']) . ' coincidencias';
                } else {
                    $result['error'] = 'No hay coincidencias';
                }
                break;
            case 'createRow':
                $_POST = Validator::validateForm($_POST);
                if (
<<<<<<< HEAD
                    !$administrador->setNombre($_POST[POST_NOMBRE]) or
                    !$administrador->setApellido($_POST[POST_APELLIDO]) or
                    !$administrador->setCorreo($_POST[POST_CORREO]) or
                    !$administrador->setUsuario($_POST[POST_USUARIO]) or
                    !$administrador->setContraseña($_POST[POST_CONTRASEÑA]) or
                    !$administrador->setEstado($_POST[POST_ESTADO])
                ) {
                    $result['error'] = $administrador->getDataError();
                } elseif ($_POST[POST_CONTRASEÑA] != $_POST[POST_CONFIRMAR_CONTRASEÑA]) {
                    $result['error'] = 'Contraseñas diferentes';
                } elseif ($administrador->createRow()) {
=======
                    !$administrador->setNombre($_POST['admin_nombre']) or
                    !$administrador->setApellido($_POST['admin_apellido']) or
                    !$administrador->setCorreo($_POST['admin_correo']) or
                    !$administrador->setUsuario($_POST['admin_usuario']) or
                    !$administrador->setContraseña($_POST['admin_contraseña']) or
                    !$administrador->setEstado($_POST['admin_estado']) or
                    !$administrador->setTipoAdminId($_POST['tipoadmin_id'])
                ) {
                    $result['error'] = $administrador->getDataError();
                } elseif ($administrador->createRows()) {
>>>>>>> 7ebfda988741ce42f101ccd37e8cdc7cba5ec532
                    $result['status'] = 1;
                    $result['message'] = 'Administrador creado correctamente';
                } else {
                    $result['error'] = 'Ocurrió un problema al crear el administrador';
                }
                break;
            case 'readAll':
                if ($result['dataset'] = $administrador->readAll()) {
                    $result['status'] = 1;
                    $result['message'] = 'Existen ' . count($result['dataset']) . ' registros';
                } else {
                    $result['error'] = 'No existen administradores registrados';
                }
                break;
            case 'readOne':
                if (!$administrador->setId($_POST[POST_ID])) {
                    $result['error'] = 'Administrador incorrecto';
                } elseif ($result['dataset'] = $administrador->readOne()) {
                    $result['status'] = 1;
                } else {
                    $result['error'] = 'Administrador inexistente';
                }
                break;
            case 'updateRow':
                $_POST = Validator::validateForm($_POST);
                if (
<<<<<<< HEAD
                    !$administrador->setId($_POST[POST_ID]) or
                    !$administrador->setNombre($_POST[POST_NOMBRE]) or
                    !$administrador->setApellido($_POST[POST_APELLIDO]) or
                    !$administrador->setCorreo($_POST[POST_CORREO]) or
                    !$administrador->setUsuario($_POST[POST_USUARIO]) or
                    !$administrador->setEstado($_POST[POST_ESTADO])
=======
                    !$administrador->setId($_POST['admin_id']) or
                    !$administrador->setNombre($_POST['admin_nombre']) or
                    !$administrador->setApellido($_POST['admin_apellido']) or
                    !$administrador->setCorreo($_POST['admin_correo']) or
                    !$administrador->setUsuario($_POST['admin_usuario']) or
                    !$administrador->setEstado($_POST['admin_estado']) or
                    !$administrador->setTipoAdminId($_POST['tipoadmin_id'])
>>>>>>> 7ebfda988741ce42f101ccd37e8cdc7cba5ec532
                ) {
                    $result['error'] = $administrador->getDataError();
                } elseif ($administrador->updateRow()) {
                    $result['status'] = 1;
                    $result['message'] = 'Administrador modificado correctamente';
                } else {
                    $result['error'] = 'Ocurrió un problema al modificar el administrador';
                }
                break;
            case 'updateRowPassword':
                $_POST = Validator::validateForm($_POST);
                if (
                    !$administrador->setId($_POST[POST_ID]) or
                    !$administrador->setNombre($_POST[POST_NOMBRE]) or
                    !$administrador->setApellido($_POST[POST_APELLIDO]) or
                    !$administrador->setCorreo($_POST[POST_CORREO]) or
                    !$administrador->setUsuario($_POST[POST_USUARIO]) or
                    !$administrador->setContraseña($_POST[POST_CONTRASEÑA]) or
                    !$administrador->setEstado($_POST[POST_ESTADO])
                ) {
                    $result['error'] = $administrador->getDataError();
                } elseif ($_POST[POST_CONTRASEÑA] != $_POST[POST_CONFIRMAR_CONTRASEÑA]) {
                    $result['error'] = 'Contraseñas diferentes';
                } elseif ($administrador->updateRowPassword()) {
                    $result['status'] = 1;
                    $result['message'] = 'Administrador modificado correctamente';
                } else {
                    $result['error'] = 'Ocurrió un problema al modificar el administrador';
                }
                break;
            case 'deleteRow':
                if ($_POST['admin_id'] == $_SESSION[POST_ID]) {
                    $result['error'] = 'No se puede eliminar a sí mismo';
                } elseif (!$administrador->setId($_POST[POST_ID])) {
                    $result['error'] = $administrador->getDataError();
                } elseif ($administrador->deleteRow()) {
                    $result['status'] = 1;
                    $result['message'] = 'Administrador eliminado correctamente';
                } else {
                    $result['error'] = 'Ocurrió un problema al eliminar el administrador';
                }
                break;
            case 'getUser':
                if (isset($_SESSION[POST_USUARIO])) {
                    $result['status'] = 1;
                    $result['username'] = $_SESSION[POST_USUARIO];
                } else {
                    $result['error'] = 'Usuario de administrador indefinido';
                }
                break;
            case 'logOut':
                if (session_destroy()) {
                    $result['status'] = 1;
                    $result['message'] = 'Sesión eliminada correctamente';
                } else {
                    $result['error'] = 'Ocurrió un problema al cerrar la sesión';
                }
                break;
            case 'readProfile':
                if ($result['dataset'] = $administrador->readProfile()) {
                    $result['status'] = 1;
                } else {
                    $result['error'] = 'Ocurrió un problema al leer el perfil';
                }
                break;
            case 'editProfile':
                $_POST = Validator::validateForm($_POST);
                if (
                    !$administrador->setNombre($_POST[POST_NOMBRE]) or
                    !$administrador->setApellido($_POST[POST_APELLIDO]) or
                    !$administrador->setCorreo($_POST[POST_CORREO]) or
                    !$administrador->setUsuario($_POST[POST_USUARIO])
                ) {
                    $result['error'] = $administrador->getDataError();
                } elseif ($administrador->editProfile()) {
                    $result['status'] = 1;
                    $result['message'] = 'Perfil modificado correctamente';
                    $_SESSION[POST_USUARIO] = $_POST[POST_USUARIO];
                } else {
                    $result['error'] = 'Ocurrió un problema al modificar el perfil';
                }
                break;
            case 'changePassword':
                $_POST = Validator::validateForm($_POST);
                if (!$administrador->checkPassword($_POST['clave_actual'])) {
                    $result['error'] = 'Contraseña actual incorrecta';
                } elseif ($_POST['clave_nueva'] != $_POST['confirmar_clave']) {
                    $result['error'] = 'Confirmación de contraseña diferente';
                } elseif (!$administrador->setContraseña($_POST['clave_nueva'])) {
                    $result['error'] = $administrador->getDataError();
                } elseif ($administrador->changePassword()) {
                    $result['status'] = 1;
                    $result['message'] = 'Contraseña cambiada correctamente';
                } else {
                    $result['error'] = 'Ocurrió un problema al cambiar la contraseña';
                }
                break;
                case 'changeStatus':
                    if (
                        !$administrador->setId($_POST[POST_ID])
                    ) {
                        $result['error'] = $administrador->getDataError();
                    } elseif ($administrador->changeStatus()) {
                        $result['status'] = 1;
                        $result['message'] = 'Categoría cambiada correctamente';
                    } else {
                        $result['error'] = 'Ocurrió un problema al cambiar la categoría';
                    }
                    break;
            default:
                $result['error'] = 'Acción no disponible dentro de la sesión';
        }
    } else {
        switch ($_GET['action']) {
            case 'readUsers':
                if ($administrador->readAll()) {
                    $result['status'] = 1;
                    $result['message'] = 'Debe autenticarse para ingresar';
                } else {
                    $result['error'] = 'Debe crear un administrador para comenzar';
                }
                break;
            case 'signUp':
                $_POST = Validator::validateForm($_POST);
                if (
                    !$administrador->setNombre($_POST[POST_NOMBRE]) or
                    !$administrador->setApellido($_POST[POST_APELLIDO]) or
                    !$administrador->setCorreo($_POST[POST_CORREO]) or
                    !$administrador->setUsuario($_POST[POST_USUARIO]) or
                    !$administrador->setContraseña($_POST[POST_CONTRASEÑA]) or
                    !$administrador->setEstado(1)
                    
                ) {
                    $result['error'] = $administrador->getDataError();
                } elseif ($_POST[POST_CONTRASEÑA] != $_POST[POST_CONFIRMAR_CONTRASEÑA]) {
                    $result['error'] = 'Contraseñas diferentes';
                } elseif ($administrador->createRow()) {
                    $result['status'] = 1;
                    $result['message'] = 'Administrador registrado correctamente';
                } else {
                    $result['error'] = 'Ocurrió un problema al registrar el administrador';
                }
                break;
            case 'logIn':
                $_POST = Validator::validateForm($_POST);
                if ($administrador->checkUser($_POST[POST_USUARIO], $_POST[POST_CONTRASEÑA])) {
                    $result['status'] = 1;
                    $result['message'] = 'Autenticación correcta';
                } else {
                    $result['error'] = 'Credenciales incorrectas';
                }
                break;
            default:
                $result['error'] = 'Acción no disponible fuera de la sesión';
        }
    }

    $result['exception'] = Database::getException();
    header('Content-type: application/json; charset=utf-8');
    print(json_encode($result));
} else {
    print(json_encode('Recurso no disponible'));
}

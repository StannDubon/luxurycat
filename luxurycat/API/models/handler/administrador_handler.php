<?php
// Se incluye la clase para trabajar con la base de datos.
require_once('../../helpers/database.php');
/*
 *  Clase para manejar el comportamiento de los datos de la tabla administrador.
 */
class AdministradorHandler
{
    /*
     *  Declaración de atributos para el manejo de datos.
     */
    protected $id = null;
    protected $nombre = null;
    protected $apellido = null;
    protected $correo = null;
    protected $usuario = null;
    protected $contraseña = null;

    /*
     *  Métodos para gestionar la cuenta del administrador.
     */
    public function checkUser($username, $password)
    {
        $sql = 'SELECT admin_id, admin_usuario, admin_cotraseña
                FROM tb_administrador
                WHERE admin_usuario = ?';
        $params = array($username);
        if (!($data = Database::getRow($sql, $params))) {
            return false;
        } elseif (password_verify($password, $data['admin_cotraseña'])) {
            $_SESSION['admin_id'] = $data['admin_id'];
            $_SESSION['admin_usuario'] = $data['admin_usuario'];
            return true;
        } else {
            return false;
        }
    }

    public function checkPassword($password)
    {
        $sql = 'SELECT admin_cotraseña
                FROM tb_administrador
                WHERE admin_id = ?';
        $params = array($_SESSION['admin_id']);
        $data = Database::getRow($sql, $params);
        // Se verifica si la contraseña coincide con el hash almacenado en la base de datos.
        if (password_verify($password, $data['admin_cotraseña'])) {
            return true;
        } else {
            return false;
        }
    }

    public function changePassword()
    {
        $sql = 'UPDATE tb_administrador
                SET admin_cotraseña = ?
                WHERE admin_id = ?';
        $params = array($this->contraseña, $_SESSION['admin_id']);
        return Database::executeRow($sql, $params);
    }

    public function readProfile()
    {
        $sql = 'SELECT admin_id, admin_nombre, admin_apellido, admin_correo, admin_usuario
                FROM tb_administrador
                WHERE admin_id = ?';
        $params = array($_SESSION['admin_id']);
        return Database::getRow($sql, $params);
    }

    public function editProfile()
    {
        $sql = 'UPDATE tb_administrador
                SET admin_nombre = ?, admin_apellido = ?, admin_correo = ?, admin_usuario = ?
                WHERE admin_id = ?';
        $params = array($this->nombre, $this->apellido, $this->correo, $this->usuario, $_SESSION['admin_id']);
        return Database::executeRow($sql, $params);
    }

    /*
     *  Métodos para realizar las operaciones SCRUD (search, create, read, update, and delete).
     */
    public function searchRows()
    {
        $value = '%' . Validator::getSearchValue() . '%';
        $sql = 'SELECT admin_id, admin_nombre, admin_apellido, admin_correo, admin_usuario
                FROM tb_administrador
                WHERE admin_apellido LIKE ? OR admin_nombre LIKE ?
                ORDER BY admin_apellido';
        $params = array($value, $value);
        return Database::getRows($sql, $params);
    }

    public function createRow()
    {
        $sql = 'INSERT INTO tb_administrador(admin_nombre, admin_apellido, admin_correo, admin_usuario, admin_cotraseña)
                VALUES(?, ?, ?, ?, ?)';
        $params = array($this->nombre, $this->apellido, $this->correo, $this->usuario, $this->contraseña);
        return Database::executeRow($sql, $params);
    }

    public function readAll()
    {
        $sql = 'SELECT admin_id, admin_nombre, admin_apellido, admin_correo, admin_usuario
                FROM tb_administrador
                ORDER BY admin_apellido';
        return Database::getRows($sql);
    }

    public function readOne()
    {
        $sql = 'SELECT admin_id, admin_nombre, admin_apellido, admin_correo, admin_usuario
                FROM tb_administrador
                WHERE admin_id = ?';
        $params = array($this->id);
        return Database::getRow($sql, $params);
    }

    public function updateRow()
    {
        $sql = 'UPDATE tb_administrador
                SET admin_nombre = ?, admin_apellido = ?, admin_correo = ?
                WHERE admin_id = ?';
        $params = array($this->nombre, $this->apellido, $this->correo, $this->id);
        return Database::executeRow($sql, $params);
    }

    public function deleteRow()
    {
        $sql = 'DELETE FROM tb_administrador
                WHERE admin_id = ?';
        $params = array($this->id);
        return Database::executeRow($sql, $params);
    }
}

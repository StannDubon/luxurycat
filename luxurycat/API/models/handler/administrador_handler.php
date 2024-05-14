
<?php
// Se incluye la clase para trabajar con la base de datos.
require_once('../../helpers/database.php');
/*
 *  Clase para manejar el comportamiento de los datos de la tabla administrador.
 */
class administradorHandler
{
    /*
     *  Declaración de atributos para el manejo de datos.
     */
    protected $admin_id = null;
    protected $admin_nombre = null;
    protected $admin_apellido = null;
    protected $admin_usuario = null;
    protected $admin_cotraseña = null;
    protected $admin_correo = null;
    protected $admin_estado = null;
    protected $tipo_admin_id = null;
    protected $imagen_administrador = null;

    /*
     *  Métodos para realizar las operaciones SCRUD (search, create, read, update, and delete).
     */
    public function searchRows()
    {
        $value = '%' . Validator::getSearchValue() . '%';
        $sql = 'SELECT * FROM tb_administrador where admin_nombre OR admin_usuario LIKE ?';
        $params = array($value);
        return Database::getRows($sql, $params);
    }

    public function createRow()
    {
        $sql = 'CALL InsertarAdministrador(?,?,?,?,?,?,?,?);';

        $params = array($this->admin_nombre, $this->admin_apellido, $this->admin_usuario,
         $this->admin_cotraseña, $this->admin_correo, $this->admin_estado, $this->tipo_admin_id,
          $this->imagen_administrador);
        return Database::executeRow($sql, $params);
    }

    public function readAll()
    {
        $sql = 'SELECT * FROM tb_administrador';
        return Database::getRows($sql);
    }

    public function readOne()
    {
        $sql = 'SELECT * FROM tb_administrador WHERE admin_id= ?';
        $params = array($this->admin_id);
        return Database::getRow($sql, $params);
    }

    public function updateRow()
    {
        $sql = 'UPDATE tb_administrador
                SET admin_nombre = ?, admin_apellido = ?, admin_usuario = ?, admin_cotraseña = ?,
                admin_correo = ?, admin_estado = ?, tipo_admin_id = ?, imagen_administrador = ?
                WHERE admin_id = ?';
        $params = array($this->admin_nombre, $this->admin_apellido, $this->admin_usuario,
         $this->admin_cotraseña, $this->admin_correo, $this->admin_estado, $this->tipo_admin_id,
          $this->imagen_administrador, $this->admin_id);
        return Database::executeRow($sql, $params);
    }

    public function deleteRow()
    {
        $sql = 'DELETE FROM tb_administrador
                WHERE admin_id = ?';
        $params = array($this->admin_id);
        return Database::executeRow($sql, $params);
    }
}

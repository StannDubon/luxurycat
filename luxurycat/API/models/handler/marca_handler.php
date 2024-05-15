
<?php
// Se incluye la clase para trabajar con la base de datos.
require_once('../../helpers/database.php');
/*
 *  Clase para manejar el comportamiento de los datos de la tabla administrador.
 */
class MarcaHandler
{
    /*
     *  Declaración de atributos para el manejo de datos.
     */
    protected $marca_id = null;
    protected $marca_nombre = null;
    protected $marca_estado = null;

    /*
     *  Métodos para realizar las operaciones SCRUD (search, create, read, update, and delete).
     */
    public function searchRows()
    {
        $value = '%' . Validator::getSearchValue() . '%';
        $sql = 'SELECT * FROM tb_marca where marca_nombre LIKE ?';
        $params = array($value);
        return Database::getRows($sql, $params);
    }

    public function createRow()
    {
        $sql = 'Insert into tb_marca(marca_nombre) Values(?);';

        $params = array($this->marca_nombre);
        return Database::executeRow($sql, $params);
    }

    public function readAll()
    {
        $sql = 'SELECT * FROM tb_marca';
        return Database::getRows($sql);
    }

    public function readOne()
    {
        $sql = 'SELECT * FROM tb_marca WHERE marca_id= ?';
        $params = array($this->marca_id);
        return Database::getRow($sql, $params);
    }

    public function updateRow()
    {
        $sql = 'UPDATE tb_marca
                SET marca_nombre = ?
                WHERE marca_id = ?';
        $params = array($this->marca_nombre, $this->marca_id);
        return Database::executeRow($sql, $params);
    }

    public function deleteRow()
    {
        $sql = 'DELETE FROM tb_marca
                WHERE marca_id = ?';
        $params = array($this->marca_id);
        return Database::executeRow($sql, $params);
    }

    //Función para cambiar el estado de una marca.
    public function changeState()
    {
        $sql = 'CALL cambiar_estado_marca(?);';
        $params = array($this->marca_id);
        return Database::executeRow($sql, $params);
    }
}

<?php
// Se incluye la clase para trabajar con la base de datos.
require_once('../../helpers/database.php');
/*
 *  Clase para manejar el comportamiento de los datos de la tabla CATEGORIA.
 */
class CategoriaHandler
{
    /*
     *  Declaración de atributos para el manejo de datos.
     */
    protected $categoria_id  = null;
    protected $categoria_nombre  = null;
    protected $categoria_descripcion  = null;
    protected $categoria_imagen  = null;
    protected $categoria_estado   = null;

    // Constante para establecer la ruta de las imágenes.
    const RUTA_IMAGEN = '../../images/categorias/';

    /*
     *  Métodos para realizar las operaciones SCRUD (search, create, read, update, and delete).
     */
    public function searchRows()
    {
        $value = '%' . Validator::getSearchValue() . '%';
        $sql = 'SELECT categoria_id, categoria_nombre, categoria_descripcion, categoria_imagen, categoria_estado
                FROM tb_categorias
                WHERE categoria_nombre LIKE ? OR categoria_descripcion LIKE ?
                ORDER BY nombre_categoria';
        $params = array($value, $value);
        return Database::getRows($sql, $params);
    }

    public function createRow()
    {
        $sql = 'INSERT INTO tb_categorias(categoria_nombre, categoria_imagen, categoria_descripcion)
                VALUES(?, ?, ?)';
        $params = array($this->categoria_nombre, $this->categoria_imagen, $this->categoria_descripcion);
        return Database::executeRow($sql, $params);
    }

    public function readAll()
    {
        $sql = 'SELECT categoria_id, categoria_nombre, categoria_imagen, categoria_descripcion
                FROM tb_categorias
                ORDER BY categoria_nombre';
        return Database::getRows($sql);
    }

    public function readOne()
    {
        $sql = 'SELECT categoria_id, categoria_nombre, categoria_imagen, categoria_descripcion
                FROM tb_categorias
                WHERE categoria_id = ?';
        $params = array($this->categoria_id);
        return Database::getRow($sql, $params);
    }

    public function readFilename()
    {
        $sql = 'SELECT categoria_imagen
                FROM tb_categorias
                WHERE categoria_id = ?';
        $params = array($this->categoria_id);
        return Database::getRow($sql, $params);
    }

    public function updateRow()
    {
        $sql = 'UPDATE tb_categorias
                SET categoria_imagen = ?, categoria_nombre = ?, categoria_descripcion = ?
                WHERE categoria_id = ?';
        $params = array($this->categoria_imagen, $this->categoria_nombre, $this->categoria_descripcion, $this->categoria_id);
        return Database::executeRow($sql, $params);
    }

    public function deleteRow()
    {
        $sql = 'DELETE FROM tb_categorias
                WHERE categoria_id = ?';
        $params = array($this->categoria_id);
        return Database::executeRow($sql, $params);
    }
}

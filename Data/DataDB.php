<?php
class ConexionBD {
    private static $instancia = null;
    private $conexion;

    private $server = "localhost";
    private $user = "root";
    private $pass = "";
    private $db = "Inventario";

    private function __construct() {
        $this->conexion = new mysqli($this->server, $this->user, $this->pass, $this->db);

        if ($this->conexion->connect_error) {
            die("Conexión fallida: " . $this->conexion->connect_error);
        }
    }

    public static function getInstancia() {
        if (self::$instancia === null) {
            self::$instancia = new ConexionBD();
        }
        return self::$instancia;
    }

    public function getConexion() {
        return $this->conexion;
    }
}
?>

<?php
class Equipo {
    private $conexion;

    public function __construct($conexion) {
        $this->conexion = $conexion;
    }

    public function obtenerResumen($id) {
        $sql = "SELECT id, serial, placa_proveedor, asignado_a FROM Equipos WHERE id = ?";
        $stmt = $this->conexion->prepare($sql);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        return $stmt->get_result()->fetch_assoc();
    }

    public function obtenerDetalles($id) {
        $sql = "SELECT * FROM Equipos WHERE id = ?";
        $stmt = $this->conexion->prepare($sql);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        return $stmt->get_result()->fetch_assoc();
    }

    public function actualizarCompleto(
        $id,
        $serial,
        $placa_proveedor,
        $asignado_a,
        $estado,
        $empresa,
        $co,
        $ciudad,
        $area,
        $nombre_equipo,
        $usuario,
        $fabricante,
        $tipo_computador,
        $marca_procesador,
        $generacion_procesador,
        $velocidad_procesador,
        $ram,
        $tipo_disco,
        $windows,
        $dispositivos_wifi,
        $propietario
    ) {
        $sql = "UPDATE Equipos SET
                    serial = ?, 
                    placa_proveedor = ?, 
                    asignado_a = ?, 
                    estado = ?, 
                    empresa = ?, 
                    co = ?, 
                    ciudad = ?, 
                    area = ?, 
                    nombre_equipo = ?, 
                    usuario = ?, 
                    fabricante = ?, 
                    tipo_computador = ?, 
                    marca_procesador = ?, 
                    generacion_procesador = ?, 
                    velocidad_procesador = ?, 
                    ram = ?, 
                    tipo_disco = ?, 
                    windows = ?, 
                    dispositivos_wifi = ?, 
                    propietario = ?
                WHERE id = ?";
        $stmt = $this->conexion->prepare($sql);
        if (!$stmt) return false;

        $stmt->bind_param(
            "ssssssssssssssssssssi",
            $serial,
            $placa_proveedor,
            $asignado_a,
            $estado,
            $empresa,
            $co,
            $ciudad,
            $area,
            $nombre_equipo,
            $usuario,
            $fabricante,
            $tipo_computador,
            $marca_procesador,
            $generacion_procesador,
            $velocidad_procesador,
            $ram,
            $tipo_disco,
            $windows,
            $dispositivos_wifi,
            $propietario,
            $id
        );

        return $stmt->execute();
    }
}

<?php
require "../DataDB.php";
require "./Equipo.php";

if (!isset($_COOKIE["NameUserM"]) || !isset($_COOKIE["RoleDB"])) {
    header("Location: ../../index.php");
    exit();
}

$conexion = ConexionBD::getInstancia()->getConexion();
$equipoRepo = new Equipo($conexion);

// validar id en GET
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    echo "ID inválido.";
    exit();
}

$id_equipo = (int)$_GET['id'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // tomar id desde hidden (si está) o desde GET
    $post_id = isset($_POST['id_equipo']) ? (int)$_POST['id_equipo'] : $id_equipo;

    // recoger todos los campos (trim para limpieza mínima)
    $serial = trim($_POST['serial'] ?? '');
    $placa_proveedor = trim($_POST['placa_proveedor'] ?? '');
    $asignado_a = trim($_POST['asignado_a'] ?? '');
    $estado = trim($_POST['estado'] ?? '');
    $empresa = trim($_POST['empresa'] ?? '');
    $co = trim($_POST['co'] ?? '');
    $ciudad = trim($_POST['ciudad'] ?? '');
    $area = trim($_POST['area'] ?? '');
    $nombre_equipo = trim($_POST['nombre_equipo'] ?? '');
    $usuario = trim($_POST['usuario'] ?? '');
    $fabricante = trim($_POST['fabricante'] ?? '');
    $tipo_computador = trim($_POST['tipo_computador'] ?? '');
    $marca_procesador = trim($_POST['marca_procesador'] ?? '');
    $generacion_procesador = trim($_POST['generacion_procesador'] ?? '');
    $velocidad_procesador = trim($_POST['velocidad_procesador'] ?? '');
    $ram = trim($_POST['ram'] ?? '');
    $tipo_disco = trim($_POST['tipo_disco'] ?? '');
    $windows = trim($_POST['windows'] ?? '');
    $dispositivos_wifi = trim($_POST['dispositivos_wifi'] ?? '');
    $propietario = trim($_POST['propietario'] ?? '');

    // Ejecutar actualización
    $ok = $equipoRepo->actualizarCompleto(
        $post_id,
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
    );

    if ($ok) {
        // Redirigir a la lista (evita reenvío al refrescar)
        header("Location: ../../Equipos.php");
        exit();
    } else {
        $errorMensaje = "Error al actualizar el equipo. Revisa la conexión o los datos.";
        // continúa y muestra formulario con mensaje de error
    }
}

// Cargar datos actuales (para mostrar en el formulario)
$equipo = $equipoRepo->obtenerResumen($id_equipo);
$detalles = $equipoRepo->obtenerDetalles($id_equipo);

if (!$equipo || !$detalles) {
    echo "Equipo no encontrado.";
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" href="../../IMG/Logo.png" type="image/x-icon"> 
    <title>Detalle del Equipo - Inventory+</title>
    <link rel="stylesheet" href="../../CSS/StyleEditors.css" />
</head>
<body>
<header>
    <nav>
        <div class="DivNavLogo">
            <img src="../../IMG/Logo.png" alt="" class="LogoNav" />
        </div>
        <div class="DivNav">
            <div class="DivButtonsNav1">
                <a href="../../Index.php"><button class="ButtonNav">INICIO</button></a>

                <?php if (isset($_COOKIE["NameUserM"])): ?>
                    <?php if (isset($_COOKIE["RoleDB"]) && $_COOKIE["RoleDB"] == "Administrador"): ?>
                        <a href="../../Usuarios.php"><button class="ButtonNav">USUARIOS</button></a>
                    <?php endif; ?>

                    <a href="../../Equipos.php"><button class="ButtonNav">EQUIPOS</button></a>
                    <a href="../../Inventario.php"><button class="ButtonNav">INVENTARIO</button></a>
                <?php endif; ?>
            </div>
            <div class="DivButtonsNav2">
                <?php if (isset($_COOKIE["NameUserM"])): ?>
                    <a href="../../Data/LogOut.php"><button class="ButtonNav">CERRAR SESIÓN</button></a>
                <?php else: ?>
                    <a href="../../LoginPage.php"><button class="ButtonNav">INICIAR SESIÓN</button></a>
                <?php endif; ?>
            </div>
        </div>
    </nav>
</header>

<section>
    <article>
        <div class="DivPrincipal">
            <h1 class="MainTittle">Detalle del Equipo</h1>

            <?php if (!empty($errorMensaje)): ?>
                <p style="color: #ff8080;"><?php echo htmlspecialchars($errorMensaje); ?></p>
            <?php endif; ?>

            <form method="POST" action="">
                <!-- hidden id para identificar en POST -->
                <input type="hidden" name="id_equipo" value="<?php echo htmlspecialchars($detalles['id']); ?>">

                <div class="form-section">
                    <h3>Información General</h3>
                    <div class="form-grid">
                        <div>
                            <label>ID</label>
                            <input type="text" name="id_display" value="<?php echo htmlspecialchars($detalles['id']); ?>" readonly>
                        </div>
                        <div>
                            <label>Serial</label>
                            <input type="text" name="serial" value="<?php echo htmlspecialchars($detalles['serial']); ?>">
                        </div>
                        <div>
                            <label>Placa Proveedor</label>
                            <input type="text" name="placa_proveedor" value="<?php echo htmlspecialchars($detalles['placa_proveedor']); ?>">
                        </div>
                        <div>
                            <label>Asignado a</label>
                            <input type="text" name="asignado_a" value="<?php echo htmlspecialchars($detalles['asignado_a']); ?>">
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h3>Detalles del Equipo</h3>
                    <div class="form-grid">
                        <div>
                            <label>Estado</label>
                            <select name="estado">
                                <option value="Asignado" <?php if ($detalles['estado'] == 'Asignado') echo 'selected'; ?>>Asignado</option>
                                <option value="Disponible" <?php if ($detalles['estado'] == 'Disponible') echo 'selected'; ?>>Disponible</option>
                                <option value="En reparación" <?php if ($detalles['estado'] == 'En reparación') echo 'selected'; ?>>En reparación</option>
                            </select>
                        </div>
                        <div>
                            <label>Empresa</label>
                            <select name="empresa">
                                <option value="MaxiCassa" <?php if ($detalles['empresa'] == 'MaxiCassa') echo 'selected'; ?>>MaxiCassa</option>
                                <option value="Otra" <?php if ($detalles['empresa'] == 'Otra') echo 'selected'; ?>>Otra</option>
                            </select>
                        </div>
                        <div>
                            <label>CO</label>
                            <select name="co">
                                <option value="99" <?php if ($detalles['co'] == '99') echo 'selected'; ?>>99</option>
                                <option value="98" <?php if ($detalles['co'] == '98') echo 'selected'; ?>>98</option>
                            </select>
                        </div>
                        <div>
                            <label>Ciudad</label>
                            <select name="ciudad">
                                <option value="Bogota" <?php if ($detalles['ciudad'] == 'Bogota') echo 'selected'; ?>>Bogota</option>
                                <option value="Medellin" <?php if ($detalles['ciudad'] == 'Medellin') echo 'selected'; ?>>Medellín</option>
                            </select>
                        </div>
                        <div>
                            <label>Área</label>
                            <select name="area">
                                <option value="Sistemas" <?php if ($detalles['area'] == 'Sistemas') echo 'selected'; ?>>Sistemas</option>
                                <option value="Soporte" <?php if ($detalles['area'] == 'Soporte') echo 'selected'; ?>>Soporte</option>
                            </select>
                        </div>
                        <div>
                            <label>Nombre Equipo</label>
                            <input type="text" name="nombre_equipo" value="<?php echo htmlspecialchars($detalles['nombre_equipo']); ?>">
                        </div>
                        <div>
                            <label>Usuario</label>
                            <input type="text" name="usuario" value="<?php echo htmlspecialchars($detalles['usuario']); ?>">
                        </div>
                        <div>
                            <label>Fabricante</label>
                            <select name="fabricante">
                                <option value="HP" <?php if ($detalles['fabricante'] == 'HP') echo 'selected'; ?>>HP</option>
                                <option value="Dell" <?php if ($detalles['fabricante'] == 'Dell') echo 'selected'; ?>>Dell</option>
                                <option value="Lenovo" <?php if ($detalles['fabricante'] == 'Lenovo') echo 'selected'; ?>>Lenovo</option>
                            </select>
                        </div>
                        <div>
                            <label>Tipo de Computador</label>
                            <select name="tipo_computador">
                                <option value="Laptop" <?php if ($detalles['tipo_computador'] == 'Laptop') echo 'selected'; ?>>Laptop</option>
                                <option value="Desktop" <?php if ($detalles['tipo_computador'] == 'Desktop') echo 'selected'; ?>>Desktop</option>
                            </select>
                        </div>
                        <div>
                            <label>Marca Procesador</label>
                            <select name="marca_procesador">
                                <option value="Intel" <?php if ($detalles['marca_procesador'] == 'Intel') echo 'selected'; ?>>Intel</option>
                                <option value="AMD" <?php if ($detalles['marca_procesador'] == 'AMD') echo 'selected'; ?>>AMD</option>
                            </select>
                        </div>
                        <div>
                            <label>Generación Procesador</label>
                            <select name="generacion_procesador">
                                <option value="I5-10400U" <?php if ($detalles['generacion_procesador'] == 'I5-10400U') echo 'selected'; ?>>I5-10400U</option>
                                <option value="Ryzen-5-5600G" <?php if ($detalles['generacion_procesador'] == 'Ryzen-5-5600G') echo 'selected'; ?>>Ryzen-5-5600G</option>
                            </select>
                        </div>
                        <div>
                            <label>Velocidad Procesador</label>
                            <input type="text" name="velocidad_procesador" value="<?php echo htmlspecialchars($detalles['velocidad_procesador']); ?>">
                        </div>
                        <div>
                            <label>RAM</label>
                            <select name="ram">
                                <option value="8" <?php if ($detalles['ram'] == '8') echo 'selected'; ?>>8</option>
                                <option value="16" <?php if ($detalles['ram'] == '16') echo 'selected'; ?>>16</option>
                                <option value="32" <?php if ($detalles['ram'] == '32') echo 'selected'; ?>>32</option>
                            </select>
                        </div>
                        <div>
                            <label>Tipo de Disco</label>
                            <select name="tipo_disco">
                                <option value="HDD" <?php if ($detalles['tipo_disco'] == 'HDD') echo 'selected'; ?>>HDD</option>
                                <option value="SSD" <?php if ($detalles['tipo_disco'] == 'SSD') echo 'selected'; ?>>SSD</option>
                            </select>
                        </div>
                        <div>
                            <label>Windows</label>
                            <select name="windows">
                                <option value="Windows 10 Pro" <?php if ($detalles['windows'] == 'Windows 10 Pro') echo 'selected'; ?>>Windows 10 Pro</option>
                                <option value="Windows 11" <?php if ($detalles['windows'] == 'Windows 11') echo 'selected'; ?>>Windows 11</option>
                            </select>
                        </div>
                        <div>
                            <label>Dispositivos Wi-Fi</label>
                            <select name="dispositivos_wifi">
                                <option value="SI" <?php if ($detalles['dispositivos_wifi'] == 'SI') echo 'selected'; ?>>SI</option>
                                <option value="NO" <?php if ($detalles['dispositivos_wifi'] == 'NO') echo 'selected'; ?>>NO</option>
                            </select>
                        </div>
                        <div>
                            <label>Propietario</label>
                            <select name="propietario">
                                <option value="Makrosoft" <?php if ($detalles['propietario'] == 'Makrosoft') echo 'selected'; ?>>Makrosoft</option>
                                <option value="Otra" <?php if ($detalles['propietario'] == 'Otra') echo 'selected'; ?>>Otra</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-actions">
                    <button type="submit" class="save-btn">Guardar Cambios</button>
                    <a href="../../Equipos.php" class="cancel-btn">Cancelar</a>
                </div>
            </form>

        </div>
    </article>
</section>

</body>
<footer>
    <p>By Jhojan Danilo</p>
</footer>
</html>
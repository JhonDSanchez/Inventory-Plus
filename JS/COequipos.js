const datos = {
    "MaxiCassa": {
        "99 - UAC MaxiCassa": "Bogotá",
        "102 - MAX AVENIDA 68": "Bogotá",
        "103 - MAX SUBA": "Bogotá",
        "105 - MAX SOACHA": "Bogotá",
        "126 - CERA AVENIDA 68": "Bogotá",
        "128 - CERA SOACHA": "Bogotá",
        "151 - MAX GIRARDOT": "Girardot",
        "201 - MAX CALI": "Cali",
        "202 - MAX CAMBULOS": "Cali",
        "222 - MAX TULUA": "Tuluá",
        "223 - CERA TULUA": "Tuluá",
        "401 - MAX AV COLOMBIA": "Medellín",
        "402 - MAX BELLO": "Bello",
        "403 - MAX APARTADO": "Apartadó",
        "404 - MAX RIONEGRO": "Rionegro",
        "406 - MAX INDUSTRIALES": "Medellín",
        "431 - MAX TURBO": "Turbo",
        "441 - MAX MONTERIA AV CIRCUNVALAR": "Montería",
        "456 - CERA MONTERIA CENTRO": "Montería",
        "457 - MAX MONTERIA CENTRO": "Montería",
        "501 - MAX BARRANQUILLA": "Barranquilla",
        "503 - CERA MONTES": "Barranquilla",
        "504 - MAX SOLEDAD": "Soledad",
        "511 - MAX CALLE 30": "Barranquilla",
        "521 - CERA ALCIBIA": "Cartagena",
        "522 - CERA MAGANGUE": "Magangué",
        "523 - CERA EL EDEN": "Cartagena",
        "524 - MAX CORDIALIDAD": "Cartagena",
        "525 - MAX MONTECARLO": "Magangué",
        "526 - CERA CORDIALIDAD": "Cartagena",
        "531 - MAX CARTAGENA": "Cartagena",
        "533 - MAX EL EDEN": "Cartagena",
        "534 - MAX LA HEROICA": "Cartagena",
        "535 - MAX TURBACO": "Turbaco",
        "541 - MAX SINCELEJO": "Sincelejo",
        "547 - MAX LORICA AV TRONCAL": "Lorica",
        "548 - CERA LORICA": "Lorica",
        "553 - MAX VALLEDUPAR": "Valledupar",
        "554 - MAX KENNEDY": "Valledupar",
        "555 - MAX AGUACHICA": "Aguachica",
        "556 - CERA VALLEDUPAR": "Valledupar",
        "571 - MAX SANTA MARTA": "Santa Marta",
        "572 - MAX CIENAGA": "Ciénaga",
        "573 - MAX SANTA MARTA METROPOLIS": "Santa Marta",
        "591 - MAX RIOHACHA PARAISO": "Riohacha",
        "596 - MAX RIOHACHA AV CUELLAR": "Riohacha",
        "601 - MAX PEREIRA": "Pereira",
        "641 - MAX ARMENIA": "Armenia",
        "671 - MAX MANIZALES": "Manizales",
        "701 - MAX BUCARAMANGA": "Bucaramanga",
        "721 - MAX LA AURORA": "Bucaramanga",
        "722 - MAX LA ROSITA": "Bucaramanga",
        "742 - MAX ATALAYA": "Cúcuta",
        "751 - MAX PIEDECUESTA": "Piedecuesta",
        "801 - MAX TUNJA REAL": "Tunja",
        "802 - MAX DUITAMA": "Duitama",
        "803 - MAX SOGAMOSO": "Sogamoso",
        "804 - MAX SOGAMOSO TERMINAL": "Sogamoso",
        "821 - CERA JARDIN": "Ibagué",
        "822 - MAX IBAGUE": "Ibagué",
        "836 - MAX VILLAVICENCIO": "Villavicencio",
        "837 - MAX ACACIAS": "Acacías"
    },
    "Tu Cassa": {
        "1": "Hola",
    },
    "PegoMax": {
        "2": "Hola",
    },
    "Innova Pack": {
        "3": "Hola",
    },
    "Max Construcciones": {
        "4": "Hola",
    }
};

    const empresaSelect = document.getElementById("empresa");
    const coSelect = document.getElementById("co");
    const ciudadInput = document.getElementById("ciudad");

    // Cuando cambia la empresa, cargamos los CO
    empresaSelect.addEventListener("change", () => {
        const empresa = empresaSelect.value;
        coSelect.innerHTML = '<option value="">-- Selecciona un CO --</option>';
        ciudadInput.value = "";

        if (empresa && datos[empresa]) {
            Object.keys(datos[empresa]).forEach(co => {
                const option = document.createElement("option");
                option.value = co;
                option.textContent = co;
                coSelect.appendChild(option);
            });
        }
    });

    // Cuando cambia el CO, mostramos la ciudad correspondiente
    coSelect.addEventListener("change", () => {
        const empresa = empresaSelect.value;
        const co = coSelect.value;
        ciudadInput.value = (empresa && co) ? datos[empresa][co] : "";
    });
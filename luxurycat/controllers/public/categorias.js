// Constantes para completar las rutas de la API.
const CATEGORIA_API = "services/public/categoria.php";

// Método del evento para cuando el documento ha cargado.
document.addEventListener("DOMContentLoaded", () => {
    // Llamada a la función para llenar la tabla con los registros existentes.
    fillCards();
  });


async function fillCards() {
    const productCardsContainer = document.getElementById('productos_card_container');
    try {
        productCardsContainer.innerHTML = '';
        // Petición para obtener los registros disponibles.
        const DATA = await fetchData(CATEGORIA_API, "readAll");
        console.log(DATA);

        if (DATA.status) {
            // Mostrar cartas de productos obtenidos de la API
            DATA.dataset.forEach(product => {
                const cardHtml = ` 
                <div class="producto_card info">
                <img src="${SERVER_URL}imagenes/productos/${product.producto_imagen}"
                    alt="${product.producto_nombre}">
                <div class="producto_card_informacion">
                    <p class="producto_card_name">
                    ${product.producto_nombre}</p>
                    <p class="producto_card_descripcion">
                    ${product.producto_descripcion}</p>
                    <p class="producto_card_precio">
                        $${product.producto_precio}</p>
                    <button type="button" class="producto_card_action" onclick="saveCart(${product.producto_id})">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                            style="fill: #fff;">
                            <path
                                d="M21 4H2v2h2.3l3.521 9.683A2.004 2.004 0 0 0 9.7 17H18v-2H9.7l-.728-2H18c.4 0 .762-.238.919-.606l3-7A.998.998 0 0 0 21 4z">
                            </path>
                            <circle cx="10.5" cy="19.5" r="1.5"></circle>
                            <circle cx="16.5" cy="19.5" r="1.5"></circle>
                        </svg>
                    </button>
                </div>
                </div>                    
                `;
                productCardsContainer.innerHTML += cardHtml;
            });
        } else {
            console.log("Error al obtener datos");
        }
    } catch (error) {
        console.error('Error al obtener datos de la API:', error);
    }
}

           

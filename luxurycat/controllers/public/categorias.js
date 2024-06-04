// Constantes para completar las rutas de la API.
const CATEGORIA_API = "services/public/categoria.php";
const VALORACIONES_API = "services/public/comentario.php";

// Constantes para establecer los elementos del componente Modal.
const SAVE_MODAL = new bootstrap.Modal("#exampleModal"),
  MODAL_TITLE = document.getElementById("exampleModalLabel");

// Método del evento para cuando el documento ha cargado.
document.addEventListener("DOMContentLoaded", () => {
  // Llamada a la función para llenar la tabla con los registros existentes.
  fillCards();
});

async function fillCards() {
  const productCardsContainer = document.getElementById(
    "productos_card_container"
  );
  try {
    productCardsContainer.innerHTML = "";
    // Petición para obtener los registros disponibles.
    const DATA = await fetchData(CATEGORIA_API, "readAll");
    console.log(DATA);

    if (DATA.status) {
      // Mostrar cartas de productos obtenidos de la API
      DATA.dataset.forEach((product) => {
        const cardHtml = ` 
                <div class="producto_card info">
                <img src="${SERVER_URL}images/productos/${product.producto_imagen}"
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
                    <button type="button" class="" onclick="cargarComentarios(${product.producto_id}, '${product.producto_nombre}', '${product.producto_imagen}')">
                  Comentario
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
    console.error("Error al obtener datos de la API:", error);
  }
}

async function cargarComentarios(id, producto, imagen) {
  SAVE_MODAL.show();
  MODAL_TITLE.textContent = "Detalle del " + producto;
  const productCardsContainer = document.getElementById("comments");

  productCardsContainer.innerHTML = "";
  // Constante tipo objeto con los datos del producto seleccionado.
  const FORM = new FormData();
  FORM.append("idProducto", id);

  document.getElementById("fotoProducto").src = SERVER_URL.concat(
    "images/productos/",
    imagen
  );
  document.getElementById("nombreProducto").textContent = producto;

  // Petición para obtener los registros disponibles.
  const DATA = await fetchData(VALORACIONES_API, "readAll", FORM);
  console.log(DATA);

  if (DATA.status) {
    // Mostrar cartas de productos obtenidos de la API
    DATA.dataset.forEach((product) => {
      const cardHtml = `
                    <div class="col-lg-4 col-md-4 col-sm-12 text-center">
                        <div class="card carta">
                            <div class="card-body">
                                <h5 class="card-title">Usuario: ${product.cliente}</h5>
                                <p class="card-text">Comentario: ${product.comentario}</p>
                            </div>
                        </div>
                    </div>
                `;
      productCardsContainer.innerHTML += cardHtml;
    });
  } else {
    console.log("Error al obtener datos");
  }
}

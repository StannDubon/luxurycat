const HEADER = document.querySelector("header");

HEADER.innerHTML = `
<div class="menu">
<ion-icon name="menu-outline"></ion-icon>
<ion-icon name="close-outline"></ion-icon>
</div>

<div class="barra-lateral">
<div>
  <div class="nombre-pagina">
    <img
      src="../../resources/svg/logo.svg"
      alt=""
      id="cloud"
      name="cloud-outline"
    />
    <span>LuxuryCat</span>
  </div>
</div>

<nav class="navegacion">
  <ul class="ul-fixed">
    <li>
      <a href="index.html" id="sidebar-cat-marcas">
        <ion-icon name="storefront-outline"></ion-icon>
        <span>Dashboard</span>
      </a>
    </li>
    <li>
      <a href="carrito.html" id="sidebar-cat-dashboard">
        <ion-icon name="grid-outline"></ion-icon>
        <span>Carrito</span>
      </a>
    </li>
    <li>
      <a href="categorias.html" id="sidebar-cat-productos">
        <ion-icon name="bag-outline"></ion-icon>
        <span>Categorias</span>
      </a>
    </li>
    <li>
      <a href="quienes_somos.html" id="sidebar-cat-categorias">
        <ion-icon name="duplicate-outline"></ion-icon>
        <span>Blog</span>
      </a>
    </li>

    <li>
      <a href="pedidos.html" id="sidebar-cat-administradores">
        <ion-icon name="medical-outline"></ion-icon>
        <span>Pedidos</span>
      </a>
    </li>
    <li>
    <a href="perfil.html" id="sidebar-cat-administradores">
      <ion-icon name="medical-outline"></ion-icon>
      <span>Perfil</span>
    </a>
  </li>
  </ul>
</nav>

<div>
  <div class="linea"></div>

  <div class="modo-oscuro">
    <div class="info">
      <ion-icon name="moon-outline"></ion-icon>
      <span>Dark Mode</span>
    </div>
    <div class="switch">
      <div class="base">
        <div class="circulo"></div>
      </div>
    </div>
  </div>

  <div class="usuario">
    <a href="index.html">
      <img src="https://c4.wallpaperflare.com/wallpaper/950/884/848/anime-girls-icons-profile-hd-wallpaper-preview.jpg" alt="Descripción de la imagen">
    </a>
    <div class="info-usuario">
      <div class="nombre-email">
        <span class="nombre">Stann</span>
        <span class="email">stalin.dbn@gmail.com</span>
      </div>
    </div>
  </div>
</div>
</div>`;



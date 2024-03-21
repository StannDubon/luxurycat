const toggleTableBtn = document.getElementById('toggleTableBtn');
const invoiceTable = document.getElementById('invoiceTable');
invoiceTable.classList.add('d-none');

toggleTableBtn.addEventListener('click', function () {
    if (invoiceTable.classList.contains('d-none')) {
        // Si la tabla está contraída, expandirla y cambiar el texto del botón a "Mostrar Menos"
        invoiceTable.classList.remove('d-none');
        toggleTableBtn.textContent = 'Mostrar Menos';
    } else {
        // Si la tabla está expandida, contraerla y cambiar el texto del botón a "Mostrar Más"
        invoiceTable.classList.add('d-none');
        toggleTableBtn.textContent = 'Mostrar Más';
    }
});

const toggleTableBtn2 = document.getElementById('toggleTableBtn2');
const invoiceTable2 = document.getElementById('invoiceTable2');
invoiceTable2.classList.add('d-none');

toggleTableBtn2.addEventListener('click', function () {
    if (invoiceTable2.classList.contains('d-none')) {
        // Si la tabla está contraída, expandirla y cambiar el texto del botón a "Mostrar Menos"
        invoiceTable2.classList.remove('d-none');
        toggleTableBtn2.textContent = 'Mostrar Menos';
    } else {
        // Si la tabla está expandida, contraerla y cambiar el texto del botón a "Mostrar Más"
        invoiceTable2.classList.add('d-none');
        toggleTableBtn2.textContent = 'Mostrar Más';
    }
});

const toggleTableBtn3 = document.getElementById('toggleTableBtn3');
const invoiceTable3 = document.getElementById('invoiceTable3');
invoiceTable3.classList.add('d-none');

toggleTableBtn3.addEventListener('click', function () {
    if (invoiceTable3.classList.contains('d-none')) {
        // Si la tabla está contraída, expandirla y cambiar el texto del botón a "Mostrar Menos"
        invoiceTable3.classList.remove('d-none');
        toggleTableBtn3.textContent = 'Mostrar Menos';
    } else {
        // Si la tabla está expandida, contraerla y cambiar el texto del botón a "Mostrar Más"
        invoiceTable3.classList.add('d-none');
        toggleTableBtn3.textContent = 'Mostrar Más';
    }
});
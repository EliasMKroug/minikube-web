document.addEventListener('DOMContentLoaded', function () {
    const filterVisaButton = document.getElementById('filterVisaButton');
    const filterMasterButton = document.getElementById('filterMasterButton');
    const resultsTableBody = document.getElementById('results');
    const totalAmountElement = document.getElementById('totalAmount');

    filterVisaButton.addEventListener('click', function () {
        filterTransactions('visa');
    });

    filterMasterButton.addEventListener('click', function () {
        filterTransactions('master');
    });

    function filterTransactions(cardType) {
        const startDate = new Date(document.getElementById('startDate').value);
        const endDate = new Date(document.getElementById('endDate').value);

        if (isNaN(startDate) || isNaN(endDate)) {
            resultsTableBody.innerHTML = '<tr><td colspan="4">Por favor, selecciona fechas válidas.</td></tr>';
            totalAmountElement.textContent = '0.00';
            return;
        }

        // Obtener los datos de las cuentas
        const accounts = JSON.parse(document.getElementById('accounts-data').textContent);

        console.log('Accounts:', accounts);
        console.log('Start Date:', startDate);
        console.log('End Date:', endDate);
        console.log('Card Type:', cardType);

        // Filtrar las transacciones dentro del rango de fechas, por tipo de tarjeta y tipo de transacción "gasto"
        const filteredTransactions = accounts.filter(account => {
            const transactionDate = new Date(account.fecha);
            console.log('Transaction Date:', transactionDate);
            return transactionDate >= startDate && transactionDate <= endDate && account.payment_platform === cardType && account.type === 'gasto';
        });

        console.log('Filtered Transactions:', filteredTransactions);

        // Calcular el total por tarjeta
        const total = filteredTransactions.reduce((sum, account) => sum + account.amount, 0);

        console.log('Total:', total);

        // Mostrar los resultados en la tabla
        resultsTableBody.innerHTML = '';
        if (filteredTransactions.length === 0) {
            resultsTableBody.innerHTML = '<tr><td colspan="4">No se encontraron transacciones.</td></tr>';
        } else {
            filteredTransactions.forEach(transaction => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${new Date(transaction.fecha).toLocaleDateString()}</td>
                    <td>$${transaction.amount.toFixed(2)}</td>
                    <td>${transaction.description || ''}</td>
                    <td>${transaction.category || ''}</td>
                `;
                resultsTableBody.appendChild(row);
            });
        }

        // Mostrar el total
        totalAmountElement.textContent = total.toFixed(2);
    }

    // Filtrar automáticamente al cargar la página
    filterTransactions('visa'); // O 'master' si prefieres
});
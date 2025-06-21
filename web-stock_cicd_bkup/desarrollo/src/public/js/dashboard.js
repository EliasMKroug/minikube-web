document.addEventListener('DOMContentLoaded', function () {
    const accountsDataElement = document.getElementById('accounts-data');
    let accounts = [];

    try {
        const accountsData = accountsDataElement ? accountsDataElement.textContent : '[]';
        accounts = JSON.parse(accountsData);
    } catch (error) {
        console.error("Error al parsear accounts-data:", error);
    }

    console.log('Accounts Data:', accounts);

    // Función para extraer mes y año de una fecha
    function getMonthYear(dateString) {
        const date = new Date(dateString);
        return { month: date.getMonth(), year: date.getFullYear() };
    }

    // Función para obtener los datos filtrados por mes o año completo
    function getFilteredData(month) {
        let filteredAccounts = month === 'all' ? accounts : accounts.filter(acc => getMonthYear(acc.fecha).month === parseInt(month));

        return {
            income: filteredAccounts.filter(acc => acc.type === 'ingreso').reduce((sum, acc) => sum + acc.amount, 0),
            expense: filteredAccounts.filter(acc => acc.type === 'gasto').reduce((sum, acc) => sum + acc.amount, 0)
        };
    }

    let savingsChart;

    function updateCharts(month) {
        const { income, expense } = getFilteredData(month);
        document.getElementById('totalSavings').textContent = (income - expense).toFixed(2);

        const monthlyIncome = new Array(12).fill(0);
        const monthlyExpenses = new Array(12).fill(0);

        accounts.forEach(acc => {
            const { month } = getMonthYear(acc.fecha);
            if (month === parseInt(month) || month === 'all') {
                if (acc.type === 'ingreso') {
                    monthlyIncome[month] += acc.amount;
                } else if (acc.type === 'gasto') {
                    monthlyExpenses[month] += acc.amount;
                }
            }
        });

        if (savingsChart) savingsChart.destroy();
        savingsChart = new Chart(document.getElementById('savingsChart').getContext('2d'), {
            type: 'bar',
            data: {
                labels: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                datasets: [
                    { label: 'Ingresos', data: monthlyIncome, backgroundColor: '#28a745' },
                    { label: 'Gastos', data: monthlyExpenses, backgroundColor: '#dc3545' }
                ]
            },
            options: {
                responsive: true,
                plugins: { title: { display: true, text: 'Ingresos y Gastos por Mes' } }
            }
        });
    }

    updateCharts('all');

    document.getElementById('monthFilter').addEventListener('change', function () {
        updateCharts(this.value);
    });
});

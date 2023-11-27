const graficoBarra = document.getElementById('myChart');

new Chart(graficoBarra, {
  type: 'bar',
  data: {
    labels: ['Ocarina of Time', 'Breath of the Wild', 'Tears of the Kingdom', 'Wind Waker', 'A Link to the Past', 'Twilight Princess'],
    datasets: [{
      label: 'Quantidade de Vendas em milhões de unidades',
      data: [17.3, 31.5, 18, 4, 4, 9],
      borderWidth: 3
    }]
  },
  options: {
    scales: {
      y: {
        beginAtZero: true
      }
    }
  }
});

const graficoPizza = document.getElementById('Grafico2');

new Chart(graficoPizza, {
  type: 'doughnut',
  data: {
    labels: ['Green', 'Purple', 'Orange'],
    datasets: [
      {
        label: 'Zelda dos usuario',
        data: [5, 2, 3],
        borderWidth: 1
      }]
  },
  options: {
    scales: {
      y: {
        beginAtZero: true
      }
    }
  }
});

fetch()

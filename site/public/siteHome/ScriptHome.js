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

function pegarDado(resposta) {

  const graficoPizza = document.getElementById('Grafico2');

  var labelctx = [];
  var datasetsctx = [];
  for (i = 0; i < resposta.length; i++) {
    var count = resposta[i].count
    var label = resposta[i].titulo
    labelctx.push(count);
    datasetsctx.push(label)
  }

  // console.log('Estou aqui', labelctx, datasetsctx)

  new Chart(graficoPizza, {
    type: 'doughnut',
    data: {
      labels: datasetsctx,
      datasets: [
        {
          label: 'Zelda dos usuario',
          data: labelctx,
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
}

fetch("/usuario/pegar", {
  method: "GET",
  headers: {
    "Content-Type": "application/json"
  },
})
  // Manipulando a resposta da solicitação
  .then(function (pegar) {
    // Verificar se a resposta foi bem-sucedida
    if (pegar.ok) {
      console.log(pegar);

      // Convertendo a resposta para JSON
      pegar.json().then(json => {
        pegarDado(json);
        console.log(json);
        console.log(JSON.stringify(json));





      });

    } else {
      // Tratar erros se a resposta não for bem-sucedida
      console.log("Houve um erro ao tentar realizar a solicitação!");

      resposta.text().then(texto => {
        console.error(texto);
      });
    }
  })
  // Tratar erros durante a solicitação ou processamento
  .catch(function (erro) {
    console.log(erro);
  });


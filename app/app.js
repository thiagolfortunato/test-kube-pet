const express = require('express')
const app = express()
const port = process.env.PORT || 3000;
const name = process.env.NOME_CANDIDATO || 'candidato';
const host = process.env.HOSTNAME || 'test-kube-pet';

app.listen(port);

console.log(`Aplicação teste executando em http://localhost:${port}`);

app.get('/', (req, res) => {
  response = `
    <h3>Olá ${name}! </h3>\
    <h4>Hostname: ${host} </h4> \
  `
  res.send(response);
});

app.get('/healthcheck', (req, res) => {
  res.send('Healthy!');
});

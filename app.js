const express = require('express');
const app = express();
const os = require('os');
require('dotenv').config()

const VERSION = process.env.VERSION;

app.get('/', (req, res) => {
    const ipAddress = req.ip.replace('::ffff:', ''); //prefix do ipv6
    res.send(`Adres IP serwera: ${ipAddress}\n
              Wersja aplikacji: ${VERSION} \n
              Nazwa hosta: ${os.hostname()}`);
});
 
app.listen(8080, () => {
  console.log('Listening on port 8080');
});





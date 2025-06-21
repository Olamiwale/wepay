const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const PORT = 3001

const app = express();
app.use(cors());
app.use(bodyParser.json());

app.get('/', (req, res) => {
  res.send("Sever running for authentication service") })


app.listen(PORT, () => 
    console.log(`Server run on port ${PORT}`));

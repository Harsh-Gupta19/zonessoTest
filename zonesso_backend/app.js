const express = require("express");
const app = express();
const bodyParser = require('body-parser')
const port =5000;
const showroomRoutes = require('./routes/showroom/showroom')
const motors =require('./routes/motors/motors')

app.use(bodyParser.json())
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
)

app.get('/', (req, res)=> {
    console.log("Hello to new setup");
    res.send("hello there");
});


app.use('/', showroomRoutes);
app.use('/api', motors);

app.listen(port);
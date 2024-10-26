const express = require('express');
const mangoose = require('mongoose')
//import files 
const authRouter = require("./routes/auth");
const e = require('express');
const adminRouter = require('./routes/admin');
const productRouter = require('./routes/products');

//init
const PORT =    3000;

const app = express();
const DB = "mongodb+srv://Akash:akash12345@cluster0.cb5fmso.mongodb.net/?retryWrites=true&w=majority";


//middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);

//connections

mangoose.connect(DB).then(() => {
    console.log("connection succesful")
}).catch(e => {
    console.log(e);
})




app.listen(PORT, "0.0.0.0" ,() =>{

    console.log(`Connected at the port ${PORT}`)

})
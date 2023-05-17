const express=require('express');
const mongoose=require('mongoose');
const authrouter=require('./routes/auth');
const PORT=3000;
const app=express();
app.use(express.json());
app.use(authrouter);

mongoose.connect('mongodb+srv://ezhil6999:raj1234@cluster0.exhsevi.mongodb.net/?retryWrites=true&w=majority').then(()=>{
    console.log("Connection Successful");
}).catch((e)=>{
    console.log(e);
});

app.listen(PORT,"0.0.0.0",()=>{
    
});

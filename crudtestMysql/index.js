const express = require('express');
const app = express();
const con = require('./connection');
const port = 4000;

app.use(express.json());
app.use(express.urlencoded({ extended: false }))
app.set('view engine',"ejs")

app.get('/', (req, res) => {
    res.sendFile(__dirname + '/register.html')
})



app.post('/', (req, res) => {
    let {name, email, mno}= req.body;    

    console.log('---n e m----',name, email, mno);
    let sql = "INSERT INTO students (name,email,mno) VALUES ?";
    let values =[
        [name,email,mno]
    ];

    con.query(sql,[values],(err,result)=>{
        if(err) throw err;
        console.log('-data inserted-',result);
        res.send("Data inserted successfully")
    })
})


app.get('/students', (req, res) => {

    let sql = "Select * from students";

    con.query(sql,(err,result)=>{
        if(err) throw err;
        console.log('-data inserted-',result);
        res.render(`${__dirname}/students`, {students:result})
    })
})





app.listen(port, () => {
    console.log(`listening to port no ${port}`)
})


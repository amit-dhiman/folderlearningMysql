const mysql= require("mysql");
const con = mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"",
    database:"school"
})
con.connect((err) => {
    if (err) throw err;
    console.log('mysql Connected');
})


module.exports= con;
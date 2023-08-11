const express = require('express');
const app = express();
const con = require('./connection');
const port = 4000;

app.use(express.json());
app.use(express.urlencoded({ extended: false }))
app.set('view engine',"ejs")

app.get('/', (req, res) => {
    // res.send("successfully Registered")
    res.sendFile(__dirname + '/register.html')
})
// app.post('/', (req, res) => {
//     try {
//         let name = req.body.name;
//         let email = req.body.email;
//         let mno = req.body.mno;

//         let sql = "INSERT INTO students(name, email, mno) VALUES ?";
//         let values=[
//             [name,email,mno]
//         ]

//         con.query(sql, [values], (err, result) => {
//             if (err) throw err;
//             res.redirect('/students')
//             // res.send("successfully Registered "+ result)
//         })
//     } catch (err) {
//         throw err;
//     }
// })





// app.get('/students', (req, res) => {
//     try {
//         let sql = "select * from students";
 
//         con.query(sql, (err, result) => {
//             if (err) throw err;
//             res.render(__dirname+"/students",{students: result})
//         })
//     } catch (err) {
//         throw err;
//     }
// })

// app.get('/delete-student', (req, res) => {
//     try {
//         let sql = "delete from students where id=?";
//         let id = req.query.id;
 
//         con.query(sql, [id],(err, result) => {
//             if (err) throw err;
//             res.redirect('/students')
//             // res.render(__dirname+"/students",{students: result});
//         })
//     } catch (err) {
//         throw err;
//     }
// })

// app.get('/update-student', (req, res) => {
//     try {
//         let sql = "select * from students where id=?";
//         let id = req.query.id;
 
//         con.query(sql, [id],(err, result) => {
//             if (err) throw err;
//             res.render(__dirname+"/update-student",{student: result});
//         })
//     } catch (err) {
//         throw err;
//     }
// })

// app.post('/update-student', (req, res) => {
//     try {
//         let name= req.body.name;
//         let email= req.body.email;
//         let mno= req.body.mno;
//         let id= req.body.id;

//         let sql = "UPDATE students set name=?, email=?, mno=? where id=?";
 
//         con.query(sql, [name,email,mno,id],(err, result) => {
//             if (err) throw err;
//             res.redirect('/students');
//         })
//     } catch (err) {
//         throw err;
//     }
// })

// app.get('/search-students', (req, res) => {
//     try {
//         let sql = "select * from students";
 
//         con.query(sql, (err, result) => {
//             if (err) throw err;
//             res.render(__dirname+"/search-students",{students: result})
//         })
//     } catch (err) {
//         throw err;
//     }
// })

// app.get('/search', (req, res) => {
//     try {
//         let {name, email, mno} = req.query;

//         const sql = `
//         SELECT * FROM your_table
//         WHERE name LIKE ? AND email LIKE ? AND class LIKE ? AND mno LIKE ?
//       `;

//         // let sql = "SELECT * from students where name LIKE '%"+name+"%' AND email LIKE '%"+email+"%' AND mno LIKE '%"+mno+"%'";
 
//         con.query(sql,name, (err, result) => {
//             if (err) throw err;
//             res.render(__dirname+"/search-students",{students:result})
//         })
//     } catch (err) {
//         throw err;
//     }
// })








app.listen(port, () => {
    console.log(`listening to port no ${port}`)
})


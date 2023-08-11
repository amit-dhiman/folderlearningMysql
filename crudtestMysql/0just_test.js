const express = require('express');
const mysql = require('mysql');
const app = express();
const port = 3000;

app.use(express.json());

// Create MySQL connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  // database: 'new',
});

db.connect((err) => {
  if (err) {
    console.error('Error connecting to the database:', err);
    return;
  }
  db.query('CREATE DATABASE IF NOT EXISTS newdb', (err) => {
    if (err) {
      console.error('Error creating or selecting the database:', err);
      connection.end(); // Close the MySQL connection
      return;
    }}
  )
  console.log('Connected to MySQL database.');
});

// Define CRUD APIs

// CREATE
app.post('/api/employees', (req, res) => {
  const { emp_id, emp_name, salary, department } = req.body;
  const sql = 'INSERT INTO employees (emp_id, emp_name, salary, department) VALUES (?, ?, ?, ?)';
  db.query(sql, [emp_id, emp_name, salary, department], (err, result) => {
    if (err) {
      console.error('Error creating an employee:', err);
      res.status(500).json({ error: 'Failed to create an employee.' });
    } else {
      res.status(201).json({ message: 'Employee created successfully.', insertId: result.insertId });
    }
  });
});

// READ (Retrieve all employees)
app.get('/api/employees', (req, res) => {
  const sql = 'SELECT * FROM employees';
  db.query(sql, (err, result) => {
    if (err) {
      console.error('Error retrieving employees:', err);
      res.status(500).json({ error: 'Failed to retrieve employees.' });
    } else {
      res.status(200).json(result);
    }
  });
});

// UPDATE
app.put('/api/employees/:emp_id', (req, res) => {
  const emp_id = req.params.emp_id;
  const { emp_name, salary, department } = req.body;
  const sql = 'UPDATE employees SET emp_name = ?, salary = ?, department = ? WHERE emp_id = ?';
  db.query(sql, [emp_name, salary, department, emp_id], (err, result) => {
    if (err) {
      console.error('Error updating employee:', err);
      res.status(500).json({ error: 'Failed to update employee.' });
    } else {
      res.status(200).json({ message: 'Employee updated successfully.' });
    }
  });
});

// DELETE
app.delete('/api/employees/:emp_id', (req, res) => {
  const emp_id = req.params.emp_id;
  const sql = 'DELETE FROM employees WHERE emp_id = ?';
  db.query(sql, [emp_id], (err, result) => {
    if (err) {
      console.error('Error deleting employee:', err);
      res.status(500).json({ error: 'Failed to delete employee.' });
    } else {
      res.status(200).json({ message: 'Employee deleted successfully.' });
    }
  });
});

// Start the server
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});




// INSERT INTO employees (emp_id, emp_name, salary, department) VALUES (123, 'John Doe', 45000, 'IT');

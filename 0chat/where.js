// app.js
const express = require("express");
const db = require("./config/database");
const { Op } = require("sequelize");
const User = require("./models/user");

const app = express();

// Parse incoming JSON data
app.use(express.json());

// Fetch users by age using the WHERE clause
app.get("/users", async (req, res) => {
  try {
    const { age } = req.query;

    const users = await User.findAll({
      where: {
        age: {[Op.eq]: age},
        // age: { [Op.lt]: 18 },
        // age: { [Op.gte]: 18 },
      }
    });

    // const user = await User.findOne({
    //     where: { email: userEmail }
    // });

    res.json(users);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch users." });
  }
});

app.get("/updateUsers", async (req, res) => {
  try {
    const updatedRows = await User.update({ age: 25 },
        { where: { name: 'John'}}
    );
    res.json(updatedRows);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch users." });
  }
});

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, async () => {
  console.log(`Server listening on port ${PORT}`);
  try {
    await db.authenticate();
    console.log("Database connection has been established successfully.");
  } catch (error) {
    console.error("Unable to connect to the database:", error);
  }
});

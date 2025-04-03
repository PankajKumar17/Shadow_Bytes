const express = require("express");
const cors = require("cors");
const dotenv = require("dotenv");
const userRoutes = require("./routes/userRoutes");
const mallRoutes = require("./routes/mallRoutes");
const connectDB = require("./config/db");
const app = express();

app.use(express.json());
app.use(cors());
dotenv.config(); 

connectDB();

app.use("/api/users", userRoutes);
app.use("/api/malls", mallRoutes);


app.use((req, res, next) => {
  res.status(404).json({ error: "Route not found" });
});


app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: "Internal Server Error" });
});


const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));

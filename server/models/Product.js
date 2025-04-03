const mongoose = require("mongoose");

const productSchema = new mongoose.Schema({
  name: String,
  price: Number,
  rfidTag: String,
});

module.exports = mongoose.model("Product", productSchema);

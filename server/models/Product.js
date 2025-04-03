const mongoose = require("mongoose");

const productSchema = new mongoose.Schema({
  name: String,
  price: Number,
  rfidTag: String,
  mallId: { type: mongoose.Schema.Types.ObjectId, ref: "Mall" },
});

module.exports = mongoose.model("Product", productSchema);

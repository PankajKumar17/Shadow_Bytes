const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  name: String,
  email: String,
  password: String, 
  walletBalance: { type: Number, default: 0 },
  scanHistory: [
    {
      rfids: [String],
      timestamp: Date,
    },
  ],
});

module.exports = mongoose.model("User", userSchema);

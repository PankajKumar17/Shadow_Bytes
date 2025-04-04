// const mongoose = require("mongoose");

// const transactionSchema = new mongoose.Schema({
//   userId: { type: mongoose.Schema.Types.ObjectId, ref: "User" },
//   mallId: { type: mongoose.Schema.Types.ObjectId, ref: "Mall" },
//   amount: Number,
//   status: { type: String, enum: ["Pending", "Completed", "Failed"], default: "Pending" },
//   paymentMethod: { type: String, enum: ["Wallet", "UPI"] },
//   timestamp: { type: Date, default: Date.now },
// });

// module.exports = mongoose.model("Transaction", transactionSchema);

const mongoose = require("mongoose");

const TransactionSchema = new mongoose.Schema({
  userId: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
  orderId: { type: String, required: true, unique: true },
  paymentId: { type: String, required: true },
  amount: { type: Number, required: true },
  status: {
    type: String,
    enum: ["Pending", "Success", "Failed"],
    default: "Pending",
  },
  createdAt: { type: Date, default: Date.now },
});

module.exports = mongoose.model("Transaction", TransactionSchema);

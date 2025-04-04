const Transaction = require("../models/Transaction");
const User = require("../models/User");
const { v4: uuidv4 } = require("uuid");
const QRCode = require("qrcode");


exports.getTransactionHistory = async (req, res) => {
  try {
    const transactions = await Transaction.find({ userId: req.user.id }).sort({ createdAt: -1 });
    res.json(transactions);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};


exports.syncOfflineTransaction = async (req, res) => {
  try {
    const { userId, orderId, paymentId, amount, status } = req.body;
    
    const transaction = new Transaction({
      userId,
      orderId: orderId || uuidv4(),
      paymentId,
      amount,
      status: status || "Success",
    });

    await transaction.save();
    res.json({ message: "Transaction synced successfully" });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.generateQRCode = async (req, res) => {
  const { transactionId } = req.params;

  try {
    const transaction = await Transaction.findById(transactionId);
    if (!transaction)
      return res.status(404).json({ error: "Transaction not found" });

    const qrData = JSON.stringify({
      orderId: transaction.orderId,
      paymentId: transaction.paymentId,
      amount: transaction.amount,
      status: transaction.status,
    });

    QRCode.toDataURL(qrData, (err, url) => {
      if (err)
        return res.status(500).json({ error: "QR Code generation failed" });

      res.json({ qrCode: url });
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
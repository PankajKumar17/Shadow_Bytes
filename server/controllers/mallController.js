const Product = require("../models/Product");
const User = require("../models/User"); 
const Mall = require("../models/Mall")
const Transaction = require("../models/Transaction")

exports.scanRfid = async (req, res) => {
  const { rfids, userId } = req.body; 
  if (!userId) {
    return res.status(400).json({ error: "User ID is required" });
  }

  if (!Array.isArray(rfids) || rfids.length === 0) {
    return res.status(400).json({ error: "No RFID tags provided" });
  }

  try {
    const products = await Product.find({ rfidTag: { $in: rfids } });

    if (products.length === 0) {
      return res.status(400).json({ error: "No products found" });
    }

    await User.findByIdAndUpdate(userId, {
      $push: {
        scanHistory: {
          rfids,
          timestamp: new Date(),
        },
      },
    });

    res.json({ products });
    console.log("RFIDs scanned:", rfids);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.getMallDetails = async (req, res) => {
  try {
    const { mallId } = req.params;
    const mall = await Mall.findById(mallId);

    if (!mall) {
      return res.status(404).json({ error: "Mall not found" });
    }

    res.status(200).json(mall);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};


exports.getAllProducts = async (req, res) => {
  try {
    const products = await Product.find();
    
    if (!products.length) {
      return res.status(404).json({ error: "No products found" });
    }

    res.status(200).json(products);
  } catch (error) {
    res.status(500).json({ error: error.message });
    console.log(err);
  }
};



exports.getMallTransactionHistory = async (req, res) => {
  try {
    const transactions = await Transaction.find().sort({ createdAt: -1 });
    res.json(transactions);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};


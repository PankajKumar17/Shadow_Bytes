const Product = require("../models/Product");
const User = require("../models/User"); 

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

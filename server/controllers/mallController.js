const Product = require("../models/Product");

exports.scanRfid = async (req, res) => {
  const { rfid } = req.body;
  try {
    const product = await Product.findOne({ rfidTag: rfid });

    if (!product) {
      return res.status(400).json({ error: "Product not found" });
    }

    res.json({ product }); // Sending the product details
    console.log("RFID scanned:", rfid);

  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

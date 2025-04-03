const Mall = require("../models/Mall");
const Product = require("../models/Product");

exports.scanRFID = async (req, res) => {
  const { rfid } = req.body;
  try {
    res.json({"thanks":rfid});
    
    
    console.log(req.body);

  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

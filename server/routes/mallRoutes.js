const express = require("express");
const { scanRfid} = require("../controllers/mallController");
const { getAllProducts,getMallDetails,getMallTransactionHistory} = require("../controllers/mallController");

const router = express.Router();

router.post("/scan", scanRfid );
router.get("/products/allProducts", getAllProducts);
router.get("/profile/:mallId", getMallDetails);
router.get("/transactions", getMallTransactionHistory);

module.exports = router; 
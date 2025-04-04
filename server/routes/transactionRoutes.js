const express = require("express");
const { getTransactionHistory, syncOfflineTransaction } = require("../controllers/transactionController");
const { protect } = require("../middleware/authMiddleware");

const router = express.Router();


// router.get("/history", authenticate, getTransactionHistory);
// router.post("/sync", authenticate, syncOfflineTransactions);

router.get("/history",  getTransactionHistory);
router.post("/sync",  syncOfflineTransaction);

module.exports = router;
const express = require("express");
const { scanRFID} = require("../controllers/mallController");
const { protect } = require("../middleware/authMiddleware");

const router = express.Router();

router.post("/scan", scanRFID );
// router.get("/:mallId", protect, getMallDetails);

module.exports = router; 
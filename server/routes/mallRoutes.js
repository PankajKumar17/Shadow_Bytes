const express = require("express");
const { scanRfid} = require("../controllers/mallController");
const { protect } = require("../middleware/authMiddleware");

const router = express.Router();

router.post("/scan", scanRfid );
// router.get("/:mallId", protect, getMallDetails);

module.exports = router; 
const express = require("express");
const { register, login, getProfile } = require("../controllers/userController");
const { protect } = require("../middleware/authMiddleware");

const router = express.Router();

router.post("/register", register);
router.post("/login", login);
// router.get("/profile", protect, getProfile);
router.get("/profile", getProfile);

module.exports = router;
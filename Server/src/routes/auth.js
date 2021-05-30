const express = require('express');
const router = express.Router();
const User = require("../models/user");
const userController = require("../controller/auth")
router.post("/register",userController.register)

router.post('/login',userController.login)

module.exports = router
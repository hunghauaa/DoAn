const express = require('express');
const route = express.Router();
const orderController = require("../controller/order")
const auth = require('../middleware/auth')
route
  .post("/",auth, orderController.createOrder)
  .get("/",auth, orderController.getAllOrder)
module.exports =route
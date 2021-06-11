const express = require('express');
const route = express.Router();
const orderController = require("../controller/order")
const auth = require('../middleware/auth')
route
  .post("/",auth, orderController.createOrder)
  .get("/",auth, orderController.getAllOrder)
  .put("/", orderController.updateOrder)
  .get("/admin-get-all", orderController.AdminGetAllOrder)


module.exports =route
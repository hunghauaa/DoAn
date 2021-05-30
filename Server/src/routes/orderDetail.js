const express = require("express");
const route = express.Router();
const orderDetailController = require("../controller/orderDetail");
const auth = require("../middleware/auth");
route.post("/", auth, orderDetailController.createOrderDetail);
module.exports = route;

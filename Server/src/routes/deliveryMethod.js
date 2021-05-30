const express = require("express");
const route = express.Router();
const deliveryMethodController = require("../controller/deliveryMethod");
const auth = require("../middleware/auth");


route
  .get("/",deliveryMethodController.getAllDeliveryMethod)
//   .get("/:id", productcontroller.getProduct)
//   .post("/", productcontroller.create)
//   .delete("/:id", productcontroller.delete)
//   .put("/:id", productcontroller.update);

module.exports = route;

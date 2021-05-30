const express = require("express");
const route = express.Router();
const cartController = require("../controller/cart");
const auth = require("../middleware/auth");
route
  .get("/", auth, cartController.getAllCart)
  .get("/checkCartExisted/:id", auth, cartController.checkCartExisted)
  .post("/", auth, cartController.createCart)
  .put("/checkout", auth, cartController.updateCartCheckout)
  .put("/clear-checkout", auth, cartController.clearCartCheckout)

  .put("/:id", auth, cartController.updateCart)

  .delete("/", auth, cartController.deleteCart);

module.exports = route;

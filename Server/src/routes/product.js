const express = require("express");
const route = express.Router();
const productcontroller = require("../controller/product");
const auth = require("../middleware/auth");


route
  .get("/",productcontroller.getAllProduct)
  .get("/:id", productcontroller.getProduct)
  .post("/", productcontroller.create)
  .delete("/:id", productcontroller.delete)
  .put("/:id", productcontroller.update);

module.exports = route;

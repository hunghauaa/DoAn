const express = require("express");
const route = express.Router();
const categoryController = require("../controller/category");
const auth = require("../middleware/auth");
route
  .post("/", categoryController.create)
  .get("/", categoryController.getAllCategory)
  .delete("/:id", categoryController.delete);

//   .put("/",auth, orderController.updateOrder)

module.exports = route;

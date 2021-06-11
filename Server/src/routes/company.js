const express = require('express');
const route = express.Router();
const companyController = require("../controller/company")
const auth = require('../middleware/auth')
route
  .post("/", companyController.create)
  .get("/",companyController.getAllCompany)
  .delete("/:id", companyController.delete)
//   .put("/",auth, orderController.updateOrder)

module.exports =route
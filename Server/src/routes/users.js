const express = require("express");
const router = express.Router();
const auth = require("../middleware/auth");
const userController = require("../controller/user");
/* GET users listing. */
router
  .get("/",auth,userController.getAllUser)
  .get("/:id",userController.getUser)
  .put("/:id", auth, userController.update);
module.exports = router;

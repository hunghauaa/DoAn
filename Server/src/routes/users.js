const express = require("express");
const router = express.Router();
const auth = require("../middleware/auth");
const userController = require("../controller/user");
const multer = require("multer");
// const { ne } = require("sequelize/types/lib/operators");
// const path = require("path");

// const DIR = "./public/";

/* GET users listing. */
//  var upload = multer({ dest: "uploads/" });
// var upload = multer({ dest: "uploads/" }).single("avatar");
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "./src/public/img");
  },
  filename: (req, file, cb) => {
    const fileName =
      Date.now() + file.originalname.toLowerCase().split(" ").join("-");
    cb(null, fileName);
  },
});

var upload = multer({
  storage: storage,
  fileFilter: (req, file, cb) => {
    if (
      file.mimetype == "image/png" ||
      file.mimetype == "image/jpg" ||
      file.mimetype == "image/jpeg"
    ) {
      cb(null, true);
    } else {
      cb(null, false);
      return cb(new Error("Only .png, .jpg and .jpeg format allowed!"));
    }
  },
});

router
  .get("/", userController.getAllUser)
  .get("/:id", userController.getUser)
  .put("/:id", auth, userController.update)
  .delete("/:id", auth, userController.deleteUser)
  .post("/",  upload.array("files", 1), (req, res, next) => {
    const reqFiles = [];
    const url = req.protocol + "://" + req.get("host");
    for (var i = 0; i < req.files.length; i++) {
      reqFiles.push(url+"/img/" + req.files[i].filename);
      req.body.avatar =url+ "/img/" + req.files[i].filename;
    }
    // console.log(reqFiles,req.body)
    if (reqFiles.length == 0)
      return res.status(500).json({ success: false, message: "Có lỗi xả ra" });
    return res.status(200).json({ success: true, message: "Upload success",data:req.body });
  });

module.exports = router;

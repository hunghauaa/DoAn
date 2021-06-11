const createError = require("http-errors");
const express = require("express");
const app = express();

const path = require("path");
const cookieParser = require("cookie-parser");
const logger = require("morgan");
// const fileUpload = require("express-fileupload");
// const http = require("http");
// const server = http.createServer(app);
// const { Server } = require("socket.io");
// const io = new Server(server,{
//   cors: {
//       methods: ["GET", "POST"],
//       transports: ['websocket', 'polling'],
//       credentials: true
//   },
//   allowEIO3: true
// });
// require("dotenv").config();
var cors = require("cors");
// io.on("connection", (socket) => {
//   console.log("a user connected");
// });

// const indexRouter = require('./routes/index');
const usersRouter = require("./routes/users");
const authRouter = require("./routes/auth");
const productRouter = require("./routes/product");
const categoryRouter = require("./routes/category");

const cartRouter = require("./routes/cart");
const orderRouter = require("./routes/order");
const orderDetailRouter = require("./routes/orderDetail");
const deliveryMethodRouter = require("./routes/deliveryMethod");
const companyRouter = require("./routes/company");

app.use(cors());
// app.use(fileUpload());

const { sequelize } = require("./config/config");
sequelize
  .authenticate()
  .then(() => console.log("connect success"))
  .catch((e) => console.log(e));
// view engine setup
app.post("/upload", (req, res) => {
  if (!req.files) {
    return res.status(500).send({ msg: "file is not found" });
  }
  // accessing the file
  const myFile = req.files.file;

  //  mv() method places the file inside public directory
  myFile.mv(`${__dirname}/public/img/${myFile.name}`, function (err) {
    if (err) {
      console.log(err);
      return res.status(500).send({ msg: "Error occured" });
    }
    // returing the response with file path and name
    return res.send({ name: myFile.name, path: `/${myFile.name}` });
  });
});

app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

// app.use('/', indexRouter);
app.use("/user", usersRouter);
app.use("/auth", authRouter);
app.use("/product", productRouter);
app.use("/category", categoryRouter);
app.use("/company", companyRouter);

app.use("/cart", cartRouter);
app.use("/order", orderRouter);
app.use("/order-detail", orderDetailRouter);
app.use("/delivery-method", deliveryMethodRouter);
const multer = require("multer");

// Storage Engin That Tells/Configures Multer for where (destination) and how (filename) to save/upload our files
const fileStorageEngine = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "./src/public/img"); //important this is a direct path fron our current file to storage location
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + "--" + file.originalname);
  },
});
const upload = multer({ storage: fileStorageEngine });
// Single File Route Handler
app.post("/single", upload.single("image"), (req, res) => {
  console.log(req.file);
  res.send("Single FIle upload success");
});

// Multiple Files Route Handler
app.post("/multiple", upload.array("images", 3), (req, res) => {
  console.log(req.files);
  res.send("Multiple Files Upload Success");
});

// catch 404 and forward to error handler
// app.use(function (req, res, next) {
//   next(createError(404));
// });

// error handler
// app.use(function(err, req, res, next) {
//   // set locals, only providing error in development
//   res.locals.message = err.message;
//   res.locals.error = req.app.get('env') === 'development' ? err : {};

//   // render the error page
//   res.status(err.status || 500);
//   res.render('error');
// });

app.listen(process.env.PORT || 3000, () =>
  console.log(`🚀 Server ready at http://localhost:${process.env.PORT || 3000}`)
);

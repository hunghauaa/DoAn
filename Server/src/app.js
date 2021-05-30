const createError = require('http-errors');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
require('dotenv').config()
var cors = require('cors')

// const indexRouter = require('./routes/index');
const usersRouter = require('./routes/users');
const authRouter = require('./routes/auth');
const productRouter = require('./routes/product');
const cartRouter = require('./routes/cart');
const orderRouter = require('./routes/order');
const orderDetailRouter = require('./routes/orderDetail')
const deliveryMethodRouter = require('./routes/deliveryMethod')

const app = express();
app.use(cors())

const {sequelize} = require('./config/config')
   sequelize.authenticate()
    .then(() => console.log('connect success'))
    .catch((e) => console.log(e))
// view engine setup


app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

// app.use('/', indexRouter);
app.use('/user', usersRouter);
app.use('/auth', authRouter);
app.use('/product',productRouter);
app.use('/cart', cartRouter);
app.use('/order', orderRouter);
app.use('/order-detail', orderDetailRouter);
app.use('/delivery-method', deliveryMethodRouter);


// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
// app.use(function(err, req, res, next) {
//   // set locals, only providing error in development
//   res.locals.message = err.message;
//   res.locals.error = req.app.get('env') === 'development' ? err : {};

//   // render the error page
//   res.status(err.status || 500);
//   res.render('error');
// });

app.listen(process.env.PORT ||3000, () => console.log(`🚀 Server ready at http://localhost:${process.env.PORT||3000}`));



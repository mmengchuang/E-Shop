var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');

var index = require('./routes/index');
var users = require('./routes/users');
var goods=require('./routes/goods');
var admin=require('./routes/admin');
var orders = require('./routes/admin/orders');
var admin_users = require('./routes/admin/users');
var api_orders = require('./routes/api/orders');
var api_shopcar = require('./routes/api/shopcar');
var api_users = require('./routes/api/users');
var api_file = require('./routes/api/file');

//移动端路由配置
var appindex=require('./routes/aindex/index');
var appshopcar=require('./routes/aindex/shopcar');
var app_reg = require('./routes/app/register');
var app_login = require('./routes/app/login');
var app_orders = require('./routes/app/orders');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', index);
app.use('/users', users);
app.use('/goods',goods);
app.use('/admin',admin);
app.use("/admin/orders",orders);
app.use("/admin/users",admin_users);
app.use("/api/orders",api_orders);
app.use("/api/shopcar",api_shopcar);
app.use("/api/users",api_users);
app.use("/api/file",api_file);

//移动端配置
app.use('/appindex',appindex);//客户端对外提供的接口
app.use('/app/shopcar',appshopcar);//客户端对外提供的接口
app.use("/app/orders",app_orders);
app.use("/app/register",app_reg);
app.use("/app/login",app_login);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;

/**
 * Created by 11655 on 2017/1/9.
 */
/**
 * 数据库操作模块
 */
var mysql = require("mysql");
// var md5 = require('md5');
var bodyParser = require('body-parser');
// 创建 application/x-www-form-urlencoded 编码解析
var urlencodedParser = bodyParser.urlencoded({ extended: false })

//配置数据库连接
var connect = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '123456',
    database: 'goods',
    port: 3306
});

connect.connect(); //连接数据库

/* 后台模块 */
/** 订单查询*/
exports.showOrders = function (req, res) {
    var sql = "select orders.id,good.g_name,good.g_price,orderinfo.g_count,user.u_name from orders,"+
        "orderinfo,good,user where orders.id = orderinfo.o_id and orderinfo.g_id = good.id and " +
        "orders.u_id = user.id"
    connect.query( sql,function (err, result) {
        if (err == null) {
            res.render('admin/orders', { data: result });
        } else {
            res.send('{"error_code"："200","msg":'+err+'}');
        }

    });
}

/** 用户查询*/
exports.showUsers = function (req, res) {
    var sql = "select user.id,user.u_name,userinfo.u_nick,userinfo.u_address,userinfo.u_head from user," +
        "userinfo where user.id = userinfo.u_id"
    connect.query( sql,function (err, result) {
        if (err == null) {
            res.render('admin/users', { data: result });
        } else {
            res.send('{"error_code"："200","msg":'+err+'}');
        }

    });
}
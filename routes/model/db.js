/**
 * 数据库操作模块
 */
var mysql = require("mysql");
// var md5 = require('md5');
var bodyParser = require('body-parser');
// 创建 application/x-www-form-urlencoded 编码解析
var urlencodedParser = bodyParser.urlencoded({extended: false})

//配置数据库连接
var connect = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'goods',
    port: 3306
});
connect.connect(); //连接数据库

/* 后台模块 */
/** 订单查询*/
exports.showOrders = function (req, res) {
    var sql = "select orders.id,substring(orders.o_time,1,20) o_time,good.g_name,good.g_price,orderinfo.g_count,user.u_name from orders," +
        "orderinfo,good,user where orders.id = orderinfo.o_id and orderinfo.g_id = good.id and " +
        "orders.u_id = user.id"
    connect.query(sql, function (err, result) {
        if (err == null) {
            console.log(result);
            res.render('admin/orders', {data: result});
        } else {
            res.send('{"error_code"："4012","msg":' + err + '}');
        }

    });
}

/** 用户查询*/
exports.showUsers = function (req, res) {
    var sql = "select user.id,user.u_name,userinfo.u_nick,userinfo.u_address,userinfo.u_head from user," +
        "userinfo where user.id = userinfo.u_id"
    connect.query(sql, function (err, result) {
        if (err == null) {
            res.render('admin/users', {data: result});
        } else {
            res.send('{"error_code"："4012","msg":' + err + '}');
        }
    });
}


/**  移动端订单操作*/

/** 验证token是否与服务器一致，保证数据安全*/
exports.checkToken = function (req, res, next) {
    var token = "";//token值，用户判断数据来源于移动端
    if (req.query.token == undefined) {//判断根据不同请求参数,获取不同的token
        token = req.body.token;
    } else {
        token = req.query.token;
    }
    var verify_sql = "select count(id) from user where u_token = " + token;
    connect.query(verify_sql, function (err, result) {
        if (err == null) {
            if (result.length > 0) { //token验证通过
                next();
            } else {
                res.writeHead(200, {'Content-Type': 'application/json'});
                var data = {error_code: '4015', msg: "token验证失败!"};
                res.end(JSON.stringify(data));
            }
        } else {
            res.writeHead(200, {'Content-Type': 'application/json'});
            var data = {error_code: '4015', msg: "token 验证失败" + err};
            res.end(JSON.stringify(data));
        }
    });
}
/** 订单操作模块*/
/** 查询订单*/
exports.showOrdersToMobile = function (req, res) {
    var uid = req.query.uid;
    var sql = "select orders.id,substring(orders.o_time,1,20) o_time,good.g_name,good.g_price,orderinfo.g_count,user.u_name from orders," +
        "orderinfo,good,user where orders.id = orderinfo.o_id and orderinfo.g_id = good.id and " +
        "orders.u_id = user.id and orders.u_id = " + uid
    connect.query(sql, function (err, result) {
        if (err == null) {
            res.writeHead(200, {'Content-Type': 'application/json'});
            var data = {error_code: '4000', msg: 'success', data: result};
            res.end(JSON.stringify(data));
        } else {
            res.send('{"error_code"："4013","msg":' + err + '}');
        }
    });
}

/** 下单操作 */
exports.preOrder = function (req, res) {
    var u_id = req.body.u_id;//下单用户Id
    var o_time = req.body.o_time;//下单、、时间
    var g_id = req.body.g_id;//商品id
    var g_count = req.body.g_count;//商品购买数量
    var g_num = "";
    var sqls = ['select g_num from good where id =?',//查询库存是否充足
        'insert into orders(u_id,o_time) values(?,?)',//向订单表插入数据
        'select id from orders where u_id =? and o_time =?',//查询订单的id
        'insert into orderinfo(o_id,g_id,g_count) values(?,?,?)',//向订单详情信息表插入数据
        'update good set g_num=? where id=?;'
    ];
    connection.beginTransaction(function (err) {//开启一个事务操作
        if (err) {
            throw err;
        }
        connect.query(sqls[0], [g_id], function (err, result) {//查询库存
            if (err == null) {
                if (result.length > 0) {//库存充足
                    g_num = result[0].g_num;//将库存信息保存
                    console.log("库存为" + g_num);
                    connect.query(sqls[1], [u_id, o_time], function (err, result) {//向订单表插入数据
                        if (err == null) {
                            connect.query(sqls[2], [u_id, o_time], function (err, result) {//查询订单的id
                                console.log("查询到订单的id为" + result[0].id);
                                if (err == null) {
                                    connect.query(sqls[3], [result[0].id, g_id, g_count], function (err, result) {//向订单详情信息表插入数据
                                        if (err == null) {//下单成功
                                            connect.query(sqls[4], [(g_num - g_count), g_id], function (err, result) {//更新商品库存
                                                if (err == null) {
                                                    connect.commit(function (err) {//提交事务操作
                                                        if (err) {
                                                            return connect.rollback(function () {//回滚操作
                                                                throw err;
                                                            });
                                                        }
                                                        res.writeHead(200, {'Content-Type': 'application/json'});
                                                        var data = {error_code: '4000', msg: "下单成功"};
                                                        res.end(JSON.stringify(data));
                                                    });
                                                } else {
                                                    return connect.rollback(function () {//数据回滚操作
                                                        //throw err;
                                                        res.writeHead(200, {'Content-Type': 'application/json'});
                                                        var data = {error_code: '4013', msg: "下单失败" + err};
                                                        res.end(JSON.stringify(data));
                                                    });
                                                }
                                            })
                                        } else {
                                            return connect.rollback(function () {//数据回滚操作
                                                //throw err;
                                                res.writeHead(200, {'Content-Type': 'application/json'});
                                                var data = {error_code: '4011', msg: "下单失败" + err};
                                                res.end(JSON.stringify(data));
                                            });
                                        }
                                    });
                                } else {
                                    return connect.rollback(function () {//数据回滚操作
                                        //throw err;
                                        res.writeHead(200, {'Content-Type': 'application/json'});
                                        var data = {error_code: '4013', msg: "下单失败" + err};
                                        res.end(JSON.stringify(data));
                                    });
                                }
                            });
                        } else {
                            return connect.rollback(function () {//数据回滚操作
                                //throw err;
                                res.writeHead(200, {'Content-Type': 'application/json'});
                                var data = {error_code: '4013', msg: "下单失败" + err};
                                res.end(JSON.stringify(data));
                            });
                        }
                    });
                } else {
                    return connect.rollback(function () {//数据回滚操作
                        //throw err;
                        res.writeHead(200, {'Content-Type': 'application/json'});
                        var data = {error_code: '4013', msg: "商品库存不足"};
                        res.end(JSON.stringify(data));
                    });
                }
            } else {
                return connect.rollback(function () {//数据回滚操作
                    //throw err;
                    res.writeHead(200, {'Content-Type': 'application/json'});
                    var data = {error_code: '4013', msg: "下单失败" + err};
                    res.end(JSON.stringify(data));
                });
            }
        });
    });
}

/** 修改订单状态(取消订单) 0 正常 1 取消 */
exports.cancelOrder = function (req, res) {
    var orderId = req.query.orderId;
    var uid = req.query.uid;
    var sql = "update orders set o_status =1 where id=? and uid=?";
    connect.query(sql, [orderId, uid], function (err, result) {
        if (err == null) {
            res.writeHead(200, {'Content-Type': 'application/json'});
            var data = {error_code: '4000', msg: "success"};
            res.end(JSON.stringify(data));
        } else {
            res.writeHead(200, {'Content-Type': 'application/json'});
            var data = {error_code: '4013', msg: err};
            res.end(JSON.stringify(data));
        }
    })
}

/** 查询并显示购物车*/
exports.showCar = function (req, res) {
    var uid = req.query.uid;
    var sql = "select * from car,carinfo where car.id = carinfo.c_id and car.uid = " + uid;
    connect.query(sql, function (err, result) {
        if (err == null) {
            res.writeHead(200, {'Content-Type': 'application/json'});
            var data = {error_code: '4000', msg: 'success', data: result};
            res.end(JSON.stringify(data));
        } else {
            res.writeHead(200, {'Content-Type': 'application/json'});
            var data = {error_code: '4013', msg: err};
            res.end(JSON.stringify(data));
        }
    });
}

/** 删除购物车*/
exports.delCar = function (req, res) {
    var uid = req.query.uid;
    var orderId = req.query.orderId;
    var sql = "del from car where uid =? and id =?";
    connect.query(sql, [uid, orderId], function (err, result) {
        if (err == null) {
            res.writeHead(200, {'Content-Type': 'application/json'});
            var data = {error_code: '4000', msg: 'success'};
            res.end(JSON.stringify(data));
        } else {
            res.writeHead(200, {'Content-Type': 'application/json'});
            var data = {error_code: '4013', msg: err};
            res.end(JSON.stringify(data));
        }
    });

}

/** 添加购物车*/
exports.addCar = function (req, res) {
    var u_id = req.body.u_id;//购物车用户Id
    var o_time = req.body.o_time;//下单、、时间
    var g_id = req.body.g_id;//商品id
    var g_count = req.body.g_count;//商品购买数量
    var sqls = ['insert into car(u_id) values(?)',//向购物表插入数据
        'select id from car where u_id =?',//查询购物车的id
        'insert into carinfo(c_id,g_id,g_count) values(?,?,?)',//购物车详情信息表插入数据
    ];
    connect.beginTransaction(function(err) {
        if (err) {
            throw err;
        }
        connect.query(sqls[0], [g_id], function (err, result) {//向购物车表插入数据
            if (err == null) {
                connect.query(sqls[1], [u_id], function (err, result) {//查询购物车id
                    if (err == null) {
                        console.log("查询购物车的id为" + result[0].id);
                        connect.query(sqls[2], [result[0].id, g_id, g_count], function (err, result) {//向购物车表详情插入数据
                            if (err == null) {
                                connect.commit(function (err) {//提交事务操作
                                    if (err) {
                                        return connect.rollback(function () {//回滚操作
                                            throw err;
                                        });
                                    }
                                    res.writeHead(200, {'Content-Type': 'application/json'});
                                    var data = {error_code: '4000', msg: "success"};
                                    res.end(JSON.stringify(data));
                                });
                            } else {
                                return connect.rollback(function () {//数据回滚操作
                                    //throw err;
                                    res.writeHead(200, {'Content-Type': 'application/json'});
                                    var data = {error_code: '4013', msg: err};
                                    res.end(JSON.stringify(data));
                                });
                            }
                        });
                    } else {
                        return connect.rollback(function () {//数据回滚操作
                            //throw err;
                            res.writeHead(200, {'Content-Type': 'application/json'});
                            var data = {error_code: '4013', msg: err};
                            res.end(JSON.stringify(data));
                        });
                    }
                });
            } else {
                return connect.rollback(function () {//数据回滚操作
                    //throw err;
                    res.writeHead(200, {'Content-Type': 'application/json'});
                    var data = {error_code: '4013', msg: err};
                    res.end(JSON.stringify(data));
                });
            }
        });
    });
}

/** 注册用户*/
exports.registerUser  = function (req,res) {
    var uname = req.body.uname;
    var upwd = req.body.upwd;
    var sql = ["insert into user(u_name,u_pwd) values(?,?)",
                "select id from user where u_name=? and u_pwd=?",
                //"insert into userinfo(u_id,u_nick,u_address,u_head,u_truename,u_phone,u_email,u_state,u_regtime)"
               "insert into userinfo(u_id) values(?)"
               ]
    connect.beginTransaction(function(err) {
        if (err) {
            throw err;
        }
        connect.query(sql[0],[uname,upwd],function (err,result) {
            if (err){
                return connect.rollback(function () {//数据回滚操作
                    //throw err;
                    res.writeHead(200, {'Content-Type': 'application/json'});
                    var data = {error_code: '4010', msg: err};
                    res.end(JSON.stringify(data));
                });
            }
            res.writeHead(200, {'Content-Type': 'application/json'});
            var data = {error_code: '4000', msg: "success"};
            res.end(JSON.stringify(data))
            connect.query(sql[1],[uname,upwd],function (err,result) {
                if (err){
                    return connect.rollback(function () {//数据回滚操作
                        //throw err;
                        res.writeHead(200, {'Content-Type': 'application/json'});
                        var data = {error_code: '4012', msg: err};
                        res.end(JSON.stringify(data));
                    });
                }
                console.log("查询出来的结果"+result);
                connect.query(sql[2],[result[0].id],function (err,result) {
                    if (err){
                        return connect.rollback(function () {//数据回滚操作
                            //throw err;
                            res.writeHead(200, {'Content-Type': 'application/json'});
                            var data = {error_code: '4013', msg: err};
                            res.end(JSON.stringify(data));
                        });
                    }
                    connect.commit(function (err) {//提交事务操作
                        if (err) {
                            return connect.rollback(function () {//回滚操作
                                throw err;
                            });
                        }
                        //注册成功
                        // res.writeHead(200, {'Content-Type': 'application/json'});
                        var data = {error_code: '4000', msg: "success"};
                        res.end(JSON.stringify(data));
                    });
                })

            })
        })
    });
}


/** 查询自己的用户信息，用于移动端修改用户信息*/
exports.selectUsers = function (req,res) {
    var uid = req.body.id;
    var sql = "select u_name,u_nick,u_address,u_head,u_truename,u_phone,u_email,u_state,u_regtime from user,userinfo where u_id=?";
    connect.query(sql,[uid],function (err,result) {
        if (err){
            res.writeHead(200, {'Content-Type': 'application/json'});
            var data = {error_code: '4013', msg: err};
            res.end(JSON.stringify(data));
        } else {
       /*     res.writeHead(200, {'Content-Type': 'application/json'});
            var data = {error_code: '4000', msg: "success",data:result};
            console.log(""+result[0].u_name);*/
            res.send(JSON.stringify(result));

        }
    })
}

//查询用户密码
exports.sUserPwd = function (req,res) {
    var uid = req.body.id;
    console.log("修改密码的id"+uid);
    var sql = "select u_pwd from user where id=?";
    connect.query(sql,[uid],function (err,result) {
        if (err){
            res.writeHead(200, {'Content-Type': 'application/json'});
            var data = {error_code: '4013', msg: err};
            res.end(JSON.stringify(data));
        } else {
     console.log("mima :"+result[0].u_pwd);
            res.send(JSON.stringify(result));
        }
    })
}
//修改用户密码
exports.updateUserPwd = function (req,res) {
	var uid=req.body.id;
	var pwd=req.body.u_new;
	console.log(""+pwd+"--id"+uid)
	connect.beginTransaction(function(err) {
        if(err) {
            console.log("修改密码err:db.js:" + err);
            connect.rollback(function() {
                throw err;
            });
        }
	
    var params = [pwd,uid];
    var sql = "update user set u_pwd=? where id = ?";
    connect.query(sql,params,function (err,result) {
    	  if(err) {
                        console.log("修改密码err1:" + err);
                        connect.rollback(function() {
                            throw err;
                        });
                    } else {
    	connect.commit(function() {
                            if(err) {
                                console.log("更新用户err2:" + err);
                                connect.rollback(function() {
                                    throw err;
                                });
                            }
                            console.log("修改成功");
                           res.render("fore/myaccount",{id:uid});
                        });}
    	    });
	});
}


/** 修改用户信息 */
exports.updateUsers = function (req,res) {
	var uid=req.body.id;
	connect.beginTransaction(function(err) {
        if(err) {
            console.log("err0:" + err);
            connect.rollback(function() {
                throw err;
            });
        }
	
    var params = [req.body.u_nick,req.body.u_address,req.body.u_truename,req.body.u_phone,
        req.body.u_email,req.body.id];
    var sql = "update userinfo set u_nick=?,u_address=?,u_truename=?,u_phone=?,u_email=? where u_id = ?"
    connect.query(sql,params,function (err,result) {
    	  if(err) {
                        console.log("更新用户err1:" + err);
                        connect.rollback(function() {
                            throw err;
                        });
                    } else {
    	connect.commit(function() {
                            if(err) {
                                console.log("更新用户err2:" + err);
                                connect.rollback(function() {
                                    throw err;
                                });
                            }
//                          res.send('ok');
                           res.render("fore/myaccount",{id:uid});
                        });}
    	    });
	});
}
    	
    	
    	
    /*    if (err==null){
            res.writeHead(200, {'Content-Type': 'application/json'});
            var data = {error_code: '4000', msg: "success"};
//          res.end(JSON.stringify(data));
        } else {
        	//修改失败回滚
        	
            res.writeHead(200, {'Content-Type': 'application/json'});
            var data = {error_code: '4013', msg: "fail"};
            res.end(JSON.stringify(data));
        }*/


/** 修改头像*/

/** 修改密码*/

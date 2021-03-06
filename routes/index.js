var express = require('express');
var router = express.Router();


var crypto = require('crypto'); //创建加密模块
var mysql = require("mysql");
var conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '123456',
    database: 'goods',
    port: '3306'
});
conn.connect();

/* GET home page. */

router.get('/', function(req, res, next) {
    res.render('index', {
        title: 'Express'
    });
});

//验证登陆
router.post('/login', function(req, res, next) {
    //账号 密码  设备id 设备ip
    // var uname = req.query.uname;
    // var upwd = req.query.upwd;
    // var uid = req.query.uid;
    // var uip = req.query.uip;
    var uname = req.body.uname;
    console.log("我的信息"+uname);
    var upwd = req.body.upwd;
    var uid = req.body.uid;
    var uip = req.body.uip;
    var timestamp = Date.now();
    var str = uname + upwd + uid + uip + timestamp + "a";
	console.log(str);
    var sql = "select * from user where u_name = " + uname;
    conn.query(sql, function(err, result) {
        if(err) {
            throw err;
            return;
        } else {
            if(result.length > 0) {
                console.log("用户名:"+result[0].u_name+"密码："+result[0].u_pwd);
                if(result[0].u_pwd!=upwd) {
                    res.json({
                        "code": -2,
                        "msg": "您好!密码输入错误,请重新输入"
                    });
                } else {
                    //获取token
                    var newStr = md5(str);
//					console.log("token:"+newStr);
                    //用户信息正确
                    var sql1 = "update user set u_token=? where id=?";
                    var uid  = result[0].id;
                    var u_params = [newStr, uid];
                    conn.query(sql1, u_params, function(err, result) {
                        if(err) {
                            throw err;
                            return;
                        } else {
                            res.json({
                                "code": 1,
                                "msg": newStr,
                                "uid":uid
                            });
                        }
                    });
                }
            } else {
                res.json({
                    "code": -1,
                    "msg": "不好意思,此账号不存在!"
                });
            }
        }
    });

});

function md5(text) {
    return crypto.createHash('md5').update(text).digest('hex');
};
module.exports = router;
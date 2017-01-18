/**
 * Created by 11655 on 2017/1/17.
 */
var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function (req, res, next) {
    res.render("app/register");
});

router.post('/', function (req, res, next) {
//     // res.send("注册成功");
//     var post_data = {
//         uname: 123,
//         upwd: 456
//     };//这是需要提交的数据
//
//     var content = qs.stringify(post_data);
//
//     var options = {
//         hostname: '127.0.0.1',//主机名
//         port: 80,               //端口号
//         path: 'api/user/register', // 请求路径
//         method: 'POST',             //请求方式
//         headers: {
//             'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' //请求头信息
//         }
//     };
//
//     var req2= http.request(options, function (res) {
//         console.log('STATUS: ' + res.statusCode);
//         console.log('HEADERS: ' + JSON.stringify(res.headers));
//         res.setEncoding('utf8');
//         res.on('data', function (chunk) {
//             console.log('BODY: ' + chunk);
//         });
//     });
//
//     req2.on('error', function (e) {
//         console.log('problem with request: ' + e.message);
//     });
//
// // write data to request body
//     req2.write(content);
//
//     req2.end();

});
module.exports = router;
var express = require('express');
var router = express.Router();

var db=require('./model/db.js');
/* GET users listing. */
/**查询用户 */
router.get('/', function(req, res, next) {
	var uid=req.query.uid;
	console.log("id:"+uid);
  res.render('fore/myaccount',{id:uid});
});

router.post('/getUser',db.selectUsers);
//获取用户密码
router.post('/getUserPwd',db.sUserPwd);
//修改用户密码
router.post('/updateUserPwd',db.updateUserPwd);
//跳转到修改页面
router.get('/updateu',function(req,res){
	var id=req.query.g;
	console.log("id:"+id);
	res.render('fore/updateuser',{id:id});
});
//修改用户信息
router.post('/update',db.updateUsers);

//跳转到修改密码页面
router.get('/updatepwd',function(req,res){
	var id=req.query.g;
	console.log("uuid:"+id);
	res.render('fore/updateupwd',{id:id});
});

module.exports = router;

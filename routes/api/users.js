/**
 * Created by 11655 on 2017/1/11.
 */
/**
 * 移动端用户管理的路由
 */
var express = require('express');
var db = require("./../model/db");
var router = express.Router();

/** 注册用户 */
router.post('/register',db.registerUser);

/** 验证token是否一致 */
router.use(db.checkToken);

/** 查询用户 */
router.post('/',db.selectUsers);

/** 修改用户个人信息*/
router.post('/update',db.updateUsers)


module.exports = router;

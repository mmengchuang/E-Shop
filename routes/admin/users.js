/**
 * 用户路由
 */
var express = require('express');
var db = require("./../model/db");
var router = express.Router();

/* 查询用户信息 */
router.get('/',db.showUsers);

module.exports = router;
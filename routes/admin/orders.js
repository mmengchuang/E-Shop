/**
 * 订单管理路由
 */
var express = require('express');
var db = require("./../model/db");
var router = express.Router();

/* 查询订单详情 */
router.get('/',db.showOrders);

module.exports = router;
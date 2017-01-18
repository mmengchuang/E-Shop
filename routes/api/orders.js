/**
 * Created by 11655 on 2017/1/10.
 */
/**
 * 订单管理路由
 */
var express = require('express');
var db = require("./../model/db");
var router = express.Router();
/** 验证token是否一致 */
router.use(db.checkToken);

/** 查询订单 */
router.post('/',db.showOrdersToMobile);

/** 下单 */
router.post('/preOrder',db.preOrder);

/** 取消订单 */
router.post('/canelOrder',db.cancelOrder);

module.exports = router;
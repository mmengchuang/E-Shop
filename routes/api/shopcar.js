/**
 * Created by 11655 on 2017/1/10.
 */
/**
 * Created by 11655 on 2017/1/10.
 */
/**
 * 购物车的路由
 */
var express = require('express');
var db = require("./../model/db");
var router = express.Router();
/** 验证token是否一致 */
router.use(db.checkToken);

/** 查询购物车 */
router.get('/',db.showCar);

/** 下单 */
// router.post('/preOrder',db.preOrder);

/** 删除购物车 */
router.get('/delCar',db.delCar);

/** 添加购物车 */
router.post('/addCar',db.addCar);

module.exports = router;
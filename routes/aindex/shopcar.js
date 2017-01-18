/**
 * Created by 11655 on 2017/1/18.
 */
var express = require('express');
var router = express.Router();
router.get('/', function(req, res, next) {
    var g_id=req.query.g;
    console.log("id："+g_id);
    res.render('fore/shopping-cart');
})
module.exports = router;

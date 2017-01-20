/**
 * Created by 11655 on 2017/1/20.
 */
var express = require('express');
var router = express.Router();
/* GET users listing. */
router.get('/', function (req, res, next) {
    res.render("app/orders");
});
module.exports = router;
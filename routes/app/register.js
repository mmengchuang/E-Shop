/**
 * Created by 11655 on 2017/1/17.
 */
var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function (req, res, next) {
    res.render("app/register");
});
module.exports = router;
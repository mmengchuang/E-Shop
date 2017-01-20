var express = require('express');
var router = express.Router();

var db=require('../dbopers/goodsopers.js');
var chendb=require('../model/db.js');

/* GET 前端用户信息 */
router.get('/', function(req, res, next) {
	  res.render('fore/myaccount');
});


module.exports = router;
var express = require('express');
var router = express.Router();

var db=require('../dbopers/goodsopers.js');
/* GET 前端 page. */
router.get('/', function(req, res, next) {
	  res.render('fore/index');
//res.render('fore/index', { title: 'Express' });
})
router.get('/singlegood',function(req,res,next){
	db.sallgood(req,res);
});

router.get('/detail', function(req, res, next) {
	var g_id=req.query.g;
	console.log("id："+g_id);
	  res.render('fore/detail',{id:g_id});
})
module.exports = router;
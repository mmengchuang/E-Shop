var express=require('express');
var router=express.Router();
var bodyParser=require("body-parser");
var dboper=require("./dbopers/goodsopers.js");
router.use(bodyParser.urlencoded({
	extended:false
}));

router.get('/',function(req,res,next){
	res.render('goods/index',{mytitle:"妈妈"});
});
router.get('/add',function(req,res,next){
	res.render('goods/addgoods');
});
//添加商品
router.post('/addg',function(req,res,next){
	dboper.agoods(req,res);
});
/*//查询商品
router.get('/queryg',function(req,res,next){
	
});*/
module.exports=router;
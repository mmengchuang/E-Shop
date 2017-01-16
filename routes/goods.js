var express=require('express');
var router=express.Router();
var bodyParser=require("body-parser");
var dboper=require("./dbopers/goodsopers.js");


router.use(bodyParser.urlencoded({
	extended:false
}));

router.get('/',function(req,res,next){
	res.render('goods/index');
});
//商品添加页面
router.get('/add',function(req,res,next){
	res.render('goods/addgood');
});
//添加商品
router.post('/addg',function(req,res,next){
	dboper.agoods(req,res);
});

router.post('/upload', function(req, res, next) {
	dboper.dealPics(req,res);
});
//查询标签
router.get('/getlabel',function(req,res,next){
	dboper.getlabel(req,res);
});
//查询商品
router.get('/queryg',function(req,res,next){
	dboper.showdata(req,res);
});
//删除商品
router.post('/delgoods',function(req,res,next){
	dboper.delgoods(req,res);
});
//修改商品页面
router.get('/updategoods',function(req,res,next){
	var id=req.query.g;
	res.render('goods/updateg',{id:id});
});
//查询某条商品记录
router.post('/selectgood',function(req,res,next){
	dboper.sitem(req,res);
});
//修改商品操作
router.post('/updategoodsa',function(req,res,next){
	dboper.update(req,res);
});

module.exports=router;
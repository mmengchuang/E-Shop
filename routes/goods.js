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

//修改商品状态
router.get('/ustate',function(req,res,next){
    res.render('goods/updatestate');
});
//修改商品为发布状态
router.get('/stateup',function(req,res,next){
    dboper.ugup(req,res);
});
//修改商品为下线状态
router.get('/statedown',function(req,res,next){
    dboper.ugdown(req,res);
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
router.post('/spics',function(req,res,next){
    dboper.spics(req,res);
});
//修改商品操作
router.post('/updategoodsa',function(req,res,next){
    dboper.update(req,res);
});
//商品评论
router.post('/command',function(req,res,next){
	dboper.con(req,res);
});
router.post('/queryComms',function(req,res,next){
	dboper.queryComments(req,res);
});
module.exports=router;
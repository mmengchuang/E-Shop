
var mysql = require("mysql");
var conn = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: 'root',
	database: 'goods',
	port: '3306'
});
conn.connect();
exports.agoods=function(req,res){
	var name=req.body.name;
	var price=req.body.price;
	var num=req.body.num;
	var detail=req.body.detail;
	var produce=req.body.produce;
	//获取当前时间
	var nowTime=getNowFormatData();
	var sql="insert into good(g_name,g_price,g_num,g_detail,g_time,g_looknum,g_product,g_state) values(?,?,?,?,?,0,?,0)";
	var vparams=[name,price,num,detail,nowTime,produce];
	conn.query(sql,vparams,function(err,result){
		if(err){
			console.log("err:"+err);
			return;
		}else{
	    res.render('goods/index',{mytitle:"luckyDog"});
		}
	});
	
	//获取当前时间：yyyy-MM-dd hh:mm:ss
function getNowFormatData(){
	var date=new Date();
	 var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
    return currentdate;
}
	
}

//conn.close();
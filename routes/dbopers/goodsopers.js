var fs = require('fs');
var formidable = require('formidable');
var util = require('util');
var sys = require('sys');

var mysql = require("mysql");
var conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'goods',
    port: '3306'
});
conn.connect();

//添加商品
exports.agoods = function(req, res) {
    var name = req.body.name;
    var price = req.body.price;
    var num = req.body.num;
    var detail = req.body.detail;
    var produce = req.body.produce;

    var color1 = req.body.col;
    var pin = req.body.pin;
    var cpu = req.body.cpu;
    var xian = req.body.xian;
    var size = req.body.size;
    var a = {
        "color": color1,
        "pin": pin,
        "cpu": cpu,
        "xian": xian,
        "size": size
    };
    var str = JSON.stringify(a);

    console.log("str:" + str + "name:" + name);
    //获取当前时间
    var nowTime = getNowFormatData();
    conn.beginTransaction(function(err) {
        if(err) {
            console.log("err0:" + err);
            conn.rollback(function() {
                throw err;
            });
        }
        var sql = "insert into good(g_name,g_price,g_num,g_detail,g_time,g_looknum,g_product,g_state) values(?,?,?,?,?,0,?,0)";
        var vparams = [name, price, num, detail, nowTime, produce];
        conn.query(sql, vparams, function(err, result) {
            if(err) {
                console.log("err1:" + err);
                conn.rollback(function() {
                    throw err;
                });
            } else {
                var gid = result.insertId;
                var s1 = "insert into label(label_con,g_id,color,pin,cpu,xian,size)values(?,?,?,?,?,?,?)";
                var para = [str, gid, color1, pin, cpu, xian, size];
                conn.query(s1, para, function(err, result) {
                    if(err) {
                        console.log("err2:" + err);
                        conn.rollback(function() {
                            throw err;
                        });
                    } else {
                        conn.commit(function() {
                            if(err) {
                                console.log("err3:" + err);
                                conn.rollback(function() {
                                    throw err;
                                });
                            }
                            res.render('goods/addpic', {
                                goodid: gid
                            });
                        });
                    }
                });
            }
        });
    });

}

exports.dealPics = function(req, res) {
    var sfile;

    var formParse = new formidable.IncomingForm();
    formParse.uploadDir = './temp'; //缓存地址
    formParse.multiples = true; //设置为多文件上传
    formParse.keepExtensions = true; //是否包含文件后缀
    var files = [];
    //文件都将保存在files数组中
    formParse.on('file', function(filed, file) {
        files.push([filed, file]);
    })
    formParse.parse(req, function(error, fields, files) {
        if(error) {
            console.log("error" + error.message);
            return;
        }
		/*    res.writeHead(200, {'content-type': 'text/plain'});
		 res.write('received upload:\n\n');
		 res.end(util.inspect({fields: fields, files: files}));*/
        var allFiles = files.img; //图片数组

        var goodid = fields.gid;
        console.log("gid:" + fields.gid + "文件个数:" + allFiles.length); //文件个数必须大于等于2
        for(var k = 0; k < allFiles.length; k++) {
            var fileName = allFiles[k].name;
            var fileUrl = "./public/imgs/A" + new Date().getTime() + fileName;
            try {
                console.log("文件路径:" + allFiles[k].path + "--aaaa:" + fileUrl);
                fs.rename(allFiles[k].path, fileUrl);
                //将图片路径保存到数据库pic中       需要的是"img/A"+fileUrl.split('A')[1]
                var fpath = "imgs/A" + fileUrl.split('A')[1];
                if(k == 0) {
                    sfile = fpath;
                }

                var sql = "insert into pic(p_url,g_id) values(?,?)";
                var ps = [fpath, goodid];
                conn.query(sql, ps, function(err, result) {
                    if(err) {
                        console.log("保存图片err:" + err);
                        conn.rollback(function() {
                            throw err;
                        });
                    }
                });
            } catch(e) {
                console.log(e);
            }
        }
        //在商品表中插入主图     //将第一张图作为商品主图
        var sql="update good set g_mpic=? where id=?";
        var ps = [sfile, goodid];
        conn.query(sql, ps, function(err, result) {
            if(err) {
                console.log("good保存图片err:" + err);
                conn.rollback(function() {
                    throw err;
                });
            }
            console.log("保存图片成功" );
        });
        res.render("goods/index");
    });
}

//修改商品信息
exports.update = function(req, res) {
    var id = req.body.id;
    var name = req.body.name;
    var price = req.body.price;
    var num = req.body.num;
    var detail = req.body.detail;
    var produce = req.body.produce;
    var color1 = req.body.color;
    var pin = req.body.pin;
    var cpu = req.body.cpu;
    var xian = req.body.xian;
    var size = req.body.size;
    var a = {
        "color": color1,
        "pin": pin,
        "cpu": cpu,
        "xian": xian,
        "size": size
    };
    var str = JSON.stringify(a);
    //获取当前时间
    console.log("修改信息："+id+str);
    var nowTime = getNowFormatData();
    conn.beginTransaction(function(err) {
        if(err) {
            console.log("err0:" + err);
            conn.rollback(function() {
                throw err;
            });
        }
        var sql = "update good set g_name=?,g_price=?,g_num=?,g_detail=?,g_time=?,g_product=?,g_state=0 where id=?";
        var vparams = [name, price, num, detail, nowTime, produce, id];
        conn.query(sql, vparams, function(err, result) {
            if(err) {
                console.log("err1:" + err);
                conn.rollback(function() {
                    throw err;
                });
            } else {
                var s1 = "update label set label_con=?,color=?,pin=?,cpu=?,xian=?,size=? where g_id=?";
                var para = [str, color1, pin, cpu, xian, size,id];
                conn.query(s1, para, function(err, result) {
                    if(err) {
                        console.log("err2:" + err);
                        conn.rollback(function() {
                            throw err;
                        });
                    } else {
                        conn.commit(function() {
                            if(err) {
                                console.log("err3:" + err);
                                conn.rollback(function() {
                                    throw err;
                                });
                            }
                            res.render('goods/index', {
                                mytitle: "luckyDog"
                            });
                        });
                    }
                });
            }
        });
    });
}
//商品发布状态
exports.ugup=function(req,res){
    updateState(req.query.g,1);
    res.render('goods/updatestate');
}
//商品下线状态
exports.ugdown=function(req,res){
    updateState(req.query.g,-1);
    res.render('goods/updatestate');
}

exports.getlabel = function(req, res) {
    //获取标签信息
    var sql1 = "select * from labelinfo";
    conn.query(sql1, function(err, result) {
        if(err) {
            console.log("err0:" + err);
            return;
        } else {
            //				console.log("标签:"+result.length);
            res.send(result);
        }
    });
}

exports.showdata = function(req, res) {
    var allgoods = [];
    var v1;
    var sqlgoods = "select * from good";
    conn.query(sqlgoods, function(err, result1) {
        if(err) {
            console.log("goodsopers1----err:" + err);
            return;
        } else {
            //获取商品标签信息
            var sql1 = "select * from label";
            conn.query(sql1, function(err, result2) {
                if(err) {
                    console.log("err2:" + err);
                    return;
                } else {
                    allgoods = {
                        v1: result1,
                        v2: result2
                    };
                    var aa = JSON.stringify(allgoods);
                    res.send(aa);
                }
            });
        }
    });
}

//查询某个商品的所有图片
exports.spics=function(req,res){
    var id=req.body.id;
//  console.log("aaa"+id);
    var spic = "select p_url from pic where g_id="+id;
    conn.query(spic, function(err, result) {
        if(err) {
            console.log("查询图片---err:" + err);
            return;
        } else {
            var re=JSON.stringify(result);
//          console.log(re);
            res.send(re);
        }
    });
}

//查询发布商品的简要信息

exports.sallgood = function(req, res) {
    var sqlgood = "select * from good where g_state="+1;
    conn.query(sqlgood, function(err, result) {
        if(err) {
            console.log("goodsopersXX----err:" + err);
            return;
        } else {
            var re=JSON.stringify(result);
            res.send(re);
        }
    });
}


//查询某条商品的记录
exports.sitem = function(req, res) {
    var id = req.body.id;
    var sqlgood = "select * from good where id=" + id;
    conn.query(sqlgood, function(err, r1) {
        if(err) {
            console.log("goodsopers----err:" + err);
            return;
        } else {
            //获取商品标签信息
            var sql1 = "select * from label where g_id=" + id;
            conn.query(sql1, function(err, r2) {
                if(err) {
                    console.log("err11:" + err);
                    return;
                } else {
                    var good = {
                        v1: r1,
                        v2: r2
                    };
                    var aa = JSON.stringify(good); //json转string
                    res.send(aa);
                }
            });
        }
    });
}


//删除商品
exports.delgoods = function(req, res) {

    conn.beginTransaction(function(err) {
        if(err) {
            console.log("goods---err0:" + err);
            conn.rollback(function() {
                throw err;
            });
        }
        //将标签删除
        var sql = "delete from good where id=" + req.body.id; //result.affectedRows
        conn.query(sql, function(err, result3) {
            if(err) {
                console.log("goods---err1:" + err);
                conn.rollback(function() {
                    throw err;
                });
            } else {
                var s1 = "delete from label where g_id=" + req.body.id;
                conn.query(s1, function(err, result) {
                    if(err) {
                        console.log("goods---err2:" + err);
                        conn.rollback(function() {
                            throw err;
                        });
                    } else {

                        //将图片删除
                        var s2 = "delete from pic where g_id=" + req.body.id;
                        conn.query(s2, function(err, result) {
                            if(err) {
                                console.log("goods---err3:" + err);
                                conn.rollback(function() {
                                    throw err;
                                });
                            } else {
                                //提交
                                conn.commit(function() {
                                    if(err) {
                                        console.log("goods---err3:" + err);
                                        conn.rollback(function() {
                                            throw err;
                                        });
                                    }
                                    res.render("goods/index");
                                });
                            }
                        });
                    }
                });
            }
        });
    });
}
//评论
exports.con=function(req,res){
	var a=0;
	
	var userid=1;//假设用户id是1
	
	var title=req.body.title;
	var content=req.body.content;
	var id=req.body.id;
	var nowTime1 = getNowFormatData();
	console.log("***"+title+"--"+content+"id:"+id);
	//假设用户id是1         判断用户是否有评论权限
	var sql1="select g_id from orders os,orderinfo o where u_id=? and os.id=o.o_id";
	var params=[userid];
	conn.query(sql1,params, function(err, result) {
            if(err) {
                console.log("goods---err1:" + err);
                conn.rollback(function() {
                    throw err;
                });
            } else {
            	//获取用户购买的所有商品id
            	for(var i=0;i<result.length;i++){
//          		console.log("XXXXXid:" + id+"result[i]："+result[i].g_id);
            		if(result[i].g_id==id){
            			a=1;//用户购买过商品
            			//用户可以评论
//          			console.log("XXXXX:" + id);
            			var sql2="insert into comments(u_id,g_id,comment,comm_time,com_title)values(?,?,?,?,?)";
	var params=[userid,id,content,nowTime1,title];
	conn.query(sql2,params, function(err, result) {
            		if(err) {
                console.log("goods---err1:" + err);
                conn.rollback(function() {
                    throw err;
                });
            } else {
            	console.log("aaaaa");
            	res.send('ok');
            }
            		});
	                }
            		console.log("**"+result[i]);
             }
            	if(a==0){
            		res.send("no");
            	}
         }
});
}
//获取对该商品的所有评论信息
exports.queryComments=function(req,res){
var gid=req.body.g_id;
var scomments="select u_name,comment,comm_time,com_title from comments c,user u where g_id="+gid;
conn.query(scomments,function(err,result){
	if(err){
		console.log("查询评论出错："+err);
	}else{
		console.log(result[0].comment);
		res.send(result);
	}
});
	

}



function strToJson(str) {
    var json = eval('(' + str + ')');
    return json;
}
//获取当前时间：yyyy-MM-dd hh:mm:ss
function getNowFormatData() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if(month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if(strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate +
        " " + date.getHours() + seperator2 + date.getMinutes() +
        seperator2 + date.getSeconds();
    return currentdate;
}

function updateState(id,num){
    var sql="update good set g_state=? where id=?";
    var ps = [num, id];
    conn.query(sql, ps, function(err, result) {
        if(err) {
            console.log("good修改状态err:" + err);
            conn.rollback(function() {
                throw err;
            });
        }
        console.log("商品状态修改成功" );
    });
}

//conn.close();
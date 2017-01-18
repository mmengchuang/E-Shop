/**
 * Created by 11655 on 2017/1/11.
 */
/**
 * 文件上传路由
 */
var express = require('express');
var db = require("./../model/db")
var fs = require('fs');
var formidable = require('formidable');
var path = require('path');
var router = express.Router();

/** 验证token是否一致 */
//router.use(db.checkToken);

/* 文件上传*/
router.post('/upload', function (req, res) {
        var uid = req.body.uid;
        var form = new formidable.IncomingForm;//创建一个incoming form实例
        form.uploadDir = path.join(__dirname, '../../public/temp')//设置文件上传路径为静态资源路径下的temp
        form.keepExtensions = true;//设置上传后文件使用原扩展名

        var targetDir = path.join(__dirname, '../../public/upload');//设置文件移动路径为静态资源路径下的upload'
        // 检查目标目录，不存在则创建
        fs.access(targetDir, function (err) {
            if (err) {
                fs.mkdirSync(targetDir);
            }
            _fileParse();
        });
        // 文件解析与保存
        function _fileParse() {
            form.parse(req, function (err, fields, files) {
                if (err) throw err;
                var filesUrl = [];
                var errCount = 0;
                var keys = Object.keys(files);
                keys.forEach(function (key) {
                    var filePath = files[key].path;
                    var fileExt = filePath.substring(filePath.lastIndexOf('.'));
                    if (('.jpg.jpeg.png.gif').indexOf(fileExt.toLowerCase()) === -1) {
                        errCount += 1;
                    } else {
                        //以当前时间和用户id对上传文件进行重命名
                        var fileName = "upload_" + uid + "_" + new Date().getTime() + fileExt;
                        var targetFile = path.join(targetDir, fileName);
                        //移动文件
                        fs.renameSync(filePath, targetFile);
                        // 文件的Url（相对路径）
                        filesUrl.push('/upload/' + fileName)
                    }
                });
                // 返回上传信息
                res.json({filesUrl: filesUrl, success: keys.length - errCount, error: errCount});
            });
        }
    }
);

module.exports = router;

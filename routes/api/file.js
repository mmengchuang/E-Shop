/**
 * Created by 11655 on 2017/1/11.
 */
/**
 * 文件上传路由
 */
var express = require('express');
var db = require("./../model/db")
/* 文件上传*/
router.get('/',function (req,res) {
    req.send("文件上传");
});

module.exports = router;

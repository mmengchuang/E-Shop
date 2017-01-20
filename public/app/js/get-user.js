/**
 * Created by 11655 on 2017/1/20.
 */
//获取Android中json数据（token和用户uid 和登陆状态信息）
function  getUserInfo() {
    var result = window.jsObj.jsonUidToHtml();
    var obj = eval("(" + result + ")");//解析json字符串
    for (i = 0; i < obj.length; i++) {
        var userInfo = obj[i];
    }
    return userInfo;
}
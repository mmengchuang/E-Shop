# E-Shop
一个集Node JS服务器和安卓端的项目
----
使用方式
  `npm install --save`

###移动端接口调用请求说明

关于订单:

 订单查询操作
  

 请求URL：`http://mmengchen.iask.in:21648/api/orders`

 请求方式:GET

 需要传递的参数 ：`token uid`

 服务器端返回数据:`{
  "error_code": "4000",
  "msg": "success"
  "data":"["数据"]"
}`

  服务器端返回数据:`{
  "error_code": "4013",
  "msg": "fail"
}` 

 uid  用户id

---- 

下单操作(存在bug，未进行事务操作)
 
 请求URL：`http://mmengchen.iask.in:21648/api/orders/preOrder`

 请求方式:POST

 需要传递的参数 ：`token、u_id o_time g_id g_count`

  服务器端请求成功返回数据:`{
  "error_code": "4000",
  "msg": "下单成功"}`

  服务器端请求成功失败数据:`{
  "error_code": "4013",
  "msg": "toke失败"}`

 参数详情
 
 <table>
  <tr>
   <td>参数</td>
   <td>名称</td>
   <td>描述</td>
  <tr>
  <tr>
   <td>token</td>
   <td>与服务器交互的凭证</td>
   <td>必须有</td>
  <tr>
<tr>
   <td>u_id</td>
   <td>下单用户</td>
   <td>无</td>
  <tr>
 <tr>
   <td>o_time</td>
   <td>下单时间</td>
   <td>须要date类型</td>
  <tr>
  <tr>
   <td>g_id</td>
   <td>商品ID</td>
   <td>无</td>
  <tr>
 <tr>
   <td>g_count</td>
   <td>商品数量</td>
   <td>须要大于1</td>
  <tr>
 </table>

----

 取消订单操作
   
  请求URL：`http://mmengchen.iask.in:21648/api/orders/cancelOrder`

 请求方式:GET

 需要传递的参数 ：`token orderId uid`

  服务器端请求成功返回数据:`{
  "error_code": "4000",
  "msg": "success"}`

  服务器端请求成功失败数据:`{
  "error_code": "4013",
  "msg": "失败"}`
 

  token  

  orderId为订单id

  uid 用户id

----
  购物车模块
  
 查询购物车

 请求URL：`http://mmengchen.iask.in:21648/api/shopcar`

 请求方式:GET

 需要传递的参数 ：`token uid`

  服务器端请求成功返回数据:`{
  "error_code": "4000",
  "msg": "success",data:"{}"}`

  服务器端请求成功失败数据:`{
  "error_code": "4013",
  "msg": "失败"}`
 

  token  移动端唯一的凭证

  uid 用户id

----
  删除购物车

 请求URL：`http://mmengchen.iask.in:21648/api/shopcar/delCar`

 请求方式:GET

 需要传递的参数 ：`token carid` 

  服务器端请求成功返回数据:`{
  "error_code": "4000",
  "msg": "success",data:"{}"}`

  服务器端请求成功失败数据:`{
  "error_code": "4013",
  "msg": "失败"}`
 

  token  移动端唯一的凭证
  
  carid 购物车id

----
 添加购物车

 请求URL：`http://mmengchen.iask.in:21648/api/shopcar/addCar`

 请求方式:POST 

 需要传递的参数 ：`token u_id g_id g_count`

  服务器端请求成功返回数据:`{
  "error_code": "4000",
  "msg": "success"}`

  服务器端请求成功失败数据:`{
  "error_code": "4013",
  "msg": "失败"}`
 

  token  移动端唯一的凭证


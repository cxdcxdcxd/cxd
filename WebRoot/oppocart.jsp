<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     <title>『OPPO订单显示』</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/oppocart.css">
	<script  src="js/jquery-1.8.0.js"></script>
<style type="text/css">
.goods_list{
text-align:center;

}
.goods_list .name{
color:red;
}
.goods_list .item_money{
color:green;
font-weight:bold;
}
</style>
  </head>
  <script >
       $(function(){
          // 累计价格
          var total=0;
            $(".item_money").each(function(k,v){
               total+=parseFloat($(v).html()); 
            
            }); 
          $("#total_money").html("总价："+total+"元");
          $("#total_money").css({color:"#393939"});
          
          // 拼接carids
          var carids="";
           $(".goods_list li").each(function(k,v){
              // 除了最后一个元素外，其他元素都追加-
              if(k!=$(".goods_list li").size()-1){
               carids+=$(v).find(".ids").html()+","; 
              }else{
               carids+=$(v).find(".ids").html();
              }
           }); 
           
         // 点击“确定订单”跳转页面
          $("#confirmOrder").click(function(){
               window.location="confirm_order.jsp?cids="+carids+"&total="+total; 
          });  
           
       });
    </script>
  <body class="cart" bgcolor="#F7F7F7">
  
   <!-- 标题展示-->
   
      <div class="header">
     <ul class="nav">
          <li><a href="http://localhost:8080/myproject/login0.html">登录</a></li>
          <li><a href="http://localhost:8080/myproject/register0.html">注册</a></li>
           <li><a href="UserServlet?flag=logout">退出登录</a></li>
       </ul>
      </div>
       <div class="header_2">
       <span class="oppo"><a href="#"></a></span>
      </div>
      
      <div class="header2">
       <span ><a href="#">oppo</a></span>
       <ul class="nav">
           <li><a href="http://localhost:8080/myproject/home.html">首页</a></li>
           <li class="product"><a href="http://localhost:8080/myproject/product.html">产品</a></li>
          <li><a href="http://localhost:8080/myproject/newopposhopping.jsp">商城</a></li>
          <li><a href="http://localhost:8080/myproject/tryShop.html">体验店</a></li>
          <li><a href="http://localhost:8080/myproject/service.html">服务</a></li>
          <li><a href="http://localhost:8080/myproject/index0.jsp">购买</a></li>
          <li><a href="http://www.oppo.cn/">社区</a></li>
          <li><a href="https://yun.oppo.com/login">云服务</a></li>
       </ul>    
    </div>
  
  
  
  
  <div class="middle">
   <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/jquery.luara.0.0.1.min.js"></script>
  <div class="welcome">  <c:if test="${not empty sessionScope.user}">
         欢迎用户:${sessionScope.user.username}<br>
         您的购物车如下:
  </c:if><br>
  </div> 
  
  
  
  <div class="goods">
  <ul  class="goods_list"> 
 <li> <table class="goods_list" border="1">
    <c:forEach var="cart" items="${mylist}">
    
    
    
   <tr> 
        <th><span class="name">名称：${cart.oppos.opponame}</span></th>
        <th><img src="images/${cart.oppos.picture}"></th>
   </tr> 
   
   <tr>
      <th>数量:&nbsp;<input style="width:20px" type="text" value="${cart.quantity}" readonly size=5></th>
      <th>小计：￥<span class="item_money" style="color:#393939">${cart.oppos.price*cart.quantity }</span>元</li>
      </th>
   <th><span class="ids" style="display:none">${cart.cartid}</span>  
   <a href="CartServlet?flag=delItem&cartid=${cart.cartid}" style="text-decoration:none;color:#393939">删除订单项</a>
  </th>
  
   </tr>
   
   
     </c:forEach>
    
     <br>  <br>  <br>  <br>
   </table>
   </li>
   </ul>  
    </div>
    
    
    
 <div class="span"> <span id="total_money" style="color:#393939">总价：</span> </div> 
  <div class="button1" style="width:100px;height:40px;background:#009B72;text-align:center;line-height:40px;color:black"> 
  <a id="confirmOrder" style="text-decoration:none">确认订单</a>
   </div>	
</div>


<br><br><br><br><br><br><br><br><br><br><br><br>
<div class="bottom">
   
    <div class="commend">
    <span>推荐机型</span>
    <ul>
    <p style = "margin:25px"><li><a href="#">R11</a></li></p>
    <p style = "margin:15px"><li><a href="#">R11Plus</a></li></p>
    <p style = "margin:15px"><li><a href="#">A57</a></li></p>
    <p style = "margin:15px"><li><a href="#">A59s</a></li></p>
    </ul>
    
    
    </div>   
    
    
    
     <div class="service">
     <span>服务</span>
      <ul>
    <p style = "margin:25px"><li><a href="#">服务网点查询</a></li></p>
    <p style = "margin:15px"><li><a href="#">零配件价格查询</a></li></p>
    <p style = "margin:15px"><li><a href="#">官方授权网店</a></li></p>
    
    </ul>
     </div> 
     
     
    <div class="concerning">
    <span>关于我们</span>
     <ul>
    <p style = "margin:25px"><li><a href="#">关于OPPO</a></li></p>
    <p style = "margin:15px"><li><a href="#">加入我们</a></li></p>
    <p style = "margin:15px"><li><a href="#">发布会回顾</a></li></p>
    </ul>
    </div> 
    
    
     <div class="business">
     <span>商务合作</span>
      <ul>
    <p style = "margin:25px"><li><a href="#">开放平台</a></li></p>
    <p style = "margin:15px"><li><a href="#">采购相关</a></li></p>
    </ul>
     </div> 
   
   <div class="online">
   <a href="#"><img src="images/icon-online.png" style="width: 183px;height: 47px;"></a><br>
   <p style="margin:15px"><span class="first">4001-666-888</span></p>
   <p style="margin:2px"><span class="second">（24小时全国服务热线）</span></p>
   </div>
   </div> 
   
   
   
   <!--网关部分  -->
   <div class="about">
   <hr> <br>
    
    <div class="copy">© 2005 - 2017 OPPO 版权所有 粤ICP备08130115号-1 联系方式：4001-666-888  
     <img src="images/police1.png" style="width: 27px;height: 25px;">
     <span>关注我们:</span>
     <ul class="image">
           <li class="weibo"><a href="http://weibo.com/oppo"><img src="images/weibo.png" style="width: 45px;height: 45px;"></a> </li>
           <li class="weixin"><a href="#"> <img src="images/weixin.png" style="width: 45px;height:45px;"></a> </li>
           <li class="zhi"><a href="#"> <img src="images/zhi.png" style="width: 45px;height: 45px;"></a> </li>
       </ul>
     
     </div>
     
     
     
   </div>
  <br> <br> <br> <br><br><br><br>


  </body>
</html>

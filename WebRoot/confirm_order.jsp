<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>『OPPO订单信息』</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="css/confirm_order.css">

  <script  src="js/jquery-1.8.0.js"></script>
  <script>
     $(function(){
       //window.location返回值是object
        var addr=window.location+"";
        var arr=addr.split("?");
        var prs=arr[1].split("&");// cids=1-2-3 ,total=704
        $("#cartids").val(prs[0].split("=")[1]);
        $("#money").val(prs[1].split("=")[1]);
     });
  </script>
  </head>
  <body>
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
   <form action="OrderServlet?flag=goumai" method="post">
  <table border="0">   
    <tr><th>电话:</th><th><input type="text"  name="telphone"></th></tr>
    <tr><th>收货地址:</th><th><input type="text" name="address"></th></tr>
              <tr><th>收件人:</th><th><input type="text" name="uname" value="${sessionScope.user.username}" readonly></th></tr>
                <tr><th>金额 :</th><th><input type="text" id="money" name="money" readonly></th></tr>
          
     
      
    
  </table>  
  <div class="button1">
    <input class="hid" type="hidden" id="cartids" name="cartids">        
    <input class="sub" type="submit" value="提交订单">
    <input class="res" type="reset" value="重置"　>  
  <a href="CartServlet?flag=showcart">返回</a>   
  </div>
   </form>
</div>  
  <br> <br> <br> <br> <br><br>
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

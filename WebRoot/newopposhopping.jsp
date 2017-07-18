<%@ page language="java" import="java.util.*,dao.*,model.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
  <title>『OPPO官网商城』</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/opposhopping.css">


  </head>
  
  <body>
   <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/jquery.luara.0.0.1.min.js"></script>
    
   <% 
     OppoDao dao=new OppoDao();
     List<Oppo> list=dao.getAllOppo();
     request.setAttribute("list",list);
  %>
    <div class="header">
     <ul class="nav">
          <li><a href="http://localhost:8080/myproject/login0.html">登录</a></li>
          <li><a href="http://localhost:8080/myproject/newRegister.html">注册</a></li>
          <li><a href="UserServlet?flag=logout">退出登录</a></li>
       </ul>
      </div>
       <div class="header_2">
       <span class="oppo"><a href="#"></a></span>
      </div>
      
      <div class="header2">
       <span ><a href="#">oppo</a></span>
       <ul class="nav">
          <li class="home1"><a href="http://localhost:8080/myproject/home.html">首页</a></li>
           <li><a href="http://localhost:8080/myproject/product.html">产品</a></li>
          <li><a href="http://localhost:8080/myproject/newopposhopping.jsp">商城</a></li>
          <li><a href="http://localhost:8080/myproject/tryShop.html">体验店</a></li>
          <li><a href="http://localhost:8080/myproject/service.html">服务</a></li>
          <li><a href="http://localhost:8080/myproject/index0.jsp">购买</a></li>
          <li><a href="http://www.oppo.cn/">社区</a></li>
          <li><a href="https://yun.oppo.com/login">云服务</a></li>
       </ul>    
    </div>
   <div class="example2">
        <ul>
            <li><em><a href="#"><img src="images/1.png" alt="1"></a></em></li>
            <li><em><a href="#"><img src="images/2.png" alt="2"></a></em></li>
            <li><em><a href="#"><img src="images/3.png" alt="3"></a></em></li>
            <li><em><a href="#"><img src="images/4.png" alt="4"></a></em></li>
        </ul>
        <ol>
            <li><br></li>
            <li><br></li>
            <li><br></li>
            <li><br></li>
        </ol>
    </div>
    <!--Luara图片切换骨架end-->
    
<em><script>
        $(function(){
            $(".example2").luara({width:"1500",height:"570",interval:2000,selected:"seleted",deriction:"left"});

        });
    </script><br><br><br></em>
    
    
    
 <div class="goods">
 
 
    <div class="first_line"> 
      <div class="f_1"><em><img src="images/${list.get(0).getPicture()}"><span class="price0">￥${list.get(0).getPrice()}元</span></em>
      
      </div>
       <div class="f_2"><em><img src="images/${list.get(1).getPicture()}"><span class="price1">￥${list.get(1).getPrice()}元</span></em></div>
        <div class="f_3"><em><img src="images/${list.get(2).getPicture()}"><span class="price2">￥${list.get(2).getPrice()}元</span></em></div>
         <div class="f_4"><em><img src="images/${list.get(3).getPicture()}"><span class="price3">￥${list.get(3).getPrice()}元</span></em></div>
      </div>
      
      
      
    <div class="second_line">  
     <div class="s_1"> <em><img src="images/${list.get(4).getPicture()}"><span class="price4">￥${list.get(4).getPrice()}元</span></em></div>
      <div class="s_2"><em><img src="images/${list.get(5).getPicture()}"><span class="price5">￥${list.get(5).getPrice()}元</span></em></div>
       <div class="s_3"><em><img src="images/${list.get(6).getPicture()}"><span class="price6">￥${list.get(6).getPrice()}元</span></em></div>
        <div class="s_4"><em><img src="images/${list.get(7).getPicture()}"><span class="price7">￥${list.get(7).getPrice()}元</span></em></div>
      </div>
 
    <div class="third_line"> 
     <div class="t_1"><em><img src="images/${list.get(8).getPicture()}"><span class="price8">￥${list.get(8).getPrice()}元</span></em></div>
      <div class="t_2"><em><img src="images/${list.get(9).getPicture()}"><span class="price9">￥${list.get(9).getPrice()}元</span></em></div>
       <div class="t_3"><em><img src="images/${list.get(10).getPicture()}"><span class="price10">￥${list.get(10).getPrice()}元</span></em></div>
        <div class="t_4"><em><img src="images/${list.get(11).getPicture()}"><span class="price11">￥${list.get(11).getPrice()}元</span></em></div>
      </div>
      
      
    <div class="forth_line"> 
     <div class="fo_1"><em><img src="images/${list.get(12).getPicture()}"><span class="price12">￥${list.get(12).getPrice()}元</span></em></div>
     <div class="fo_2"><em><img src="images/${list.get(13).getPicture()}"><span class="price13">￥${list.get(13).getPrice()}元</span></em></div>
      <div class="fo_3"><em><img src="images/${list.get(14).getPicture()}"><span class="price14">￥${list.get(14).getPrice()}元</span></em></div>
       <div class="fo_3"><em><img src="images/${list.get(15).getPicture()}"><span class="price15">￥${list.get(15).getPrice()}元</span></em></div>
      </div>
 
 </div>  

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

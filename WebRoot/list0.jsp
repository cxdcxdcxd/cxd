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
    
    <title>My JSP 'list.jsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/mylist0.css">

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
  
  
  
   <c:if test="${empty pageresult.pageData}">
                  未搜索到符合要求的产品
     </c:if>
  <!-- div显示问题 -->
  <c:if test="${not empty pageresult}">
  <div class="show">
    <ul class="list">
       <c:forEach var="oppo" items="${pageresult.pageData}">
      <li>
          <a href="CartServlet?oppoid=${oppo.oppoid}&flag=addcart"><img src="images/cart.png" style="width: 30px;height: 30px;">加入购物车</a> <br>
         <div class="mask">
         <span>${oppo.opponame}
                <br>
                                  ￥${oppo.price }
         </span> 
         </div>
         <img src="images/${oppo.picture }" >
      </li>                  
       </c:forEach>
  </ul>  
    当前${pageresult.currentPage }/${pageresult.totalPage }页     &nbsp;&nbsp;
    <a  style="text-decoration: none;color:green" href="OppoServlet?flag=search&seach_key=${seach_key}&currentPage=1">首页</a>
    <c:if test="${pageresult.currentPage!=1}">
	<a style="text-decoration: none;color:green" href="OppoServlet?flag=search&seach_key=${seach_key}&currentPage=${pageresult.currentPage-1}">上一页</a>
	</c:if> 
    <c:if test="${pageresult.currentPage==1}">
	<a style="text-decoration: none;color:green" href="OppoServlet?flag=search&seach_key=${seach_key}&currentPage=${pageresult.currentPage}">上一页</a>
	</c:if> 
	 <c:if test="${pageresult.currentPage==pageresult.totalPage}">
	 	<a style="text-decoration: none;color:green" href="OppoServlet?flag=search&seach_key=${seach_key}&currentPage=${pageresult.currentPage}">下一页</a>
	 </c:if>
	  <c:if test="${pageresult.currentPage!=pageresult.totalPage}">
	  	<a style="text-decoration: none;color:green" href="OppoServlet?flag=search&seach_key=${seach_key}&currentPage=${pageresult.currentPage+1}">下一页</a>
	 </c:if>
	<a style="text-decoration: none;color:green" href="OppoServlet?flag=search&seach_key=${seach_key}&currentPage=${pageresult.totalPage}">末页</a>
  </div>
  </c:if>
  
    <div class="bottom">
    <div class="commend">
    
    <ul>
    <li><span>推荐机型</span></li>
    <p style = "margin:25px"><li height=25px><a href="#">R11</a></li></p>
    <p style = "margin:15px"><li><a href="#">R11Plus</a></li></p>
    <p style = "margin:15px"><li><a href="#">A57</a></li></p>
    <p style = "margin:15px"><li><a href="#">A59s</a></li></p>
    </ul>
    
    
    </div>   
    
    
    
     <div class="service">
    
      <ul>
      <li><span>服务</span></li>
    <p style = "margin:25px"><li><a href="#">服务网点查询</a></li></p>
    <p style = "margin:15px"><li><a href="#">零配件价格查询</a></li></p>
    <p style = "margin:15px"><li><a href="#">官方授权网店</a></li></p>
    
    </ul>
     </div> 
     
     
    <div class="concerning">
    
     <ul>
     <li><span>关于我们</span></li>
    <p style = "margin:25px"><li><a href="#">关于OPPO</a></li></p>
    <p style = "margin:15px"><li><a href="#">加入我们</a></li></p>
    <p style = "margin:15px"><li><a href="#">发布会回顾</a></li></p>
    </ul>
    </div> 
    
    
     <div class="business">
    
      <ul>
      <li><span>商务合作</span></li>
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
    <hr>
    <br> <br> 
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

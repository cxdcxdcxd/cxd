package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDao;
import dao.OrderDao;

import model.Order;
import model.User;

public class OrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        //1.鎺ユ敹璇锋眰鍙傛暟
		 request.setCharacterEncoding("utf-8");
		 String ff=request.getParameter("flag");
		 if("goumai".equals(ff)){
			 //涓嬭鍗�
			 goumai(request,response);
		 }
		
	}

	private void goumai(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 鎺ユ敹璇锋眰鍙傛暟
		 String tel=request.getParameter("telphone");
		 System.out.println(tel);
		 String addr=request.getParameter("address");
		 User user=(User)request.getSession().getAttribute("user");
	     int uid=0;
	     float money=0;
		 if(user!=null){
			 uid=user.getUserid(); 
	     }
		String m=request.getParameter("money");
		if(m!=null){
		money=Float.parseFloat(m);}
		String cids=request.getParameter("cartids");//32,37,38,39
		
	  // 灏佽Order 瀵硅薄
		 Order order=new Order();
		 order.setUserid(uid);
		 order.setAddress(addr);
		 order.setTelphone(tel);
		 order.setTotalmoney(money);
		 
		 Timestamp time=new Timestamp(new Date().getTime());
		 order.setSubtime(time);
	 //2. 璋冪敤dao
		 OrderDao dao=new OrderDao();
		 boolean result= dao.goumai(order,cids);
		 
		 if(result){
		 request.getRequestDispatcher("index0.jsp").forward(request, response);

		 }
	
	}

}

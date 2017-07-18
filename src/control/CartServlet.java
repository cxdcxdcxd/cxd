package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDao;
import dao.UserDao;

import model.*;

public class CartServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ff=request.getParameter("flag");
		if(ff.equals("addcart")){
			addCart(request,response);
		}
		if("showcart".equals(ff)){
			showCart(request,response);
		}
		if("delItem".equals(ff)){
       	 
       	delCartItem(request,response);
        }
	}
	private void delCartItem(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  String catid= request.getParameter("cartid");
		  int cartid=Integer.parseInt(catid);
		   CartDao dao=new CartDao();
		  boolean result= dao.delCartItem(cartid);
		  if(result){
			  request.setAttribute("msg","删除成功"); 
			  showCart(request,response);
		  }
	}
	private void showCart(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user=(User) request.getSession().getAttribute("user");
		CartDao cdao=new CartDao();
		List<cart> list=cdao.showCartById(user.getUserid());
		if(list!=null){
			request.setAttribute("mylist",list);
			 request.getRequestDispatcher("oppocart.jsp").forward(request, response);
		}
		
	}
	private void addCart(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user=(User) request.getSession().getAttribute("user");
		if(user!=null){
			CartDao dao=new CartDao();
			String oppoid=request.getParameter("oppoid");
			dao.addCart(oppoid,user.getUserid());
			System.out.println(oppoid+"  "+user.getUserid());
			 request.getRequestDispatcher("index0.jsp").forward(request, response);
		}
		else{
			 request.getRequestDispatcher("login0.html").forward(request, response);
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}
}

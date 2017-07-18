package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Oppo;
import dao.CatalogDao;
import dao.OppoDao;

public class OppoServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { 
		String ff=request.getParameter("flag");
		if("getOppoBycId".equals(ff)){
			//通锟斤拷锟斤拷锟絠d锟斤拷询锟斤拷品
			getOppoBycId(request,response);
		}
		if("search".equals(ff)){
		//通锟斤拷丶锟斤拷植锟窖�
		searchBystr(request,response);
		}
	}

	private void searchBystr(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//1.锟斤拷锟杰诧拷询锟截硷拷锟斤拷
		String str=request.getParameter("seach_key");
		str=new String(str.getBytes("iso-8859-1"),"utf-8");
		System.out.println(str);

		//2.锟斤拷锟斤拷dao锟斤拷
		OppoDao dao=new OppoDao();
		List<Oppo> list1=dao.getOppoByStr(str);
		request.setAttribute("list", list1);
		request.getRequestDispatcher("list0.jsp").forward(request, response);
		
	}

	private void getOppoBycId(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	  //1. 锟斤拷取锟斤拷锟斤拷锟斤拷锟斤拷锟�
		String id=request.getParameter("cid");
		// 锟斤拷锟街凤拷转锟斤拷锟斤拷锟斤拷锟斤拷
		int cid= Integer.parseInt(id);
	 //2. 锟斤拷锟斤拷dao
		 CatalogDao dao=new CatalogDao();
	    List<Oppo>	list= dao.getOppoBycid(cid);
	    System.out.println(list.get(0).getOpponame());
	 // 3.list锟斤拷锟絩equest锟斤拷转锟斤拷锟斤拷jsp页锟斤拷锟斤拷示	
	    if(list!=null){
	    	request.setAttribute("oppoList",list);
	    	request.getRequestDispatcher("oppo0.jsp").forward(request, response);
	    }
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}

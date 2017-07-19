package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Page;
import model.Oppo;
import dao.CatalogDao;
import dao.OppoDao;

public class OppoServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { 
		String ff=request.getParameter("flag");
		if("getOppoBycId".equals(ff)){
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
		String currPage = request.getParameter("currentPage");
		// 将字符串转化成整型
		if (currPage == null || "".equals(currPage.trim())) {
			currPage = "1"; // 第一次访问，设置当前页为1;
		}
		int cp=Integer.parseInt(currPage);
		Page<Oppo> page=new Page<Oppo>();
		page.setCurrentPage(cp);
		//2.锟斤拷锟斤拷dao锟斤拷
		OppoDao dao=new OppoDao();
		dao.getOppoByStr(str,page);
		 if (page.getPageData()!=null&&page.getPageData().size()!=0) {
				request.setAttribute("pageresult",page);
				request.setAttribute("seach_key",str);
				request.setAttribute("flag","search");
				request.getRequestDispatcher("list0.jsp").forward(request, response);
			}
		
	}

	private void getOppoBycId(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	  //1. 锟斤拷取锟斤拷锟斤拷锟斤拷锟斤拷锟�
		String id=request.getParameter("cid");
		// 锟斤拷锟街凤拷转锟斤拷锟斤拷锟斤拷锟斤拷
		int cid= Integer.parseInt(id);
	 //2. 锟斤拷锟斤拷dao
		
		
		String currPage = request.getParameter("currentPage");
		// 将字符串转化成整型
		if (currPage == null || "".equals(currPage.trim())) {
			currPage = "1"; // 第一次访问，设置当前页为1;
		}
		int cp=Integer.parseInt(currPage);
		Page<Oppo> page=new Page<Oppo>();
		page.setCurrentPage(cp);
		 CatalogDao dao=new CatalogDao();
	    dao.getOppoBycid(cid,page);
	 // 3.list锟斤拷锟絩equest锟斤拷转锟斤拷锟斤拷jsp页锟斤拷锟斤拷示	
	    if (page.getPageData()!=null&&page.getPageData().size()!=0) {
			request.setAttribute("pageresult",page);
			request.setAttribute("cid",id);
			request.setAttribute("flag","getOppoBycId");
			request.getRequestDispatcher("oppo0.jsp").forward(request, response);
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}

package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


import util.DBUtil;
import util.Page;
import model.Catalog;
import model.Oppo;

public class CatalogDao {
   //查询所有分类
	public List<Catalog> getCatalogs(){
	 List<Catalog> list=new ArrayList<Catalog>();
	 Connection con=null;
	 PreparedStatement pst=null;
	 ResultSet rs=null;
	 Catalog cg=null;
	 try{
		con=DBUtil.getCon();
		String sql="select * from catalog";
		pst=con.prepareStatement(sql);
		rs=pst.executeQuery();
		while(rs.next()){
			cg=new Catalog();
			cg.setCatalogid(rs.getInt("catalogid"));
			cg.setCatalogname(rs.getString("catalogname"));
			
			list.add(cg);
		}
	 }catch(Exception e){
		e.printStackTrace(); 
	 }finally{
		 DBUtil.closeAll(con, rs, pst);
	 }
	 return list;	
	}
// 通过cid查询产品列表
	public void getOppoBycid(int cid,Page<?> page) {
		List<Oppo> list=new ArrayList<Oppo>();
		 Oppo oppo=null;
		 Connection con=null;
		 PreparedStatement pst=null;
		 ResultSet rs=null;
		 try{
			con=DBUtil.getCon();
			String count="select count(*) from oppo where catalogid="+cid;
			pst=con.prepareStatement(count);
			rs=pst.executeQuery();
			if(rs.next())
				page.setTotalCount(rs.getInt(1));
			String sql="select * from oppo where catalogid=? limit ?,?";
			pst=con.prepareStatement(sql);
			pst.setInt(1, cid);
			pst.setInt(2,(page.getCurrentPage()-1)*page.getPageCount());
			pst.setInt(3,page.getPageCount());
			rs=pst.executeQuery();
			while(rs.next()){
				oppo=new Oppo();
				oppo.setCatalogid(cid);
				oppo.setOpponame(rs.getString("opponame"));
				System.out.println(rs.getString("opponame"));
				oppo.setOppoid(rs.getInt("oppoid"));
				oppo.setPicture(rs.getString("picture"));
				oppo.setPrice(rs.getFloat("price"));
				list.add(oppo);
				page.setPageData(list);
			}
		 }catch(Exception e){
			e.printStackTrace(); 
		 }finally{
			 DBUtil.closeAll(con, rs, pst);
		 }
		 
	}
}

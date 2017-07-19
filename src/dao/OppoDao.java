package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Oppo;
import util.DBUtil;
import util.Page;

public class OppoDao {
	public void getOppoByStr(String str, Page<Oppo> page) {
		// TODO Auto-generated method stub
			List<Oppo> list=new ArrayList<Oppo>();
			 Oppo oppo=null;
			 Connection con=null;
			 PreparedStatement pst=null;
			 ResultSet rs=null;
			 try{
				con=DBUtil.getCon();
				String count="select count(*) from oppo where opponame like ?";
				pst=con.prepareStatement(count);
				pst.setString(1,"%"+str+"%");
				rs=pst.executeQuery();
				if(rs.next()){
				page.setTotalCount(rs.getInt(1));
				}
				String sql="select * from oppo where opponame like ? limit ?,?";
				pst=con.prepareStatement(sql);
				pst.setString(1,"%"+str+"%");
				pst.setInt(2,(page.getCurrentPage()-1)*page.getPageCount());
				pst.setInt(3,page.getPageCount());
				rs=pst.executeQuery();
				while(rs.next()){
					oppo=new Oppo();
					oppo.setCatalogid(rs.getInt("catalogid"));
					oppo.setOpponame(rs.getString("opponame"));
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

	public List<Oppo> getAllOppo() {
		// TODO Auto-generated method stub
		List<Oppo> list=new ArrayList<Oppo>();
		 Oppo oppo=null;
		 Connection con=null;
		 PreparedStatement pst=null;
		 ResultSet rs=null;
		 try{
			con=DBUtil.getCon();
			String sql="select * from oppo";
			pst=con.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				oppo=new Oppo();
				oppo.setCatalogid(rs.getInt("catalogid"));
				oppo.setOpponame(rs.getString("opponame"));
				oppo.setOppoid(rs.getInt("oppoid"));
				oppo.setPicture(rs.getString("picture"));
				oppo.setPrice(rs.getFloat("price"));
				list.add(oppo);
			}
		 }catch(Exception e){
			e.printStackTrace(); 
		 }finally{
			 DBUtil.closeAll(con, rs,pst);
		 }
		 return list;
	}
}

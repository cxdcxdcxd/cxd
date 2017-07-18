package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Oppo;
import model.cart;
import util.DBUtil;

public class CartDao {
	public void addCart(String oppoid, int userid) {
		// TODO Auto-generated method stub
		  Connection con=null;
		   PreparedStatement st=null;
		   boolean result=false;
		   try{
			   con=DBUtil.getCon();
			   String sql1="select * from cart where userid=? and oppoid=? and orderid is null";
			   st=con.prepareStatement(sql1);
			   st.setInt(1,userid);
			   st.setInt(2,Integer.parseInt(oppoid));
			   if(st.executeQuery().next()){
				   String sql3="update cart set quantity=quantity+1 where userid=? and oppoid=?";
				    st= con.prepareStatement(sql3);
				    st.setInt(1,userid);
				    st.setInt(2,Integer.parseInt(oppoid));
				    st.execute(); 
		   
			   }
			   else{
			
				   String sql="insert into cart(userid,oppoid,quantity) values(?,?,?)";
				    st= con.prepareStatement(sql);
				    st.setInt(1,userid);
				    st.setInt(2,Integer.parseInt(oppoid));
				    st.setInt(3, 1);
				    st.execute();
			   }
			   result=true;
		  }catch(Exception e){
			  e.printStackTrace();
		  }finally{
			  DBUtil.closeAll(con, null, st);
		  }
		   
	}
	public List<cart> showCartById(int userid) {
		// TODO Auto-generated method stub
		List<cart> list=new ArrayList<cart>();
		Connection con=null;
		 PreparedStatement st=null;
		 ResultSet rs=null;
		 cart c=null;
		
		 try{
			 con=DBUtil.getCon();
			
			 String sql="select c.*,o.* from cart c,oppo o where userid=? and c.oppoid=o.oppoid and orderid is null";
			 st=con.prepareStatement(sql);
			 st.setInt(1,userid);
			 rs=st.executeQuery();
			 while(rs.next()){
				 c=new cart();
				 c.setCartid(rs.getInt("cartid"));
				 c.setOppoid(rs.getInt("oppoid"));
				 c.setUserid(userid);
				 c.setQuantity(rs.getInt("quantity"));
				 Oppo oppo=new Oppo();
				 oppo.setCatalogid(rs.getInt("cartid"));
				 oppo.setOppoid(rs.getInt("oppoid"));
				 oppo.setOpponame(rs.getString("opponame"));
				 System.out.println(oppo.getOpponame());
				 oppo.setPrice(rs.getDouble("price"));
				 oppo.setPicture(rs.getString("picture"));
				 c.setOppos(oppo);
				 list.add(c);
				 
			 }
		 }catch(Exception e){
			 
		 }finally{
			 DBUtil.closeAll(con, rs, st);
		 }
		return list;
	}
	public boolean delCartItem(int cartid) {
		// TODO Auto-generated method stub
		boolean result=false;
		Connection con=null;
		PreparedStatement pst=null;
		try{
			con=DBUtil.getCon();
			String sql="delete from cart where cartid=?";
			pst=con.prepareStatement(sql);
			pst.setInt(1, cartid);
			pst.execute();
			result=true;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.closeAll(con, null, pst);
		}
		return result;
	}
}

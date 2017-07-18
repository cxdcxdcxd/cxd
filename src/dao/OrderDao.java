package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBUtil;
import model.Order;

public class OrderDao {
		public boolean goumai(Order order,String cids) {
			// 1.order表 insert ，购物车cart删除（orderid设置值）
			Connection con=null;
			   PreparedStatement st=null;
			   boolean result=false;//执行结果
			   try{
			   //1.连接数据库
			    con=DBUtil.getCon();
			   //2.sql语句
			    String sql="insert into myorder(mytime,totalmoney,telphone,address,userid) values(?,?,?,?,?)";
			   //3.创建statement对象
			    st=con.prepareStatement(sql,1);
			      st.setTimestamp(1, order.getSubtime());
			      st.setFloat(2, order.getTotalmoney());
			      st.setString(3, order.getTelphone());
			      st.setString(4, order.getAddress());
			     st.setInt(5, order.getUserid());
			     System.out.println(order.getSubtime()+" "+order.getTotalmoney()+" "+order.getTelphone());
			   //4.执行sql
			     //事务：一致性
			     con.setAutoCommit(false);//开启事务
			     st.execute();
			     int orderid=0;//保存自增长的主键值
			     ResultSet rs=st.getGeneratedKeys();//获取产生的自增长的id
			     if(rs.next()){
			    	 orderid=rs.getInt(1) ;
			    	 System.out.println(orderid);
			    	 System.out.println(cids+"           "+orderid);
				 }  
			     
			     String[] c=cids.split(",");
			     for(int i=0;i<c.length;i++){
			    	 String sql2="update cart set orderid=? where cartid=?";
			    	  st=con.prepareStatement(sql2);
					   st.setInt(1, orderid);
					   st.setInt(2, Integer.parseInt(c[i]));
					   st.execute();
			     }
			     //update cart set orderid=?  where cartid in(1,2,3)
			   /*  String sql2="update cart set orderid=? where String(cartid) in ( ? )";
			     st=con.prepareStatement(sql2);
			     st.setInt(1, orderid);
			     System.out.println(orderid);
			     st.setString(2,cids);
			     st.execute();*/
			     con.commit();//事务提交
			     result=true;
			  }catch(Exception e){
				  System.out.println(e.getMessage());
				  try {
					con.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}//事务回滚
				  
			  }finally{//释放资源
				  DBUtil.closeAll(con, null, st);
			  }
			   return result;	
		}

}

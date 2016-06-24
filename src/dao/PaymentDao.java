package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import dbcp.DBConnectionMgr;
import dto.MemberDto;
import dto.Payment_Dto;



public class PaymentDao {
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		DBConnectionMgr pool = null;
	
	public PaymentDao(){
		try{
			
		if(pool==null){
			pool = DBConnectionMgr.getInstance();
		}
					
		}catch(Exception err){
			System.out.println("DB연결 객체 생성 실패 : "+err);
		}
	}
//결제내역 조회	
	public Vector<Payment_Dto> PaymentList(){
		Vector<Payment_Dto> pay = new Vector<Payment_Dto>();	
					
		String sql = null;				
				
			sql ="select s.s_m, s.num, s.title, s.price, pa.part_num, pa.payment_option, pa.reporting_date"
			+ " from Speech_Meeting s"
			+ " join Participation pa on (s.num = pa.num and s.s_m =  pa.s_m) "
			+ " order by pa.reporting_date";
			
			
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				
				Payment_Dto dto = new Payment_Dto();
				
				dto.setS_m(rs.getString("s_m"));
				dto.setNum(rs.getInt("num"));
				dto.setPart_num(rs.getInt("part_num"));
				dto.setTitle(rs.getString("title"));
				dto.setPayment_option(rs.getInt("payment_option"));
				dto.setPrice(rs.getInt("price"));
				dto.setReporting_date(rs.getDate("reporting_date"));
				
				pay.add(dto);			
			}
		}
		catch(Exception err){
			System.out.println("결제내역 출력 : "+err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return  pay;
	}
	
	
	//결제내역 수정
	public Payment_Dto UpdatePaymentList(Payment_Dto dto){	
					
		String sql = null;	

			sql = "update Participation set payment_option=? where part_num=?";
			System.out.println(dto.getPart_num());
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, dto.getPayment_option());
			stmt.setInt(2, dto.getPart_num());
			
			stmt.executeQuery();
			
		}
		catch(Exception err){
			System.out.println("결제 내역 수정 출력 : "+err);
		}
		finally{
			pool.freeConnection(con, stmt);
		}
		return dto;
	}
	
}

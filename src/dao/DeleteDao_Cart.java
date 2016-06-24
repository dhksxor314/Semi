/*
 페이지 - 마이페이지_장바구니 삭제
작성자 - 이주연
수정날짜 - 2016/06/20
설명 - 장바구니 삭제
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbcp.DBConnectionMgr;

public class DeleteDao_Cart {
	
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		DBConnectionMgr pool = null;
	
	public DeleteDao_Cart(){
		try{
			
		if(pool==null){
			pool = DBConnectionMgr.getInstance();
		}
					
		}catch(Exception err){
			System.out.println("DB연결 객체 생성 실패 : "+err);
		}
	}
		
//장바구니_강연 삭제
		public void delete_cart(int num){
			String sql = "delete from PutIn where putIn_num=?";
			
			try {
				con = pool.getConnection();
				stmt = con.prepareStatement(sql);
				stmt.setInt(1, num);
				stmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, stmt, rs);
			}
		}	
	
}

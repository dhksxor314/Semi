/*
 페이지 - 마이페이지_즐겨찾기 삭제
작성자 - 이주연
수정날짜 - 2016/06/20
설명 - 즐겨찾기 삭제 및 개설된 강연에 대한 메시지 삭제
 */

package dto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbcp.DBConnectionMgr;

public class DeleteDao_Bookmark {
	
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		DBConnectionMgr pool = null;
	
	public DeleteDao_Bookmark(){
		try{
			
		if(pool==null){
			pool = DBConnectionMgr.getInstance();
		}
					
		}catch(Exception err){
			System.out.println("DB연결 객체 생성 실패 : "+err);
		}
	}
		
//즐겨찾기 삭제
		public void delete_bookmark(int num){
			String sql = "delete from Bookmark where bookmark_num=?";
			
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

//메시지 삭제
		public void delete_message(int num){
			String sql = "delete from Message where msg_num=?";
			
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

/*
 페이지 - 마이페이지_활동내역 삭제
작성자 - 이주연
수정날짜 - 2016/06/20
설명 - 강연, 만남, 개설, 완료 삭제
 */

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbcp.DBConnectionMgr;

public class DeleteDao_Active {
	
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		DBConnectionMgr pool = null;
	
	public DeleteDao_Active(){
		try{
			
		if(pool==null){
			pool = DBConnectionMgr.getInstance();
		}
					
		}catch(Exception err){
			System.out.println("DB연결 객체 생성 실패 : "+err);
		}
	}
	
//활동내역_참가된 강연
	public void delete_speech(int num){
		String sql = "delete from Participation where num=?";
		
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
	
//활동내역_참가된 모임		
	public void delete_meeting(int num){
		String sql = "delete from Participation where num=?";
		
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
	
	
//개설내역_삭제
	public void delete_open(int num){
		String sql = "delete from Speech_Meeting where num=?";
		
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
	
	//30일 지난 강연, 모임에 한해서는 자동 삭제
		public void delete_complete(int num, String s_m){

			String sql = "delete from Speech_Meeting "
					+ "where add_MONTHS(reporting_date,1) < sysdate and num=? and s_m=?";
			try {
				con = pool.getConnection();
				stmt = con.prepareStatement(sql);
				stmt.setInt(1, num);
				stmt.setString(2, s_m);
				stmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, stmt, rs);
			}
		}
		
		/*String sql = "selete s.s_m, s.title, s.reporting_date, s.starttime, s.endtime, s.image, s.price"
		+ " from Speech_Meeting s"
		+ " join Participation p on (s.s_m = p.s_m)"
		+ " join Speaker sp on (s.speaker_num = sp.speaker_num)"
		+ " add_MONTHS(s.reporting_date,1) < sysdate and num=? and s_m=?";

*/
	
}

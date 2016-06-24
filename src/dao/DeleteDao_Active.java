/*
 ������ - ����������_Ȱ������ ����
�ۼ��� - ���ֿ�
������¥ - 2016/06/20
���� - ����, ����, ����, �Ϸ� ����
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
			System.out.println("DB���� ��ü ���� ���� : "+err);
		}
	}
	
//Ȱ������_������ ����
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
	
//Ȱ������_������ ����		
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
	
	
//��������_����
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
	
	//30�� ���� ����, ���ӿ� ���ؼ��� �ڵ� ����
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

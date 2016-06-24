/*
 ������ - ����������_���ã�� ����
�ۼ��� - ���ֿ�
������¥ - 2016/06/20
���� - ���ã�� ���� �� ������ ������ ���� �޽��� ����
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
			System.out.println("DB���� ��ü ���� ���� : "+err);
		}
	}
		
//���ã�� ����
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

//�޽��� ����
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

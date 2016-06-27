/*
 *  �ۼ��� : ������
 *  ���� : �����ڴ� �Ϲ�ȸ�� ó�� ȸ���������� ��������� �ʰ� DB���� ���� ���Խÿ� �����ȴ�.
 *  	  �� Dao�� �������� �α��� �� �ÿ��� ���ȴ�.
 *  
 * 
 */

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dbcp.DBConnectionMgr;
import dto.ManagerDto;
import dto.MemberDto;

public class ManagerDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public ManagerDao(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DB���ᰴü �������� : " + err);
		}
	}
	
	//�Ŵ����� �α��� �� �� ���
	public ManagerDto getManager(String id, String pw){
		ManagerDto dto = new ManagerDto();

		String sql = "select * from manager where id=? and password=?";
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, pw);
			rs = stmt.executeQuery();
			
			if(rs.next()){
				dto.setManage_num(rs.getInt("manage_num"));
				dto.setId(rs.getString("id"));
			}
		}
		catch(Exception err){
			System.out.println("�α��� ���� : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return dto;
	}
	
	
}

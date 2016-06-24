/*
 ������ - ����������_��������
�ۼ��� - ���ֿ�
������¥ - 2016/06/20
���� - ���� ��� �� ������ ������ ����
 */

package dto;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import dbcp.DBConnectionMgr;

public class UpdateDao {

	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	DBConnectionMgr pool = null;

public UpdateDao(){
	try{
		
	if(pool==null){
		pool = DBConnectionMgr.getInstance();
	}
				
	}catch(Exception err){
		System.out.println("DB���� ��ü ���� ���� : "+err);
	}
}

//��������
public MemberDto UpdateList(int num){
	
	MemberDto dto = new MemberDto();	
				
	String sql = null;	
	
		sql = "select id, name, phone, birthdate, password, email, invite_agree, image"
				+ " from member where mem_num="+num;
		
	try{
		con = pool.getConnection();
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();
		
		while(rs.next()){
			
			dto.setId(rs.getString("id"));
			dto.setName(rs.getString("name"));
			dto.setPhone(rs.getString("phone"));
			dto.setPassword(rs.getString("password"));
			dto.setBirthdate(rs.getInt("birthdate"));
			dto.setEmail(rs.getString("email"));
			dto.setInvite_agree(rs.getString("invite_agree"));
			dto.setImage(rs.getString("image"));	
		
		}
	}
	catch(Exception err){
		System.out.println("���� ���� ��� : "+err);
	}
	finally{
		pool.freeConnection(con, stmt, rs);
	}
	return dto;
}


//������ ���� ����
public MemberDto UpdateMemberList(MemberDto dto){	
				
	String sql = null;	

		sql = "update member set phone=?, email=?, password=?, invite_agree=?, image=? "
				+ " where mem_num=?";
		
	try{
		con = pool.getConnection();
		stmt = con.prepareStatement(sql);
		
		stmt.setString(1, dto.getPhone());
		stmt.setString(2, dto.getEmail());
		stmt.setString(3, dto.getPassword());
		stmt.setString(4, dto.getInvite_agree());
		stmt.setString(5, dto.getImage());
		stmt.setInt(6, dto.getMem_num());
		stmt.executeQuery();
		
	}
	catch(Exception err){
		System.out.println("���� ���� ���� : "+err);
	}
	finally{
		pool.freeConnection(con, stmt);
	}
	return dto;
}


//������_��������
public SpeakerDto SpeakerUpdateList(int  speaker_num){
	
	
	SpeakerDto dto = new SpeakerDto();	
				
	String sql = null;	
	
		sql = "select id, name, phone, password, email, image "
				+ " from speaker where  speaker_num="+speaker_num;
		
	try{
		con = pool.getConnection();
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();
		
		while(rs.next()){
			
			dto.setId(rs.getString("id"));
			dto.setName(rs.getString("name"));
			dto.setPhone(rs.getString("phone"));
			dto.setPassword(rs.getString("password"));
			dto.setEmail(rs.getString("email"));
			dto.setImage(rs.getString("image"));	

		
		}
	}
	catch(Exception err){
		System.out.println("������ ���� ���� ��� : "+err);
	}
	finally{
		pool.freeConnection(con, stmt, rs);
	}
	return dto;
}


//������ ������ ���� ����
public SpeakerDto SpeakerUpdate(SpeakerDto dto){	
				
	String sql = null;	

		sql = "update speaker set phone=?, email=?, password=?, image=? where speaker_num=?";
		
	try{
		con = pool.getConnection();
		stmt = con.prepareStatement(sql);
		
		stmt.setString(1, dto.getPhone());
		stmt.setString(2, dto.getEmail());
		stmt.setString(3, dto.getPassword());
		stmt.setString(4, dto.getImage());
		stmt.setInt(5, dto.getSpeaker_num());
		
		stmt.executeQuery();			
	}
	catch(Exception err){
		System.out.println("������ ���� ���� ���� : "+err);
	}
	finally{
		pool.freeConnection(con, stmt);
	}
	return dto;
}


}

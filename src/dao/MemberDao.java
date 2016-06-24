package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import dbcp.DBConnectionMgr;
import dto.MemberDto;

public class MemberDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public MemberDao(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DB연결객체 생성실패 : " + err);
		}
	}
	
	//로그인 할 때 일치하는 정보를 가져온다
	public MemberDto getId(String name, String email){
		MemberDto dto = new MemberDto();
		
		String sql = "select id, name from member where name=? and email=?";
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setString(2, email);
			rs = stmt.executeQuery();
			
			if(rs.next()){
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
			}
		}
		catch(Exception err){
			System.out.println("아이디 찾기 : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return dto;
	}
	
	//비밀번호 찾기
	public MemberDto getPw(String id, String email){
		MemberDto dto = new MemberDto();
		
		String sql = "select password, name from member where id=? and email=?";
		
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, email);
			rs = stmt.executeQuery();
			
			if(rs.next()){
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
			}
		}
		catch(Exception err){
			System.out.println("비밀번호 찾기 : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		
		return dto;
	}
	
	//로그인 시에 사용
	public MemberDto getMember(String id, String pw){
		MemberDto dto = new MemberDto();

		String sql = "select * from member where id=? and password=?";
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, pw);
			rs = stmt.executeQuery();
			
			if(rs.next()){
				dto.setMem_num(rs.getInt("mem_num"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setImage(rs.getString("image"));
			}
		}
		catch(Exception err){
			System.out.println("로그인 에러 : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return dto;
	}
	
	//회원가입 할 떄 중복된 아이디가 있는지 검사
	public boolean confirmId(String id){
		boolean a = true;
		String sql = "select * from member where id=?";
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			
			if(rs.next()){
				a=false;
			}
		}
		catch(Exception err){
			System.out.println("아이디 중복검사 에러 : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return a;
	}
	
	//회원 삭제
	public void deleteMember(int mem_num){	
		String sql = "delete from member where mem_num=" + mem_num;
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);	
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("deleteMember : " + err);
		}
		finally{
			pool.freeConnection(con, stmt);
		}
	}
	
	//회원 등록
	public void insertMember(MemberDto dto){ 
		try{		
			con = pool.getConnection();

			String sql = "insert into Member(mem_num, id, phone, email, point, invite_agree, gender, password, name, birthdate, image) values(seq_mem.nextVal, ?, ?, ?, 0, ?, ?, ?, ?, ?, ?)";
			stmt = con.prepareStatement(sql);
			
			stmt.setString(1, dto.getId());
			stmt.setString(2, dto.getPhone());
			stmt.setString(3, dto.getEmail());
			stmt.setString(4, dto.getInvite_agree());
			stmt.setString(5, dto.getGender());
			stmt.setString(6, dto.getPassword());
			stmt.setString(7, dto.getName());
			stmt.setInt(8, dto.getBirthdate());
			stmt.setString(9, dto.getImage());			
	
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("장소 추가 실패 : " + err);
		}
		finally{
			pool.freeConnection(con, stmt);
		}
	}	
	
	//회원 리스트 전달
	public Vector<MemberDto> getMemList(String keyField, String keyWord){
		Vector<MemberDto> list = new Vector<>();
		String sql=null;
		
		if(keyWord.equals("") || keyWord.isEmpty()){
			sql = "select * from member order by mem_num desc";
		}
		else{
			sql = "select * from member where " + keyField + 
				" like '%" + keyWord + "%' order by mem_num desc";
		}
		
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				MemberDto dto = new MemberDto();
				
				dto.setMem_num(rs.getInt("mem_num"));
				dto.setId(rs.getString("id"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setPoint(rs.getInt("point"));
				dto.setInvite_agree(rs.getString("invite_agree"));
				dto.setGender(rs.getString("gender"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setBirthdate(rs.getInt("birthdate"));
				dto.setImage(rs.getString("image"));

				list.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getPlaceList : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		
		return list;
	}
}

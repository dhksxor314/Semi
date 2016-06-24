package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import dbcp.DBConnectionMgr;
import dto.PlaceDto;
import dto.SpeechDto;

public class SpeechDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public SpeechDao(){
		try{

			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DB연결객체 생성실패 : " + err);
		}
	}
	/*
	public void insertSpeech(SpeechDto dto){ 
		try{		
			con = pool.getConnection();

			String sql = "insert into s_place(place_num, p_name, address, phone, s_capacity) values(seq_place.nextVal, ?, ?, ?, ?)";
			stmt = con.prepareStatement(sql);
			
			stmt.setString(1, dto.getP_name());
			stmt.setString(2, dto.getAddress());
			stmt.setString(3, dto.getPhone());
			stmt.setInt(4, dto.getS_capacity());
	
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("장소 추가 실패 : " + err);
		}
		finally{
			pool.freeConnection(con, stmt);
		}
	}
	
	public SpeechDto getSpeech(int place_num){
		SpeechDto dto = new SpeechDto();
		String sql = "select * from s_place where place_num=" + place_num;
		try{
			con = pool.getConnection();

			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			if(rs.next()){
				dto.setPlace_num(rs.getInt("place_num"));
				dto.setP_name(rs.getString("p_name"));
				dto.setS_capacity(rs.getInt("s_capacity"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
			}
		}
		catch(Exception err){
			System.out.println("getPlace : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return dto;
	}
	
	public void updateSpeech(SpeechDto dto){  
		String sql = "update speech set p_name=?, address=?, "
				+ "s_capacity=?, phone=? where place_num=?";
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			
			stmt.setString(1, dto.getP_name());
			stmt.setString(2, dto.getAddress());
			stmt.setInt(3, dto.getS_capacity());
			stmt.setString(4, dto.getPhone());
			stmt.setInt(5, dto.getPlace_num());
			
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("updatePlace : " + err);
		}
		finally{
			pool.freeConnection(con, stmt);
		}
	}
	*/
	public void deleteSpeech(int speech_num){	
		String sql = "delete from where speech_num=" + speech_num;
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);	
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("deleteSpeech : " + err);
		}
		finally{
			pool.freeConnection(con, stmt);
		}
	}
	
	public Vector<SpeechDto> getSpeechList(String keyField, String keyWord){
		Vector<SpeechDto> vList = new Vector<>();
		String sql = null;
		
		if(keyWord.equals("") || keyWord.isEmpty()){
			sql = "select * from speech order by speech_num desc";
		}
		else{
			sql = "select * from speech where " + keyField + 
				" like '%" + keyWord + "%' order by speech_num desc";
		}
		
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				SpeechDto dto = new SpeechDto();
				dto.setSpeech_num(rs.getInt("speech_num"));
				dto.setSpeech_name(rs.getString("speech_name"));
				dto.setStartdate(rs.getString("startdate"));
				dto.setEnddate(rs.getString("enddate"));
				dto.setNum(rs.getInt("num"));
				dto.setMax(rs.getInt("max"));
				dto.setSpeaker_name(rs.getString("speaker_name"));
				dto.setP_name(rs.getString("p_name"));
				dto.setPlace_num(rs.getInt("place_num"));
				dto.setEntryfee(rs.getInt("entryfee"));
				dto.setSpeaker_num(rs.getInt("speaker_num"));
				dto.setManage_num(rs.getInt("manage_num"));
				dto.setNow(rs.getInt("now"));
			}
		}
		catch(Exception err){
			System.out.println("getSpeechList : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return vList;
	}
	
}
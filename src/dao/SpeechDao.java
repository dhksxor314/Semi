/*
 *  작성자 : 전현영
 *  설명 : 강연에 관련된 작업을 위한 Dao
 *   
 */

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
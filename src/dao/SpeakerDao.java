/*
 *  작성자 : 전현영
 *  설명 : 강연자에 관련된 작업을 위한 Dao
 *   
 */

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import dbcp.DBConnectionMgr;
import dto.MemberDto;
import dto.NoticeDto;
import dto.PlaceDto;
import dto.SpeakerDto;

public class SpeakerDao {
   
   private Connection con;
   private PreparedStatement stmt;
   private ResultSet rs;
   private DBConnectionMgr pool;
   
   public SpeakerDao() {
      try{
         pool = DBConnectionMgr.getInstance();
      }
      catch(Exception err){
         System.out.println("DB연결객체 생성실패 : " + err);
      }
   }
   
   //강연자로 로그인
   public SpeakerDto loginSpeaker(String id, String pw){
      SpeakerDto dto = new SpeakerDto();

      String sql = "select * from Speaker where id=? and password=?";
      try{
         con = pool.getConnection();
         stmt = con.prepareStatement(sql);
         stmt.setString(1, id);
         stmt.setString(2, pw);
         rs = stmt.executeQuery();
         
         if(rs.next()){
            dto.setSpeaker_num(rs.getInt("speaker_num"));
            dto.setId(rs.getString("id"));
            dto.setName(rs.getString("name"));
         }
      }
      catch(Exception err){
         System.out.println("강연자 로그인 에러 : " + err);
      }
      finally{
         pool.freeConnection(con, stmt, rs);
      }
      return dto;
   }
   
   public void deleteSpeaker(int speaker_num){
	   String sql = "delete from Speaker where speaker_num=?";
	   
	   try{
	         con = pool.getConnection();
	         stmt = con.prepareStatement(sql);
	         stmt.setInt(1, speaker_num);
	         stmt.executeUpdate();
	      }
	      catch(Exception err){
	         System.out.println("DeleteSpeaker : " + err);
	      }
	      finally{
	         pool.freeConnection(con, stmt);
	      }
	   
   }
   
   //강연자 승인
   public void GrantSpeaker(int speaker_num){
      
      String sql = "update Speaker set approval='Y' where speaker_num=?";
      
      try{
         con = pool.getConnection();
         stmt = con.prepareStatement(sql);
         stmt.setInt(1, speaker_num);
         stmt.executeUpdate();
      }
      catch(Exception err){
         System.out.println("GrantSpeaker : " + err);
      }
      finally{
         pool.freeConnection(con, stmt);
      }
      
      
   }
   
   //선택한 강연자의 정보 리턴
   public SpeakerDto getSpeaker(int speaker_num){
      
      SpeakerDto dto = new SpeakerDto();
      
      String sql = "select * from Speaker where speaker_num=?";
      
      try{
         con = pool.getConnection();

         stmt = con.prepareStatement(sql);
         stmt.setInt(1, speaker_num);
         rs = stmt.executeQuery();
         
         if(rs.next()){
            dto.setSpeaker_num(speaker_num);
            dto.setName(rs.getString("name"));
            dto.setPassword(rs.getString("password"));
            dto.setEmail(rs.getString("email"));
            dto.setAddress(rs.getString("address"));
            dto.setField(rs.getString("field"));
            dto.setPhone(rs.getString("phone"));
            dto.setResume(rs.getString("resume"));
            dto.setImage(rs.getString("image"));
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
   
   //강연자 요청 리스트 리턴
   public Vector<SpeakerDto> getSpeakerGrantList(){
      
      Vector<SpeakerDto> vList = new Vector<>();
      String sql = "select * from Speaker where upper(approval)=upper('n') order by speaker_num desc";
      
      try{
         con = pool.getConnection();
         stmt = con.prepareStatement(sql);
         rs = stmt.executeQuery();
         
         while(rs.next()){
        	 SpeakerDto dto = new SpeakerDto();
             dto.setSpeaker_num(rs.getInt("speaker_num"));
             dto.setName(rs.getString("name"));
             dto.setEmail(rs.getString("email"));
             dto.setField(rs.getString("field"));
             
             vList.add(dto);
  
         }
      }
      catch(Exception err){
         System.out.println("getNoticeList : " + err);
      }
      finally{
         pool.freeConnection(con, stmt, rs);
      }
      return vList;
   }
 //강연자 찾기 때 사용(승인된 강연자의 전체 리스트)
   public Vector<SpeakerDto> getFindSpeakerList(){
      
      Vector<SpeakerDto> vList = new Vector<>();
      String sql = "select * from Speaker where upper(approval)=upper('Y') order by speaker_num desc";
      
      try{
         con = pool.getConnection();
         stmt = con.prepareStatement(sql);
         rs = stmt.executeQuery();
         
         
         while(rs.next()){
        	
            SpeakerDto dto = new SpeakerDto();
            dto.setSpeaker_num(rs.getInt("speaker_num"));
            dto.setEmail(rs.getString("email"));
            dto.setField(rs.getString("field"));
            dto.setName(rs.getString("name"));
            dto.setId(rs.getString("id"));
            dto.setPhone(rs.getString("phone"));
            vList.add(dto);
         }
      }
      catch(Exception err){
         System.out.println("getSpeakerGrantList : " + err);
      }
      finally{
         pool.freeConnection(con, stmt, rs);
      }
      return vList;
   }
   //승인된 강연자 출력
   public Vector<SpeakerDto> getSpeakerList(String keyField, String keyWord){
      Vector<SpeakerDto> vList = new Vector<>();
      String sql = null;
      
      if(keyWord.equals("") || keyWord.isEmpty()){
         sql = "select * from Speaker order by speaker_num desc";
      }
      else{
         sql = "select * from Speaker where " + keyField + 
            " like '%" + keyWord + "%' order by speaker_num desc";
      }
      
      try{
         con = pool.getConnection();
         stmt = con.prepareStatement(sql);
         rs = stmt.executeQuery();
         
         while(rs.next()){
            SpeakerDto dto = new SpeakerDto();
            dto.setSpeaker_num(rs.getInt("speaker_num"));
            dto.setName(rs.getString("name"));
            dto.setId(rs.getString("id"));
            dto.setPassword(rs.getString("password"));
            dto.setEmail(rs.getString("email"));
            dto.setField(rs.getString("field"));
            dto.setPhone(rs.getString("phone"));

            vList.add(dto);
         }
      }
      catch(Exception err){
         System.out.println("getSpeakerList : " + err);
      }
      finally{
         pool.freeConnection(con, stmt, rs);
      }
      return vList;
   }
   

   

}
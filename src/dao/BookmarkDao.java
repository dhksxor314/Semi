/*
 페이지 - 사이드메뉴_즐겨찾기내역
작성자 - 이주연
수정날짜 - 2016/06/20
설명 - 즐겨찾기 조회(사이드메뉴 출력) 및 삭제 / 메시지 등록 및 조회,삭제 
검색을 해서 클릭하면 즐겨찾기에 추가하도록 한다.
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import dbcp.DBConnectionMgr;
import dto.Bookmark_Dto;
import dto.Message_Dto;

public class BookmarkDao {

	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	DBConnectionMgr pool = null;

	public BookmarkDao() {
		try {

			if (pool == null) {
				pool = DBConnectionMgr.getInstance();
			}

		} catch (Exception err) {
			System.out.println("DB연결 객체 생성 실패 : " + err);
		}
	}
	
	
	
//강연자 & 강연명 조회(즐겨찾기 개수 조회)
	public Vector<Bookmark_Dto> BookmarkList(int mem_num) {
		Vector<Bookmark_Dto> book = new Vector<Bookmark_Dto>();

		String sql = null;

		sql = "select sp.name, sp.field, s.title, b.Bookmark_num, b.mem_num, s.reporting_date "
				+ " from Speaker sp join Bookmark b on (sp.speaker_num = b.speaker_num) "
				+ " join Speech_Meeting s on (sp.speaker_num = s.speaker_num) "
				+ " join member m on (m.mem_num = b.mem_num) "
				+ " where s.REPORTING_DATE > =sysdate and m.mem_num="+mem_num;

		try {
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {

				Bookmark_Dto dto = new Bookmark_Dto();

				dto.setMem_num(rs.getInt("mem_num"));
				dto.setName(rs.getString("name"));
				dto.setField(rs.getString("field"));
				dto.setTitle(rs.getString("title"));
				dto.setBookmark_num(rs.getInt("Bookmark_num"));
				dto.setReporting_date(rs.getDate("reporting_date"));
				
				book.add(dto);
		
			}
		} catch (Exception err) {
			System.out.println("즐겨찾기 출력 : " + err);
		} finally {
			pool.freeConnection(con, stmt, rs);
		}
		return book;
	}

	//즐겨찾기 테이블에 포함여부 
	public boolean Overlap(int book_num){
		
			String sql1 = "select bookmark_num from Bookmark where Bookmark_num!="+book_num;
			String sql2 = "insert into Bookmark values(?,?,seq_book_num.NEXTVAL)";
			
			try {

			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			
			Bookmark_Dto dto = new Bookmark_Dto();
			
			stmt = con.prepareStatement(sql1);	
			rs = stmt.executeQuery();

			 while (rs.next()) {
		            book_num = rs.getInt(1);
		         }

			 stmt=con.prepareStatement(sql2);
			 
			 stmt.setInt(1, dto.getMem_num());
			 stmt.setInt(2, dto.getSpeaker_num());
			
			 stmt.executeUpdate();

			 
			} catch (Exception err) {
				System.out.println("즐겨찾기 중복확인 : " + err);
			} finally {
				pool.freeConnection(con, stmt, rs);
			}
			return true;
		}	

	//메시지 등록 
	public Vector<Message_Dto> MessageWrite(Vector<Message_Dto> dto){	
					
		String sql = null;	
		
			sql = "insert into message values (?,?,?,seq_msg_num.nextVal,?,?)";
			
		try{
			
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			
		for (int i = 0; i < dto.size(); i++) {
			
			stmt.setInt(1, dto.get(i).getMem_num());
			stmt.setString(2, dto.get(i).getTitle());
			stmt.setDate(3, (Date) dto.get(i).getReporting_date());
			stmt.setString(4, dto.get(i).getConfirmation());
			stmt.setInt(5, dto.get(i).getBookmark_num());
						
			}		
			stmt.executeQuery();
		
		}catch(Exception err){
			System.out.println("메시지 등록 : "+err);
		}
		finally{
			pool.freeConnection(con, stmt);
		}
		return dto;
	}	
	
	
//즐겨찾기한 강연자에 대한 알림(쪽지)
	public Vector<Message_Dto> MessageList() {
		Vector<Message_Dto> msg = new Vector<Message_Dto>();

		String sql = null;

		sql = "select m.msg_num, sp.name, m.title, m.Confirmation, s.reporting_date, b.Bookmark_num"
				+ " from Message m "
				+ " join Bookmark b on (m.bookmark_num = b.Bookmark_num)"
				+ " join speech_Meeting s on (m.reportingdate = s.reporting_date)"
				+ " join speaker sp on (b.speaker_num = sp.SPEAKER_NUM) ";

		
		try {
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {

				Message_Dto dto = new Message_Dto();

				dto.setMsg_num(rs.getInt("msg_num"));	
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setReporting_date(rs.getDate("reporting_date"));
				dto.setConfirmation(rs.getString("Confirmation"));
				dto.setBookmark_num(rs.getInt("bookmark_num"));

				msg.add(dto);
			}
		} catch (Exception err) {
			System.out.println("알림 메시지 : " + err);
		} finally {
			pool.freeConnection(con, stmt, rs);
		}
		return msg;
	}	
			
	
//즐겨찾기한 강연자의 강연이 만남테이블에 등록시 알림	
	public Vector<Message_Dto> BookMsgList() {
		Vector<Message_Dto> msg = new Vector<Message_Dto>();

		String sql = null;

		sql = "select m.msg_num, s.name, m.title, m.Confirmation, s.speaker_num, m.reporting_date, b.bookmark_num" + 
				" from Bookmark b"
				+ " join speaker s on (s.speaker_num = b.speaker_num)"
				+ " join Speech_Meeting sm on (sm.speaker_num = b.SPEAKER_NUM) "
				+ " where m.reporting_date < sysdate";

		try {
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {

				Message_Dto dto = new Message_Dto();

				dto.setMsg_num(rs.getInt("msg_num"));	
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setSpeaker_num(rs.getInt("speaker_num"));
				dto.setReporting_date(rs.getDate("reporting_date"));
				dto.setConfirmation(rs.getString("confirmation"));
				dto.setBookmark_num(rs.getInt("bookmark_num"));

				msg.add(dto);
			}
		} catch (Exception err) {
			System.out.println("즐겨찾기 출력 : " + err);
		} finally {
			pool.freeConnection(con, stmt, rs);
		}
		return msg;
	}
	
	
	//메시지 확인시 확인여부 수정
	public Vector<Message_Dto> MessageUpdate(Vector<Message_Dto> dto){	
					
		String sql = null;	

			sql = "update message set Confirmation=?";
			
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			
			//stmt.setString(1, dto.getConfirmation());
			
			stmt.executeQuery();
			
		}
		catch(Exception err){
			System.out.println("메시지 수정 출력 : "+err);
		}
		finally{
			pool.freeConnection(con, stmt);
		}
		return dto;
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

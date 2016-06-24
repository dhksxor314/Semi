package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Vector;

import create.createDto;
import dbcp.DBConnectionMgr;
import dto.MeetingDto;
import dto.PlaceDto;

public class MeetingDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public MeetingDao(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println(" : " + err);
		}
	}

	public MeetingDto getMeeting(String s_m, int num){
		MeetingDto dto = new MeetingDto();
		String sql = "select m.name, p.place_name, sm.reporting_date, sm.job, sm.title, sm.description from speech_meeting sm, member m, place p where p.place_num=sm.place_num and sm.mem_num=m.mem_num and s_m=? and num=?";
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(2, num);
			stmt.setString(1, s_m);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				dto.setName(rs.getString(1));
				dto.setPlace_name(rs.getString(2));
				dto.setReporting_date(rs.getDate(3));
				dto.setJob(rs.getString(4));
				dto.setTitle(rs.getString(5));
				dto.setDescription(rs.getString(6));
			}
		}
		catch(Exception err){
			System.out.println("getMeeting : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return dto;
	}
	
	public void grantMeeting(int num, String s_m){  
		String sql = "update speech_meeting set approval='y' where num=? and s_m=?";
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, num);
			stmt.setString(2, s_m);
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("grantMeeting : " + err);
		}
		finally{
			pool.freeConnection(con, stmt);
		}
	}
	
	public void deleteMeeting(int num, String s_m){	
		String sql = "delete from speech_meeting where num=? and s_m=?";
		System.out.println(s_m);
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, num);
			stmt.setString(2, s_m);
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("deleteMeeting : " + err);
		}
		finally{
			pool.freeConnection(con, stmt);
		}
	}
	
	public void rejectMeeting(int num, String s_m){	
		String sql = "delete from speech_meeting where num=? and s_m=?";
		System.out.println(s_m);
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, num);
			stmt.setString(2, s_m);
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("deleteMeeting : " + err);
		}
		finally{
			pool.freeConnection(con, stmt);
		}
	}
	
	

	public Vector<MeetingDto> getSpeechList(String keyField, String keyWord, String start, String end, String progression){
		Vector<MeetingDto> vList = new Vector<MeetingDto>();
		String sql = null;
		if(progression.equals("all")){
			if(keyWord.equals("") && start.equals("") && end.equals("")){
				sql = "select sm.num, s.name, p.place_name, sm.reporting_date, sm.max_person, sm.now_person, sm.progression, sm.starttime, sm.title from Speech_Meeting sm, Place p, Speaker s where sm.place_num=p.place_num and sm.speaker_num=s.speaker_num and sm.s_m='s' order by num desc";
			}
			else if(keyWord.equals("") && !start.equals("") && !end.equals("")){
				sql = "select sm.num, s.name, p.place_name, sm.reporting_date, sm.max_person, sm.now_person, sm.progression, sm.starttime, sm.title from Speech_Meeting sm, Place p, Speaker s where sm.place_num=p.place_num and sm.speaker_num=s.speaker_num and sm.s_m='s' "
						+ "and sm.reporting_date>=? and sm.reporting_date<=? order by num desc";
			}
			else if(start.equals("") && end.equals("")){
				sql = "select sm.num, s.name, p.place_name, sm.reporting_date, sm.max_person, sm.now_person, sm.progression, sm.starttime, sm.title from Speech_Meeting sm, Place p, Speaker s where sm.place_num=p.place_num and sm.speaker_num=s.speaker_num and sm.s_m='s' and lower(" + keyField + 
					") like lower('%" + keyWord + "%') order by num desc";
			}
			else{
				sql = "select sm.num, s.name, p.place_name, sm.reporting_date, sm.max_person, sm.now_person, sm.progression, sm.starttime, sm.title from Speech_Meeting sm, Place p, Speaker s where sm.place_num=p.place_num and sm.speaker_num=s.speaker_num and sm.s_m='s' and lower(" + keyField + 
						") like lower('%" + keyWord + "%') and sm.reporting_date>=? and sm.reporting_date<=? order by num desc";
			}
		}
		else{
			if(keyWord.equals("") && start.equals("") && end.equals("")){
				sql = "select sm.num, s.name, p.place_name, sm.reporting_date, sm.max_person, sm.now_person, sm.progression, sm.starttime, sm.title from Speech_Meeting sm, Place p, Speaker s where sm.place_num=p.place_num and sm.speaker_num=s.speaker_num and sm.s_m='s' and progression='"+progression+"' order by num desc";
			}
			else if(keyWord.equals("") && !start.equals("") && !end.equals("")){
				sql = "select sm.num, s.name, p.place_name, sm.reporting_date, sm.max_person, sm.now_person, sm.progression, sm.starttime, sm.title from Speech_Meeting sm, Place p, Speaker s where sm.place_num=p.place_num and sm.speaker_num=s.speaker_num and sm.s_m='s' "
						+ "and sm.reporting_date>=? and sm.reporting_date<=? and progression='"+progression+"' order by num desc";
			}
			else if(start.equals("") && end.equals("")){
				sql = "select sm.num, s.name, p.place_name, sm.reporting_date, sm.max_person, sm.now_person, sm.progression, sm.starttime, sm.title from Speech_Meeting sm, Place p, Speaker s where sm.place_num=p.place_num and sm.speaker_num=s.speaker_num and sm.s_m='s' and lower(" + keyField + 
					") like lower('%" + keyWord + "%') and progression='"+progression+"' order by num desc";
			}
			else{
				sql = "select sm.num, s.name, p.place_name, sm.reporting_date, sm.max_person, sm.now_person, sm.progression, sm.starttime, sm.title from Speech_Meeting sm, Place p, Speaker s where sm.place_num=p.place_num and sm.speaker_num=s.speaker_num and sm.s_m='s' and lower(" + keyField + 
						") like lower('%" + keyWord + "%') and progression='"+progression+"' and sm.reporting_date>=? and sm.reporting_date<=? order by num desc";
			}
		}
		
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			if(!start.equals("")){
				stmt.setString(1, start);
				stmt.setString(2, end);
			}
			rs = stmt.executeQuery();
	
			while(rs.next()){
				MeetingDto dto = new MeetingDto();

				dto.setNum(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setPlace_name(rs.getString(3));
				dto.setReporting_date(rs.getDate(4));
				dto.setMax_person(rs.getInt(5));
				dto.setNow_person(rs.getInt(6));
				dto.setProgression(rs.getString(7));
				dto.setStarttime(rs.getString(8));
				dto.setTitle(rs.getString(9));
				
				vList.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getMeetingList : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return vList;
	}
	
	public Vector<MeetingDto> getMeetingList(String keyField, String keyWord, String start, String end, String progression){
		Vector<MeetingDto> vList = new Vector<MeetingDto>();
		String sql = null;
		System.out.println("3");
		if(progression.equals("all")){
			System.out.println("1");
			if(keyWord.equals("") && start.equals("") && end.equals("")){
				System.out.println("2");
				sql = "select sm.num, m.name, p.place_name, sm.reporting_date, sm.max_person, sm.now_person, sm.progression, sm.starttime, sm.title from Speech_Meeting sm, Place p, Member m where sm.place_num=p.place_num and sm.mem_num=m.mem_num and sm.s_m='m' and approval='n' order by num desc";
			}
			else if(keyWord.equals("") && !start.equals("") && !end.equals("")){
				sql = "select sm.num, m.name, p.place_name, sm.reporting_date, sm.max_person, sm.now_person, sm.progression, sm.starttime, sm.title from Speech_Meeting sm, Place p, Member m where sm.place_num=p.place_num and sm.mem_num=m.mem_num and sm.s_m='m' "
						+ "and sm.reporting_date>=? and sm.reporting_date<=? and approval='n' order by num desc";
			}
			else if(start.equals("") && end.equals("")){
				sql = "select sm.num, m.name, p.place_name, sm.reporting_date, sm.max_person, sm.now_person, sm.progression, sm.starttime, sm.title from Speech_Meeting sm, Place p, Member m where sm.place_num=p.place_num and sm.mem_num=m.mem_num and sm.s_m='m' and lower(" + keyField + 
					") like lower('%" + keyWord + "%') and approval='n' order by num desc";
			}
			else{
				sql = "select sm.num, m.name, p.place_name, sm.reporting_date, sm.max_person, sm.now_person, sm.progression, sm.starttime, sm.title from Speech_Meeting sm, Place p, Member m where sm.place_num=p.place_num and sm.mem_num=m.mem_num and sm.s_m='m' and lower(" + keyField + 
						") like lower('%" + keyWord + "%') and sm.reporting_date>=? and sm.reporting_date<=? and approval='n' order by num desc";
			}
		}
		else{
			if(keyWord.equals("") && start.equals("") && end.equals("")){
				sql = "select sm.num, m.name, p.place_name, sm.reporting_date, sm.max_person, sm.now_person, sm.progression, sm.starttime, sm.title from Speech_Meeting sm, Place p, Member m where sm.place_num=p.place_num and sm.mem_num=m.mem_num and sm.s_m='m' and progression='"+progression+"' and approval='n' order by num desc";
			}
			else if(keyWord.equals("") && !start.equals("") && !end.equals("")){
				sql = "select sm.num, m.name, p.place_name, sm.reporting_date, sm.max_person, sm.now_person, sm.progression, sm.starttime, sm.title from Speech_Meeting sm, Place p, Member m where sm.place_num=p.place_num and sm.mem_num=m.mem_num and sm.s_m='m' "
						+ "and sm.reporting_date>=? and sm.reporting_date<=? and progression='"+progression+"' and approval='n' order by num desc";
			}
			else if(start.equals("") && end.equals("")){
				sql = "select sm.num, m.name, p.place_name, sm.reporting_date, sm.max_person, sm.now_person, sm.progression, sm.starttime, sm.title from Speech_Meeting sm, Place p, Member m where sm.place_num=p.place_num and sm.mem_num=m.mem_num and sm.s_m='m' and lower(" + keyField + 
					") like lower('%" + keyWord + "%') and progression='"+progression+"' and approval='n' order by num desc";
			}
			else{
				sql = "select sm.num, m.name, p.place_name, sm.reporting_date, sm.max_person, sm.now_person, sm.progression, sm.starttime, sm.title from Speech_Meeting sm, Place p, Member m where sm.place_num=p.place_num and sm.mem_num=m.mem_num and sm.s_m='m' and lower(" + keyField + 
						") like lower('%" + keyWord + "%') and progression='"+progression+"' and sm.reporting_date>=? and sm.reporting_date<=? and approval='n' order by num desc";
			}
		}
		
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			if(!start.equals("")){
				stmt.setString(1, start);
				stmt.setString(2, end);
			}
			rs = stmt.executeQuery();
	
			while(rs.next()){
				MeetingDto dto = new MeetingDto();

				dto.setNum(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setPlace_name(rs.getString(3));
				dto.setReporting_date(rs.getDate(4));
				dto.setMax_person(rs.getInt(5));
				dto.setNow_person(rs.getInt(6));
				dto.setProgression(rs.getString(7));
				dto.setStarttime(rs.getString(8));
				dto.setTitle(rs.getString(9));
				
				vList.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getMeetingList : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return vList;
	}
	
	public Vector<MeetingDto> getMeetingList(String keyField, String keyWord, String start, String end){
		Vector<MeetingDto> vList = new Vector<MeetingDto>();
		String sql = null;
		
		if(keyWord.equals("") && start.equals("") && end.equals("")){
			
			sql = "select sm.num, m.name, p.place_name, sm.reporting_date, sm.max_person, sm.now_person, sm.progression, sm.starttime, sm.title from Speech_Meeting sm, Place p, Member m where sm.place_num=p.place_num and sm.mem_num=m.mem_num and sm.s_m='m' and approval='n' order by num desc";
		}
		else if(keyWord.equals("") && !start.equals("") && !end.equals("")){
			sql = "select sm.num, m.name, p.place_name, sm.reporting_date, sm.max_person, sm.now_person, sm.progression, sm.starttime, sm.title from Speech_Meeting sm, Place p, Member m where sm.place_num=p.place_num and sm.mem_num=m.mem_num and sm.s_m='m' "
					+ "and sm.reporting_date>=? and sm.reporting_date<=? and approval='n' order by num desc";
		}
		else if(start.equals("") && end.equals("")){
			sql = "select sm.num, m.name, p.place_name, sm.reporting_date, sm.max_person, sm.now_person, sm.progression, sm.starttime, sm.title from Speech_Meeting sm, Place p, Member m where sm.place_num=p.place_num and sm.mem_num=m.mem_num and sm.s_m='m' and lower(" + keyField + 
				") like lower('%" + keyWord + "%') and approval='n' order by num desc";
		}
		else{
			sql = "select sm.num, m.name, p.place_name, sm.reporting_date, sm.max_person, sm.now_person, sm.progression, sm.starttime, sm.title from Speech_Meeting sm, Place p, Member m where sm.place_num=p.place_num and sm.mem_num=m.mem_num and sm.s_m='m' and lower(" + keyField + 
					") like lower('%" + keyWord + "%') and sm.reporting_date>=? and sm.reporting_date<=? and approval='n' order by num desc";
		}
		
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			if(!start.equals("")){
				stmt.setString(1, start);
				stmt.setString(2, end);
			}
			rs = stmt.executeQuery();
	
			while(rs.next()){
				MeetingDto dto = new MeetingDto();

				dto.setNum(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setPlace_name(rs.getString(3));
				dto.setReporting_date(rs.getDate(4));
				dto.setMax_person(rs.getInt(5));
				dto.setNow_person(rs.getInt(6));
				dto.setProgression(rs.getString(7));
				dto.setStarttime(rs.getString(8));
				dto.setTitle(rs.getString(9));
				
				vList.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getMeetingList : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return vList;
	}
	
}












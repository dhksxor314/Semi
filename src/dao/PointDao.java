package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import dbcp.DBConnectionMgr;
import dto.MemActivityDto;
import dto.Point_Dto;
import dto.Speech_Meeting_Dto;

public class PointDao {
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		DBConnectionMgr pool = null;
	
	public PointDao(){
		try{
			
		if(pool==null){
			pool = DBConnectionMgr.getInstance();
		}
					
		}catch(Exception err){
			System.out.println(" : "+err);
		}
	}
	
	public Vector<Point_Dto> PointList(){
		Vector<Point_Dto> post = new Vector<Point_Dto>();	
					
		String sql = null;				
				
			sql ="select p.s_m, p.num, p.title, p.point, p.reporting_date "
				+ " from Postscript p"
				+ " join Speech_Meeting s"
				+ " on (s.s_m = p.s_m)"
				+ " where s.num=p.num";			
			

			
			
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				
				Point_Dto dto = new Point_Dto();
				
				dto.setS_m(rs.getString("s_m"));
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setPoint(rs.getInt("point"));
				dto.setReporting_date(rs.getDate("reporting_date"));
				
				post.add(dto);			
			}
		}
		catch(Exception err){
			System.out.println(": "+err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return  post;
	}
	
	public Vector<MemActivityDto> getActivityList(String keyField, String start, String end, int mem_num){
		Vector<MemActivityDto> post = new Vector<MemActivityDto>();	
					
		String sql = null;				
				
			sql ="select p2.part_num, p2.post_num, p1.reporting_date, p2.point, s.title, p1.usedpoint, m.point from participation p1, pointinfo p2, speech_meeting s, member m where p1.part_num=p2.part_num and s.num=p1.num and m.mem_num=p1.mem_num and p1.mem_num="+mem_num;			
			
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				
				MemActivityDto dto = new MemActivityDto();
				
				dto.setPart_num(rs.getInt(1));
				dto.setPost_num(rs.getInt(2));
				dto.setReporting_date(rs.getDate(3));
				dto.setPoint(rs.getInt(4));
				dto.setTitle(rs.getString(5));
				dto.setUsedpoint(rs.getInt(6));
				dto.setPoint2(rs.getInt(7));
				
				post.add(dto);			
			}
		}
		catch(Exception err){
			System.out.println(" : "+err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return  post;
	}
	public MemActivityDto getActivityList2(int mem_num){
		MemActivityDto dto = new MemActivityDto();
					
		String sql = null;				
				
			sql ="select p2.part_num, p2.post_num, p1.reporting_date, p2.point, s.title, p1.usedpoint, m.point from participation p1, pointinfo p2, speech_meeting s, member m where p1.part_num=p2.part_num and s.num=p1.num and m.mem_num=p1.mem_num and p1.mem_num="+mem_num;			
			
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				
				
				
				dto.setPart_num(rs.getInt(1));
				dto.setPost_num(rs.getInt(2));
				dto.setReporting_date(rs.getDate(3));
				dto.setPoint(rs.getInt(4));
				dto.setTitle(rs.getString(5));
				dto.setUsedpoint(rs.getInt(6));
				dto.setPoint2(rs.getInt(7));
							
			}
		}
		catch(Exception err){
			System.out.println(" : "+err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return  dto;
	}
	
}

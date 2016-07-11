package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import dbcp.DBConnectionMgr;
import dto.MeetingDto;
import dto.MemActivityDto;

public class MemActivityDao {
	
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public MemActivityDao(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DB연결객체 생성실패 : " + err);
		}
	}
	public Vector<MemActivityDto> getActivityList(String keyField, String start, String end, int mem_num){
		Vector<MemActivityDto> vList = new Vector<MemActivityDto>();
		String sql = null;
		
		if(keyField!="all"){
			if(start.equals("") || end.equals("")){
				sql = "select reporting_date, title, s_m from Speech_Meeting where mem_num="+mem_num+" and s_m='"+keyField+"' order by num desc";
			}
			else if(!start.equals("") && !end.equals("")){
				sql = "select reporting_date, title, s_m from Speech_Meeting where mem_num="+mem_num+" and s_m='"+keyField+"' and "
						+ "reporting_date>? and reporting_date<? order by num desc";
			}
		}
		else{
			if(start.equals("") || end.equals("")){
				sql = "select reporting_date, title, s_m from Speech_Meeting where mem_num="+mem_num+" order by num desc";
			}
			else if(!start.equals("") && !end.equals("")){
				sql = "select reporting_date, title, s_m from Speech_Meeting where mem_num="+mem_num+" and "
						+ "reporting_date>? and reporting_date<? order by num desc";
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
				MemActivityDto dto = new MemActivityDto();
				
				dto.setReporting_date(rs.getDate(1));
				dto.setTitle(rs.getString(2));
				dto.setS_m(rs.getString(3));
				
				vList.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getActivityList : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return vList;
	}
}

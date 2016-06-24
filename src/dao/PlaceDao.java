package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import dbcp.DBConnectionMgr;
import dto.PlaceDto;

public class PlaceDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public PlaceDao(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DB연결객체 생성실패 : " + err);
		}
	}
	
	public void insertPlace(PlaceDto dto){ 
		try{		
			con = pool.getConnection();

			String sql = "insert into place(place_num, place_name, address, phone, capacity) values(seq_place.nextVal, ?, ?, ?, ?)";
			stmt = con.prepareStatement(sql);
			
			stmt.setString(1, dto.getPlace_name());
			stmt.setString(2, dto.getAddress());
			stmt.setString(3, dto.getPhone());
			stmt.setInt(4, dto.getCapacity());
	
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("장소 추가 실패 : " + err);
		}
		finally{
			pool.freeConnection(con, stmt);
		}
	}
	
	public PlaceDto getPlace(int place_num){
		PlaceDto dto = new PlaceDto();
		String sql = "select * from place where place_num=?";
		try{
			con = pool.getConnection();

			stmt = con.prepareStatement(sql);
			stmt.setInt(1, place_num);
			rs = stmt.executeQuery();
			
			if(rs.next()){
				dto.setPlace_num(rs.getInt("place_num"));
				dto.setPlace_name(rs.getString("place_name"));
				dto.setCapacity(rs.getInt("capacity"));
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
	
	public void updatePlace(PlaceDto dto){  
		String sql = "update place set p_name=?, address=?, "
				+ "capacity=?, phone=? where place_num=?";
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			
			stmt.setString(1, dto.getPlace_name());
			stmt.setString(2, dto.getAddress());
			stmt.setInt(3, dto.getCapacity());
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
	
	public void deletePlace(int place_num){	
		String sql = "delete from place where place_num=" + place_num;
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);	
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("deletePlace : " + err);
		}
		finally{
			pool.freeConnection(con, stmt);
		}
	}
	
	public Vector<PlaceDto> getPlaceList(String keyField, String keyWord){
		Vector<PlaceDto> vList = new Vector<PlaceDto>();
		String sql = null;
		
		if(keyWord.equals("") || keyWord.isEmpty()){
			sql = "select * from place order by place_num desc";
		}
		else{
			sql = "select * from place where " + keyField + 
				" like '%" + keyWord + "%' order by place_num desc";
		}
		
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				PlaceDto dto = new PlaceDto();
				dto.setPlace_num(rs.getInt("place_num"));
				dto.setAddress(rs.getString("address"));
				dto.setPlace_name(rs.getString("place_name"));
				dto.setPhone(rs.getString("phone"));
				dto.setCapacity(rs.getInt("capacity"));

				vList.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getPlaceList : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return vList;
	}
	
}












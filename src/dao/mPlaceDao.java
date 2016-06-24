package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import dbcp.DBConnectionMgr;
import dto.PlaceDto;
import dto.mPlaceDto;

public class mPlaceDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public mPlaceDao(){
		try{

			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DB연결객체 생성실패 : " + err);
		}
	}
	
	public void insertPlace(mPlaceDto dto){ 
		try{		
			con = pool.getConnection();

			String sql = "insert into m_place(place_num, p_name, address, phone, capacity, price) values(seq_m_place.nextVal, ?, ?, ?, ?, ?)";
			stmt = con.prepareStatement(sql);
			
			stmt.setString(1, dto.getP_name());
			stmt.setString(2, dto.getAddress());
			stmt.setString(3, dto.getPhone());
			stmt.setInt(4, dto.getCapacity());
			stmt.setInt(5, dto.getPrice());
	
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("장소 추가 실패 : " + err);
		}
		finally{
			pool.freeConnection(con, stmt);
		}
	}
	
	public mPlaceDto getPlace(int place_num){
		mPlaceDto dto = new mPlaceDto();
		String sql = "select * from m_place where place_num=" + place_num;
		try{
			con = pool.getConnection();

			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			if(rs.next()){
				dto.setPlace_num(rs.getInt("place_num"));
				dto.setP_name(rs.getString("p_name"));
				dto.setCapacity(rs.getInt("capacity"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setPrice(rs.getInt("price"));
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
	
	public void updatePlace(mPlaceDto dto){  
		String sql = "update m_place set p_name=?, address=?, "
				+ "capacity=?, phone=?, price=? where place_num=?";
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			
			stmt.setString(1, dto.getP_name());
			stmt.setString(2, dto.getAddress());
			stmt.setInt(3, dto.getCapacity());
			stmt.setString(4, dto.getPhone());			
			stmt.setInt(5, dto.getPrice());
			stmt.setInt(6, dto.getPlace_num());
			
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("updatePlace : " + err);
		}
		finally{
			pool.freeConnection(con, stmt);
		}
	}
	
	public void deleteBoard(int place_num){	
		String sql = "delete from m_place where place_num=" + place_num;
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
	
	public Vector<mPlaceDto> getPlaceList(String keyField, String keyWord){
		Vector<mPlaceDto> vList = new Vector<mPlaceDto>();
		String sql = null;
		
		if(keyWord.equals("") || keyWord.isEmpty()){
			sql = "select * from m_place order by place_num desc";
		}
		else{
			sql = "select * from m_place where " + keyField + 
				" like '%" + keyWord + "%' order by place_num desc";
		}
		
		try{
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				mPlaceDto dto = new mPlaceDto();
				dto.setPlace_num(rs.getInt("place_num"));
				dto.setAddress(rs.getString("address"));
				dto.setP_name(rs.getString("p_name"));
				dto.setPhone(rs.getString("phone"));
				dto.setCapacity(rs.getInt("capacity"));
				dto.setPrice(rs.getInt("price"));
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












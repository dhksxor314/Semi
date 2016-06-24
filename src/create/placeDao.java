package create;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import dbcp.DBConnectionMgr;
import create.placeDto;

public class placeDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	
	public Vector getplace2(){
		Vector<placeDto> vector = new Vector<placeDto>();
		placeDto dto = null;
		
		String sql = "select place_num, place_name from place";
		try{
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				dto = new placeDto();
				dto.setPlace_num(rs.getInt(1));
				dto.setPlace_name(rs.getString(2));
				
				vector.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("장소: " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		return vector;
	}
}

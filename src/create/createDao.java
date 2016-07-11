package create;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import join.listDto;

public class createDao {
	private Connection con;
	private PreparedStatement stmt;
	private PreparedStatement stmt1;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public void insertmetting(createDto dto) {
		String sql = "insert into Speech_Meeting(s_m, max_person, starttime, endtime, now_person, progression, min_person, image, region, description, approval, place_num"
				+ ",price, title, reporting_date, job, intro, message, Bank, accountholder, bankaccount, mem_num) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);

			stmt.setString(1, "m");
			stmt.setInt(2, dto.getMax_person());
			stmt.setString(3, dto.getStarttime());
			stmt.setString(4, dto.getEndtime());
			stmt.setInt(5, dto.getNow_person());
			stmt.setString(6, dto.getProgression());
			stmt.setInt(7, dto.getMin_person());
			stmt.setString(8, dto.getImage());
			stmt.setString(9, dto.getRegion());
			stmt.setString(10, dto.getDescription());
			stmt.setString(11, dto.getApproval());
			stmt.setInt(12, dto.getPlace_num());
			stmt.setInt(13, dto.getPrice());
			stmt.setString(14, dto.getTitle());
			stmt.setString(15, dto.getReporting_date());
			stmt.setString(16, dto.getJob());
			stmt.setString(17, dto.getIntro());
			stmt.setString(18, dto.getMessage());
			stmt.setString(19, dto.getBank());
			stmt.setString(20, dto.getAccountholder());
			stmt.setInt(21, dto.getBankaccount());
			stmt.setInt(22, dto.getMem_num());

			stmt.executeUpdate();

		} catch (Exception err) {
			System.out.println("createDao_insertmetting : " + err);

		} finally {
			pool.freeConnection(con, stmt, rs);

		}
	}

	public Vector endmetting(int mem_num) {
		Vector<createDto> vector = new Vector<createDto>();
		createDto list = null;
		String sql = "select s.num, s.title, p.place_name, s.now_person, s.approval, s.reporting_date, s.mem_num, s.max_person, m.name "
				+ "from Speech_Meeting s, Place p, Member m where s.place_num=p.place_num and s.mem_num=m.mem_num and s.progression='n' and s.mem_num="+mem_num;
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				list = new createDto();
				list.setNum(rs.getInt(1));
				list.setTitle(rs.getString(2));
				list.setPlace_name(rs.getString(3));
				list.setNow_person(rs.getInt(4));
				list.setApproval(rs.getString(5));
				list.setReporting_date(rs.getString(6).substring(0, 10));
				list.setMem_num(rs.getInt(7));
				list.setMax_person(rs.getInt(8));
				list.setName(rs.getString(9));
				vector.add(list);
			}

		} catch (Exception err) {
			System.out.println("createDao_endmetting : " + err);

		} finally {
			pool.freeConnection(con, stmt, rs);

		}
		return vector;
	}

	public placeDto getplace2(int num) {
		placeDto place = null;
		String sql = "select *  from Place where place_num=" + num;
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				place = new placeDto();
				place.setPlace_num(rs.getInt(1));
				place.setPlace_name(rs.getString(2));
				place.setAddress(rs.getString(3));
				place.setPhone(rs.getString(4));
				place.setCpacity(rs.getInt(5));
				place.setPrice(rs.getInt(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt, rs);
		}
		return place;
	}

	public Vector getList(int mem_num) {
		Vector<createDto> vector = new Vector<createDto>();
		createDto list = null;

		String sql = "select s.num, s.title, p.place_name, s.now_person, s.approval, s.reporting_date, s.mem_num, s.max_person, m.name "
				+ "from Speech_Meeting s, Place p, Member m "
				+ "where s.place_num=p.place_num and s.mem_num=m.mem_num and s.progression='y' and m.mem_num="+mem_num;
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				list = new createDto();
				list.setNum(rs.getInt(1));
				list.setTitle(rs.getString(2));
				list.setPlace_name(rs.getString(3));
				list.setNow_person(rs.getInt(4));
				list.setApproval(rs.getString(5));
				list.setReporting_date(rs.getString(6).substring(0, 10));
				list.setMem_num(rs.getInt(7));
				list.setMax_person(rs.getInt(8));
				list.setName(rs.getString(9));
				vector.add(list);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt, rs);
		}

		return vector;
	}
	public createDto getphone(int mem_num) {
		createDto list = null;
		String sql = "select phone, email from Member where mem_num="+mem_num;
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				list = new createDto();
				list.setPhone(rs.getString(1));
				list.setEmail(rs.getString(2));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt, rs);
		}

		return list;
	}
}

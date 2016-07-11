package join;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import create.DBConnectionMgr;
import create.createDto;

public class listDao {
	private Connection con;
	private PreparedStatement stmt;
	private PreparedStatement stmt1;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	public Vector getList(String region) {
		Vector<listDto> vector = new Vector<listDto>();
		listDto list = null;
		String sql=null;
		if(region.equals("0")){
			sql = "select s.title, s.reporting_date, s.region, s.now_person, s.max_person, s.image, s.num, m.name from Speech_Meeting s, Member m where s.mem_num=m.mem_num and s.approval='y'";
		}else{
			sql = "select s.title, s.reporting_date, s.region, s.now_person, s.max_person, s.image, s.num, m.name from Speech_Meeting s, Member m where s.mem_num=m.mem_num and s.approval='y' and s.region='"+region+"'";
		}
		
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				list = new listDto();
				list.setTitle(rs.getString(1));
				list.setReporting_date(rs.getString(2));;
				list.setRegion(rs.getString(3));
				list.setNow_person(rs.getInt(4));
				list.setMax_person(rs.getInt(5));
				list.setImage(rs.getString(6));
				list.setNum(rs.getInt(7));
				list.setName(rs.getString(8));

				vector.add(list);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt, rs);
		}

		return vector;
	}
	public listDto getinfo(int num){
		
		listDto list = new listDto();
		String sql = "select s.s_m, s.num, s.place_num, s.title, s.image, s.starttime, s.endtime, s.price, s.min_person, s.now_person"
				+", s.max_person, s.region, s.reporting_date, s.description, s.progression, s.approval, s.job, p.place_name, p.address, m.phone, m.point,"
				+" s.intro from Speech_Meeting s, Place p, Member m where s.place_num=p.place_num and s.mem_num=m.mem_num and num="+num;
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				list = new listDto();
				list.setS_m(rs.getString(1));
				list.setNum(rs.getInt(2));
				list.setPlace_num(rs.getInt(3));
				list.setTitle(rs.getString(4));
				list.setImage(rs.getString(5));
				list.setStarttime(rs.getString(6));
				list.setEndtime(rs.getString(7));
				list.setPrice(rs.getInt(8));
				list.setMin_person(rs.getInt(9));
				list.setNow_person(rs.getInt(10));
				list.setMax_person(rs.getInt(11));
				list.setRegion(rs.getString(12));
				list.setReporting_date(rs.getString(13));
				list.setDescription(rs.getString(14));
				list.setProgression(rs.getString(15));
				list.setApproval(rs.getString(16));
				list.setJob(rs.getString(17));
				list.setPlace_name(rs.getString(18));
				list.setPlace_addr(rs.getString(19));
				list.setPhone(rs.getString(20));
				list.setPoint(rs.getInt(21));
				list.setIntro(rs.getString(22));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt, rs);
		}

		return list;
	}
	public String getsearch(int num, int mem_num){
		String sql = "select * from Participation where num="+num+" and mem_num="+mem_num+" and payment_option != -1";
		String check=null;
		int count=0;
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()){
				count++;
			}
			if(count>0){
				check="n";
			}else{
				check="y";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt, rs);
		}

		return check;
	}
}

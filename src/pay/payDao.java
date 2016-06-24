package pay;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import create.DBConnectionMgr;
import join.listDto;

public class payDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public void insert(int num, String s_m, int paymenttype, int price, int mem_num, int cash) {
		String sql = "insert into Participation values(?,?,seq_part_num.nextVal,?,sysdate,?,?)";
		String sql1 = "select part_num from participation where num=" + num + " and mem_num=" + mem_num;
		String sql2 = "insert into pointinfo(point_num, mem_num, part_num, point) values(point_num.nextVal,?,?,?)";
		String sql3 = "update member set point=point+? where mem_num=" + mem_num;
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();

			int part_num = 0;

			// 참여에 기록 삽입
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, mem_num);
			stmt.setString(2, s_m);
			stmt.setInt(3, num);
			stmt.setInt(4, paymenttype);
			stmt.setInt(5, cash);
			stmt.executeUpdate();

			// 참여번호 찾기
			stmt = con.prepareStatement(sql1);
			rs = stmt.executeQuery();
			while (rs.next()) {
				part_num = rs.getInt(1);
			}
			
			// 포인트 기록 삽입
			stmt = con.prepareStatement(sql2);
			stmt.setInt(1, mem_num);
			stmt.setInt(2, part_num);
			stmt.setInt(3, (int)(price * 0.01));
			stmt.executeUpdate();

			// 멤버에 포인트 부여
			stmt = con.prepareStatement(sql3);
			stmt.setInt(1, (int) (price * 0.01));

			stmt.executeUpdate();
		} catch (Exception err) {
			System.out.println("참가 실패 : " + err);

		} finally {
			pool.freeConnection(con, stmt, rs);

		}
	}

	public void meetingupdate(int num, int mem_num, int cash) {
		//모임의 현재 인원가져오기
		String sql = "select now_person from Speech_Meeting where num=" + num;
		//모임의 현재 인원 1명 늘리기
		String sql1 = "update Speech_Meeting set now_person=? where num=" + num;
		//모임에 point사용시 차감
		String sql2 = "update member set point=point-"+cash+"where mem_num="+mem_num;
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			int now_person = 0;
			while (rs.next()) {
				now_person = rs.getInt(1);
			}

			stmt = con.prepareStatement(sql1);
			stmt.setInt(1, now_person + 1);
			stmt.executeUpdate();
			
			stmt = con.prepareStatement(sql2);
			stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("수정: " + e);
		} finally {
			pool.freeConnection(con, stmt, rs);

		}
	}
}

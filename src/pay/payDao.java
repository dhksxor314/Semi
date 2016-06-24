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

			// ������ ��� ����
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, mem_num);
			stmt.setString(2, s_m);
			stmt.setInt(3, num);
			stmt.setInt(4, paymenttype);
			stmt.setInt(5, cash);
			stmt.executeUpdate();

			// ������ȣ ã��
			stmt = con.prepareStatement(sql1);
			rs = stmt.executeQuery();
			while (rs.next()) {
				part_num = rs.getInt(1);
			}
			
			// ����Ʈ ��� ����
			stmt = con.prepareStatement(sql2);
			stmt.setInt(1, mem_num);
			stmt.setInt(2, part_num);
			stmt.setInt(3, (int)(price * 0.01));
			stmt.executeUpdate();

			// ����� ����Ʈ �ο�
			stmt = con.prepareStatement(sql3);
			stmt.setInt(1, (int) (price * 0.01));

			stmt.executeUpdate();
		} catch (Exception err) {
			System.out.println("���� ���� : " + err);

		} finally {
			pool.freeConnection(con, stmt, rs);

		}
	}

	public void meetingupdate(int num, int mem_num, int cash) {
		//������ ���� �ο���������
		String sql = "select now_person from Speech_Meeting where num=" + num;
		//������ ���� �ο� 1�� �ø���
		String sql1 = "update Speech_Meeting set now_person=? where num=" + num;
		//���ӿ� point���� ����
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
			System.out.println("����: " + e);
		} finally {
			pool.freeConnection(con, stmt, rs);

		}
	}
}

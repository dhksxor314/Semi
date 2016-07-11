package update;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import create.DBConnectionMgr;
import join.listDto;

public class update {
	private Connection con;
	private PreparedStatement stmt;
	private PreparedStatement stmt1;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public void update(int num) {
		String sql = "update Speech_Meeting set progression=? where num=" + num;
		try {
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);

			stmt.setString(1, "n");

			stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("¼öÁ¤ : " + e);
		} finally {
			pool.freeConnection(con, stmt, rs);

		}
	}
}

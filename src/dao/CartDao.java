/*
 ������ - ����������_��ٱ���
�ۼ��� - ���ֿ�
������¥ - 2016/06/20
���� - ��ٱ��Ͽ� ���� ��� ���/�������̺� ���
 */

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Vector;

import dbcp.DBConnectionMgr;
import dto.Participation_Dto;
import dto.PutInDto;

public class CartDao {
	
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		DBConnectionMgr pool = null;
	
	public CartDao(){
		try{
			
		if(pool==null){
			pool = DBConnectionMgr.getInstance();
		}
					
		}catch(Exception err){
			System.out.println("DB���� ��ü ���� ���� : "+err);
		}
	}
	
//��ٱ���_���
			public Vector<PutInDto> CartList(){

				Vector<PutInDto> PutIn = new Vector<PutInDto>();	
							
				String sql = null;				
						
					sql = "select s.s_m, s.num, s.title, s.price, s.image, pi.putIn_num "
							+ "from Speech_Meeting s "
							+ " join PutIn pi on (s.s_m = pi.s_m and s.num = pi.num)"
							+ " where s.reporting_date < sysdate()";		
					
				try{
					con = pool.getConnection();
					stmt = con.prepareStatement(sql);
					rs = stmt.executeQuery();
					
					while(rs.next()){
						
						PutInDto dto = new PutInDto();
							
						dto.setS_m(rs.getString("s_m"));
						dto.setNum(rs.getInt("num"));
						dto.setPutIn_num(rs.getInt("putIn_num"));
						dto.setTitle(rs.getString("title"));				
						dto.setImage(rs.getString("image"));
						dto.setPrice(rs.getInt("price"));
					
						PutIn.add(dto);			
					}
				}
				catch(Exception err){
					System.out.println("��ٱ��� ��� : "+err);
				}
				finally{
					pool.freeConnection(con, stmt, rs);
				}
				return  PutIn;
			}

//��ٱ���_�ֹ��� ���� ��ȸ
			public Vector<PutInDto> OrderCartList(int num){

				Vector<PutInDto> PutIn = new Vector<PutInDto>();	
							
				String sql = null;				
						
					sql = "select s.s_m, s.num, s.reporting_date, pi.mem_num "
							+ "from Speech_Meeting s "
							+ " join PutIn pi on (s.s_m = pi.s_m and s.num = pi.num)"
							+ " where s.num=?";		
					
				try{
					con = pool.getConnection();
					stmt = con.prepareStatement(sql);
					stmt.setInt(1, num);
					rs = stmt.executeQuery();
					
					while(rs.next()){
						
						PutInDto dto = new PutInDto();
							
						dto.setS_m(rs.getString("s_m"));
						dto.setNum(rs.getInt("num"));
						dto.setReporting_date(rs.getDate("reporting_date"));
						dto.setMem_num(rs.getInt("mem_num"));
					
						PutIn.add(dto);				
						
					}
				}
				catch(Exception err){
					System.out.println("��ٱ��� �ֹ� : "+err);
				}
				finally{
					pool.freeConnection(con, stmt, rs);
				}
				return  PutIn;
			}
		
	//������ ���� ���� ���̺� ��� 
			public Vector<Participation_Dto> OrderPart(Vector<Participation_Dto> dto){	
							
				String sql = null;	
				
					sql = "insert into Participate(mem_num, s_m, num, reporting_date, payment_option) "
							+ "values (?,?,?,?,?)";
										
				try{
					
					con = pool.getConnection();
					stmt = con.prepareStatement(sql);
					
				for (int i = 0; i < dto.size(); i++) {
					
					stmt.setInt(1, dto.get(i).getMem_num());
					stmt.setString(2, dto.get(i).getS_m());
					stmt.setInt(3, dto.get(i).getNum());
					stmt.setDate(4, (java.sql.Date) dto.get(i).getReporting_date());
					stmt.setInt(5, dto.get(i).getPayment_option());
								
					}		
					stmt.executeUpdate();
				
				}catch(Exception err){
					System.out.println("�ֹ����� �������̺� �߰� : "+err);
				}
				finally{
					pool.freeConnection(con, stmt);
				}
				return dto;
			}
			
			//��ٱ��Ͽ� �߰�
			public void insertcart(String s_m, int num, int mem_num){	
				
				String sql = null;	
				
					sql = "insert into PutIn(mem_num, s_m, num) values (?,?,?)";

				try{
					
					con = pool.getConnection();
					stmt = con.prepareStatement(sql);
					
					stmt.setInt(1, mem_num);
					stmt.setString(2, s_m);
					stmt.setInt(3, num);
					
					stmt.executeUpdate();
				
				}catch(Exception err){
					System.out.println("��ٱ��� ��� : "+err);
				}
				finally{
					pool.freeConnection(con, stmt);
				}
			}	
			
			
			//��ٱ���_�ֹ��� ���� ��ȸ
			public int PutInList(int mem_num, int putIn_num){	
				
				int num = 0;
				
				String sql = null;				
						
					sql = "select num from PutIn where mem_num=? and putIn_num=?";		
					
				try{
					con = pool.getConnection();
					stmt = con.prepareStatement(sql);
					rs = stmt.executeQuery();
												
					num = rs.getInt("num");					
				}
				catch(Exception err){
					System.out.println("��ٱ��� �ֹ� : "+err);
				}
				finally{
					pool.freeConnection(con, stmt, rs);
				}
				return  num;
			}
			
			
}

/*
 페이지 - 마이페이지_장바구니
작성자 - 이주연
수정날짜 - 2016/06/20
설명 - 장바구니에 담을 경우 출력/참가테이블에 담기
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
			System.out.println("DB연결 객체 생성 실패 : "+err);
		}
	}
	
//장바구니_출력
			public Vector<PutInDto> CartList(){

				Vector<PutInDto> PutIn = new Vector<PutInDto>();	
							
				String sql = null;				
						
					sql = "select s.s_m, s.title, s.price, s.image, pi.putIn_num "
							+ "from Speech_Meeting s "
							+ " join putin pi on (s.s_m = pi.s_m and s.num = pi.num)";		
					
				try{
					con = pool.getConnection();
					stmt = con.prepareStatement(sql);
					rs = stmt.executeQuery();
					
					while(rs.next()){
						
						PutInDto dto = new PutInDto();
							
						dto.setS_m(rs.getString("s_m"));
						dto.setPutIn_num(rs.getInt("putIn_num"));
						dto.setTitle(rs.getString("title"));				
						dto.setImage(rs.getString("image"));
						dto.setPrice(rs.getInt("price"));
					
						PutIn.add(dto);			
					}
				}
				catch(Exception err){
					System.out.println("장바구니 출력 : "+err);
				}
				finally{
					pool.freeConnection(con, stmt, rs);
				}
				return  PutIn;
			}

//장바구니_주문한 만남 조회
			public Vector<PutInDto> OrderCartList(int num){

				Vector<PutInDto> PutIn = new Vector<PutInDto>();	
							
				String sql = null;				
						
					sql = "select s.s_m, s.num, s.reporting_date, pi.mem_num "
							+ "from Speech_Meeting s "
							+ " join putin pi on (s.s_m = pi.s_m and s.num = pi.num)"
							+ " where putIn_num=?";		
					
				try{
					con = pool.getConnection();
					stmt = con.prepareStatement(sql);
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
					System.out.println("장바구니 주문 : "+err);
				}
				finally{
					pool.freeConnection(con, stmt, rs);
				}
				return  PutIn;
			}
		
	//선택한 만남 참가 테이블에 등록 
			public Vector<Participation_Dto> OrderPart(Vector<Participation_Dto> dto){	
							
				String sql = null;	
				
					sql = "insert into participate values (?,?,?,part_num.nextVal,?,?)";
					
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
					stmt.executeQuery();
				
				}catch(Exception err){
					System.out.println("주문이후 참가테이블에 추가 : "+err);
				}
				finally{
					pool.freeConnection(con, stmt);
				}
				return dto;
			}
			
			//장바구니에 추가
			public void insertcart(String s_m, int num, int mem_num){	
				
				String sql = null;	
				
					sql = "insert into putin values (?,cart_num.nextVal,?,?)";
					
				try{
					
					con = pool.getConnection();
					stmt = con.prepareStatement(sql);
					
					stmt.setInt(1, mem_num);
					stmt.setString(2, s_m);
					stmt.setInt(3, num);
					
								

					stmt.executeQuery();
				
				}catch(Exception err){
					System.out.println("메시지 등록 : "+err);
				}
				finally{
					pool.freeConnection(con, stmt);
				}
			}		
			
}

/*
������ - ����������_Ȱ������
�ۼ��� - ���ֿ�
������¥ - 2016/06/20
���� - ����, ����, ����, �Ϸ�
 */

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;
import dbcp.DBConnectionMgr;
import dto.Participation_Dto;
import dto.Speech_Meeting_Dto;
import dto.MemberDto;


public class ActiveDao {
	
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		DBConnectionMgr pool = null;
	
	public ActiveDao(){
		try{
			
		if(pool==null){
			pool = DBConnectionMgr.getInstance();
		}
					
		}catch(Exception err){
			System.out.println("DB���� ��ü ���� ���� : "+err);
		}
	}
	
//Ȱ������_����
		
		public Vector<Participation_Dto> SpeechList(int mem_num){
				Vector<Participation_Dto> s_part = new Vector<Participation_Dto>();	
							
				String sql = null;				
						
		sql ="select s.s_m, s.num, s.title, s.reporting_date, s.starttime, s.endtime, "
				+ " s.image, pl.place_name, s.price, sp.name"
				+ " from Speech_Meeting s "
				+ " join Participation p on (s.s_m = p.s_m and s.num = p.num)"
				+ " join Place pl on (s.place_num = pl.place_num)"
				+ " join Speaker sp on (s.speaker_num = sp.speaker_num) "
				+ " where s.s_m='s' and sysdate <= s.REPORTING_DATE and p.mem_num="+mem_num;
 		
				try{
					con = pool.getConnection();
					stmt = con.prepareStatement(sql);
					rs = stmt.executeQuery();
					
					while(rs.next()){
						
						Participation_Dto dto = new Participation_Dto();
						
						dto.setS_m(rs.getString("s_m"));
						dto.setNum(rs.getInt("num"));
						dto.setTitle(rs.getString("title"));				
						dto.setReporting_date(rs.getDate("reporting_date"));
						dto.setStarttime(rs.getString("starttime"));
						dto.setEndtime(rs.getString("endtime"));
						dto.setImage(rs.getString("image"));
						dto.setPlace_name(rs.getString("place_name"));
						dto.setPrice(rs.getInt("price"));
						dto.setName(rs.getString("name"));

						s_part.add(dto);			
					}
				}
				catch(Exception err){
					System.out.println("Ȱ������_���� ��� : "+err);
				}
				finally{
					pool.freeConnection(con, stmt, rs);
				}
				return  s_part;
			}

//Ȱ������_����
		
				public Vector<Participation_Dto> MeetingList(int mem_num){
						Vector<Participation_Dto> m_part = new Vector<Participation_Dto>();	
									
						String sql = null;				
								
				sql ="select s.s_m, s.num, s.title, s.reporting_date, s.starttime, s.endtime, s.image, pl.place_name, s.price, m.name "
						+ " from Speech_Meeting s "
						+ " join Participation p on (s.s_m = p.s_m and s.num = p.num)"
						+ " join Place pl on (s.place_num = pl.place_num)"
						+ " join member m on (s.mem_num = m.mem_num) "
						+ " where s.s_m='m' and sysdate <= s.REPORTING_DATE and p.mem_num="+mem_num;
										
						try{
							con = pool.getConnection();
							stmt = con.prepareStatement(sql);
							rs = stmt.executeQuery();
							
							while(rs.next()){
								
								Participation_Dto dto = new Participation_Dto();
								
								dto.setS_m(rs.getString("s_m"));
								dto.setNum(rs.getInt("num"));
								dto.setTitle(rs.getString("title"));				
								dto.setReporting_date(rs.getDate("reporting_date"));
								dto.setStarttime(rs.getString("starttime"));
								dto.setEndtime(rs.getString("endtime"));
								dto.setImage(rs.getString("image"));
								dto.setPlace_name(rs.getString("place_name"));
								dto.setPrice(rs.getInt("price"));
								dto.setName(rs.getString("name"));
								m_part.add(dto);			
							}
						}
						catch(Exception err){
							System.out.println("Ȱ������_���� ��� : "+err);
						}
						finally{
							pool.freeConnection(con, stmt, rs);
						}
						return  m_part;
					}
		
//������ ������ ���(ȸ������ ������ ������ �� ����)
		
		public Vector<Speech_Meeting_Dto> OpenList(int mem_num){
			
			Vector<Speech_Meeting_Dto> open = new Vector<Speech_Meeting_Dto>();	
			
			String sql=" ";
					 					
			try{
				sql = "select s.num, s.title, s.reporting_date, s.image, pl.place_name, s.now_person, s.max_person, s.approval"
						+ " from Speech_Meeting s"
						+ " join Place pl on (s.place_num = pl.place_num)"
						+ " join member m on (s.mem_num = m.mem_num) "
						+ " where s.s_m='m' and sysdate <= s.REPORTING_DATE and s.mem_num="+mem_num;
				
				con = pool.getConnection();
				stmt = con.prepareStatement(sql);
				rs = stmt.executeQuery();
				
				while(rs.next()){
					
					Speech_Meeting_Dto dto = new Speech_Meeting_Dto();
					
					dto.setNum(rs.getInt("num"));
					dto.setTitle(rs.getString("title"));
					dto.setReporting_date(rs.getDate("reporting_date"));
					dto.setImage(rs.getString("image"));
					dto.setPlace_name(rs.getString("place_name"));
					dto.setNow_person(rs.getInt("now_person"));
					dto.setMax_person(rs.getInt("max_person"));
					dto.setApproval(rs.getString("approval"));
					
					
					open.add(dto);	
				}
			}
			catch(Exception err){
				System.out.println("������ ���� ��� : "+err);
			}
			finally{
				pool.freeConnection(con, stmt, rs);
			}
			return open;
		}	

		//�����ڰ� �ڽ��� ������ �κ��� �� �� ����
		
				public Vector<Speech_Meeting_Dto> SpeakerOpenList(int speaker_num){
					
					Vector<Speech_Meeting_Dto> open = new Vector<Speech_Meeting_Dto>();	
					
					String sql=" ";
							 					
					try{
						sql = "select s.num, s.title, s.reporting_date, s.image, pl.place_name, s.now_person, s.max_person"
								+ " from Speech_Meeting s"
								+ " join Place pl on (s.place_num = pl.place_num)"
								+ " join Speaker sp on (s.speaker_num = sp.speaker_num) "
								+ " where sysdate <= s.REPORTING_DATE and s.speaker_num="+speaker_num;
						
						con = pool.getConnection();
						stmt = con.prepareStatement(sql);
						rs = stmt.executeQuery();
						
						while(rs.next()){
							
							Speech_Meeting_Dto dto = new Speech_Meeting_Dto();
							
							dto.setNum(rs.getInt("num"));
							dto.setTitle(rs.getString("title"));
							dto.setReporting_date(rs.getDate("reporting_date"));
							dto.setImage(rs.getString("image"));
							dto.setPlace_name(rs.getString("place_name"));
							dto.setNow_person(rs.getInt("now_person"));
							dto.setMax_person(rs.getInt("max_person"));
							
							open.add(dto);	
						}
					}
					catch(Exception err){
						System.out.println("������ ���� ��� : "+err);
					}
					finally{
						pool.freeConnection(con, stmt, rs);
					}
					return open;
				}	

		
		
//�Ϸ�� ����/���� ���	
		public Vector<Participation_Dto> CompleteList(int speaker_num){

			Vector<Participation_Dto> complete = new Vector<Participation_Dto>();	
						
			String sql="";
					
			try{
				sql ="select s.title, s.reporting_date, s.now_person, s.image, pl.place_name, s.price "
						+ " from Speech_Meeting s"
						+ " join Place pl on (s.place_num = pl.place_num)"
						+ " join Speaker sp on (s.speaker_num = sp.speaker_num) "
						+ " where s.REPORTING_DATE+1 < sysdate and s.speaker_num="+speaker_num;
				
				con = pool.getConnection();
				stmt = con.prepareStatement(sql);
				rs = stmt.executeQuery();			
						
				while(rs.next()){
					
					Participation_Dto dto = new Participation_Dto();
					
					dto.setTitle(rs.getString("title"));
					dto.setReporting_date(rs.getDate("reporting_date"));
					dto.setImage(rs.getString("image"));
					dto.setPlace_name(rs.getString("place_name"));
					dto.setPrice(rs.getInt("price"));
					
					complete.add(dto);	
				}
			}
			catch(Exception err){
				System.out.println("�Ϸ�� ���� ��� : "+err);
			}
			finally{
				pool.freeConnection(con, stmt, rs);
			}
			return complete;
		}	
				
		//�����ڰ� �Ϸ�� ������ �� �� �ִ�. 
				public Vector<Participation_Dto> SpeakerCompleteList(int mem_num){

					Vector<Participation_Dto> complete = new Vector<Participation_Dto>();	
								
					String sql="";
							
					try{
						sql ="select s.s_m, s.title, sp.name, s.reporting_date, s.starttime, s.endtime, s.image, pl.place_name, s.price "
								+ " from Speech_Meeting s"
								+ " join Participation p on (s.s_m = p.s_m and s.num = p.num)"
								+ " join Place pl on (s.place_num = pl.place_num)"
								+ " join Speaker sp on (s.speaker_num = sp.speaker_num) "
								+ " where s.REPORTING_DATE+1 < sysdate and p.mem_num="+mem_num;
						
						con = pool.getConnection();
						stmt = con.prepareStatement(sql);
						rs = stmt.executeQuery();			
								
						while(rs.next()){
							
							Participation_Dto dto = new Participation_Dto();
							
							dto.setTitle(rs.getString("title"));
							dto.setName(rs.getString("name"));
							dto.setReporting_date(rs.getDate("reporting_date"));
							dto.setImage(rs.getString("image"));
							dto.setPlace_name(rs.getString("place_name"));
							dto.setPrice(rs.getInt("price"));
							
							complete.add(dto);	
						}
					}
					catch(Exception err){
						System.out.println("�Ϸ�� ���� ��� : "+err);
					}
					finally{
						pool.freeConnection(con, stmt, rs);
					}
					return complete;
				}			
		
		//���ӿ� ������ ȸ�� ����		
		public Vector<MemberDto> ParticipantList(int mem_num){
				
			Vector<MemberDto> mem = new Vector<MemberDto>();	
							
				String sql = null;	
				
					sql = "select p.mem_num, m.name, m.phone, m.email, s.now_person, s.max_person"
							+ " from participation p"
							+ " join speech_meeting s on (s.s_m = p.s_m and s.num = p.num)"
							+ " join member m on (p.mem_num = m.mem_num)"
							+ " where s.reporting_date > sysdate and s.mem_num="+mem_num;
					
				try{
					con = pool.getConnection();
					stmt = con.prepareStatement(sql);
					rs = stmt.executeQuery();
					
					while(rs.next()){
						
						MemberDto dto = new MemberDto();
						
						dto.setMem_num(rs.getInt("mem_num"));
						dto.setName(rs.getString("name"));
						dto.setPhone(rs.getString("phone"));
						dto.setEmail(rs.getString("email"));
						dto.setNow_person(rs.getInt("now_person"));
						dto.setMax_person(rs.getInt("max_person"));	
						
						mem.add(dto);	
					}
				}
				catch(Exception err){
					System.out.println("������ ���� ��� : "+err);
				}
				finally{
					pool.freeConnection(con, stmt, rs);
				}
				return mem;
			}		
		
		
		//�ڽ��� ������ ������ ȸ�� Ȯ��
		public Vector<MemberDto> SpeakerParticipantList(int speaker_num){
				
			Vector<MemberDto> mem = new Vector<MemberDto>();	
							
				String sql = null;	
				
					sql = "select p.mem_num, m.name, m.phone, m.email, s.now_person, s.max_person"
							+ " from participation p"
							+ " join speech_meeting s on (s.s_m = p.s_m and s.num = p.num)"
							+ " join member m on (p.mem_num = m.mem_num)"
							+ " join Speaker sp on (s.speaker_num = sp.speaker_num) "
							+ " where s.speaker_num="+speaker_num;
					
				try{
					con = pool.getConnection();
					stmt = con.prepareStatement(sql);
					rs = stmt.executeQuery();
					
					while(rs.next()){
						
						MemberDto dto = new MemberDto();
						
						dto.setMem_num(rs.getInt("mem_num"));
						dto.setName(rs.getString("name"));
						dto.setPhone(rs.getString("phone"));
						dto.setEmail(rs.getString("email"));
						dto.setNow_person(rs.getInt("now_person"));
						dto.setMax_person(rs.getInt("max_person"));	
						
						mem.add(dto);	
					}
				}
				catch(Exception err){
					System.out.println("������ ���� ��� : "+err);
				}
				finally{
					pool.freeConnection(con, stmt, rs);
				}
				return mem;
			}			
		
		
	}


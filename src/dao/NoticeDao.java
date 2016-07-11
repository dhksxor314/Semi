/*
 *  �ۼ��� : ������
 *  ���� : �������׿� ���õ� �۾��� ���� Dao
 *   
 */

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import dbcp.DBConnectionMgr;
import dto.NoticeDto;

public class NoticeDao {
   private Connection con;
   private PreparedStatement stmt;
   private ResultSet rs;
   private DBConnectionMgr pool;
   
   public NoticeDao(){
      try{
         pool = DBConnectionMgr.getInstance();
      }
      catch(Exception err){
         System.out.println("DB���ᰴü �������� : " + err);
      }
   }
   
   //��ȸ���� �ø��� �޼���
   public void addCount(int notice_num){

      String sql = "update Notice set count=count+1 where notice_num=" + notice_num;
      try{
         con = pool.getConnection();
         stmt = con.prepareStatement(sql);
         stmt.executeQuery();
      }
      catch(Exception err){
         System.out.println("addCount : " + err);
      }
      finally{
         pool.freeConnection(con, stmt);
      }
   }
   
   //�������� ���
   public void insertNotice(NoticeDto dto){ 
      System.out.println(dto.getManage_num());
      try{      
         con = pool.getConnection();

         String sql = "insert into Notice(title, content, reporting_date, manage_num, count) "
                 + "values(?, ?, sysdate(), ?, ?)";
         stmt = con.prepareStatement(sql);
         
         stmt.setString(1, dto.getTitle());
         stmt.setString(2, dto.getContent());
         
         stmt.setInt(3, dto.getManage_num());
         stmt.setInt(4, 0);

         stmt.executeUpdate();
      }
      catch(Exception err){
         System.out.println("�������� �߰� ���� : " + err);
      }
      finally{
         pool.freeConnection(con, stmt);
      }
   }
   
   //�б⳪ ���� �� �� �ش� ���������� ���� ������
   public NoticeDto getNotice(int notice_num){
      NoticeDto dto = new NoticeDto();
      String sql = "select * from Notice where notice_num=" + notice_num;
      try{
         con = pool.getConnection();

         stmt = con.prepareStatement(sql);
         rs = stmt.executeQuery();
         
         if(rs.next()){
            dto.setNotice_num(rs.getInt("notice_num"));
            dto.setTitle(rs.getString("title"));
            dto.setContent(rs.getString("content"));
            dto.setReporting_date(rs.getString("reporting_date"));
            dto.setManage_num(rs.getInt("manage_num"));
            dto.setCount(rs.getInt("count"));
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
   
   //����
   public void updateNotice(NoticeDto dto){  
      String sql = "update Notice set title=?, content=?, "
            + "reporting_date=sysdate where notice_num=?";
      
      try{
         con = pool.getConnection();
         stmt = con.prepareStatement(sql);
         
         stmt.setString(1, dto.getTitle());
         stmt.setString(2, dto.getContent());
         stmt.setInt(3, dto.getNotice_num());         
         
         stmt.executeUpdate();
      }
      catch(Exception err){
         System.out.println("updateNotice : " + err);
      }
      finally{
         pool.freeConnection(con, stmt);
      }
   }
   
   //����
   public void deleteNotice(int notice_num){   
      String sql = "delete from Notice where notice_num=" + notice_num;
      try{
         con = pool.getConnection();
         stmt = con.prepareStatement(sql);   
         stmt.executeUpdate();
      }
      catch(Exception err){
         System.out.println("deleteNotice : " + err);
      }
      finally{
         pool.freeConnection(con, stmt);
      }
   }
   
   //��ü �������� ����
   public Vector<NoticeDto> getNoticeList(String keyField, String keyWord){
      Vector<NoticeDto> vList = new Vector<NoticeDto>();
      String sql = null;
      
      if(keyWord.equals("") || keyWord.isEmpty()){
         sql = "select * from Notice order by notice_num desc";
      }
      else{
         sql = "select * from Notice where " + keyField + 
            " like '%" + keyWord + "%' order by notice_num desc";
      }
      
      try{
         con = pool.getConnection();
         stmt = con.prepareStatement(sql);
         rs = stmt.executeQuery();
         
         while(rs.next()){
            NoticeDto dto = new NoticeDto();
            dto.setNotice_num(rs.getInt("notice_num"));
            dto.setTitle(rs.getString("title"));
            dto.setContent(rs.getString("content"));
            dto.setCount(rs.getInt("count"));
            dto.setManage_num(rs.getInt("manage_num"));
            dto.setReporting_date(rs.getString("reporting_date"));
            vList.add(dto);
         }
      }
      catch(Exception err){
         System.out.println("getNoticeList : " + err);
      }
      finally{
         pool.freeConnection(con, stmt, rs);
      }
      return vList;
   }
   
}











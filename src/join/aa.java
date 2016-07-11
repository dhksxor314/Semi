package join;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

class DateAdd {
 public static void main(String args[]){
  
  String today = null;
  
  
  Date date = new Date();
  
  System.out.println(date);
  
  // ���˺��� ( ����� �ú���)
  SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
  
  // Java �ð� ���ϱ�
  
  Calendar cal = Calendar.getInstance();
  
  cal.setTime(date);
  
  // 10�� ���ϱ�
  cal.add(Calendar.MINUTE, 10);
  
  today = sdformat.format(cal.getTime());  
  System.out.println("10���� : " + today);
  
  cal.setTime(date);
  // 1�ð� ��
  cal.add(Calendar.HOUR, -1);
  
  today = sdformat.format(cal.getTime());  
  System.out.println("1�ð� �� : " + today);
  
  cal.setTime(date);
  // �Ϸ� ��
  cal.add(Calendar.DATE, -1);
  
  today = sdformat.format(cal.getTime());  
  System.out.println("1�� �� : " + today);
 
 }

}

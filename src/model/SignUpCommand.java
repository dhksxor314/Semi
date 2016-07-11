/*
 *  �ۼ��� : ������
 *  ���� : ȸ������ ���������� �޾ƿ� ������ ��� �Է½�Ű������ Ŀ�ǵ�
 *   
 */
package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import dao.MemberDao;
import dto.MemberDto;
import mybean.BasicBean;

public class SignUpCommand implements Command{
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		
		BasicBean basic = BasicBean.newInstance();
		MemberDto dto = new MemberDto();
		MemberDao dao = new MemberDao();
		
		//eenctype="multipart/form-data"�� �����͸� �ޱ� ���� MultipartRequest �Ķ���Ͱ����� �Է�
		basic.setPath(req, "upload");//���
		basic.setMax(50*1024*1024);//���� ũ�� ����
		basic.setEncType("euc-kr");//���ڵ� Ÿ��
		basic.setMulti(req);
		
		dto.setName(basic.getMulti().getParameter("name"));
		dto.setPassword(basic.getMulti().getParameter("pass"));
		dto.setEmail(basic.getMulti().getParameter("email1")+"@"+basic.getMulti().getParameter("email2"));
		
		//������� �Է��� �ÿ� ���� ������ ��, ��, ���� �߶󳻰� ��� �Է��ϱ� ���� �۾��� �ϴ� ����
		String year = basic.getMulti().getParameter("birth").split("��")[0];
		String month = basic.getMulti().getParameter("month").split("��")[0];
		String day = basic.getMulti().getParameter("day").split("��")[0];
		String birthdate = "";
		//���� ���� ������ ���� ���̰� 4�� ���� �����ÿ� 4�ڸ��� ���߱����� �۾��� �ϴ� ����
		if((month+day).length()<4){
			if(month.length()<2){
				month="0"+month;
			}
			if(day.length()<2){
				day="0"+day;
			}
			birthdate= year+month+day;
		}
		else{
			birthdate = year+month+day;
		}
		dto.setBirthdate(Integer.parseInt(birthdate));
		dto.setGender(basic.getMulti().getParameter("gender"));
		dto.setId(basic.getMulti().getParameter("id"));
		dto.setInvite_agree(basic.getMulti().getParameter("invite_agree"));
		dto.setImage(basic.getUpFileInfo());
		String phone = basic.getMulti().getParameter("tel0")+basic.getMulti().getParameter("tel1")+basic.getMulti().getParameter("tel2");
		dto.setPhone(phone);
		dao.insertMember(dto);
		
		return "SignUpComplete.jsp";
	}
	
}

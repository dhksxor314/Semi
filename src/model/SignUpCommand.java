/*
 *  작성자 : 전현영
 *  설명 : 회원가입 페이지에서 받아온 값들을 디비에 입력시키기위한 커맨드
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
		
		//eenctype="multipart/form-data"의 데이터를 받기 위한 MultipartRequest 파라미터값을을 입력
		basic.setPath(req, "upload");//경로
		basic.setMax(50*1024*1024);//파일 크기 제한
		basic.setEncType("euc-kr");//인코딩 타입
		basic.setMulti(req);
		
		dto.setName(basic.getMulti().getParameter("name"));
		dto.setPassword(basic.getMulti().getParameter("pass"));
		dto.setEmail(basic.getMulti().getParameter("email1")+"@"+basic.getMulti().getParameter("email2"));
		
		//생년월일 입력할 시에 같이 들어오는 년, 월, 일을 잘라내고 디비에 입력하기 위한 작업을 하는 과정
		String year = basic.getMulti().getParameter("birth").split("년")[0];
		String month = basic.getMulti().getParameter("month").split("월")[0];
		String day = basic.getMulti().getParameter("day").split("일")[0];
		String birthdate = "";
		//월과 일을 더했을 때의 길이가 4가 되지 않을시에 4자리로 맞추기위한 작업을 하는 과정
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

/*
 *  작성자 : 전현영
 *  설명 : 검색시에 사용되는 커맨드
 *  	  장소와 회원, 공지사항, 강연 및 만남, 만남승인의 검색을 처리한다.
 *   
 */

package model;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

public class SearchCommand implements Command{
	//검색 버튼을 눌렀을 시
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		String classify = req.getParameter("classify");
		String url="";
		
		//분류에 따라 다르게 url을 줌
		if(classify.equals("place")){
			url= "/WEB-INF/manage/Place_List.jsp";
		}
		else if(classify.equals("member")){
			url = "/WEB-INF/manage/Member_List.jsp";
		}
		else if(classify.equals("notice")){
			url = "Notice.jsp";
		}
		//강연이나 모임일 경우
		else if(classify.equals("meeting") || classify.equals("speech")){
			if(classify.equals("meeting")){
				url="/WEB-INF/manage/Meeting_List.jsp";
			}
			else{
				url="/WEB-INF/manage/Speech_List.jsp";
			}
			//날짜가 널이 아닐경우에 request값을 지정
			if(req.getParameter("start")!=null){
				req.setAttribute("start", req.getParameter("start"));
				req.setAttribute("end", req.getParameter("end"));
			}
			req.setAttribute("progression", req.getParameter("progression"));
		}
		//모임 승인
		else if(classify.equals("meeting_grant")){
			url="/WEB-INF/manage/Meeting_Grant.jsp";
			if(req.getParameter("start")!=null){
				req.setAttribute("start", req.getParameter("start"));//검색된 날짜값들을 유지시킨다.
				req.setAttribute("end", req.getParameter("end"));
			}
		}
		
		req.setAttribute("keyField", req.getParameter("keyField"));//검색된 키필드와 키워드를 유지시킨다.
		req.setAttribute("keyWord", req.getParameter("keyWord"));
		
		return url;
	}
}

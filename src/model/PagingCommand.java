/*
 *  작성자 : 전현영
 *  설명 : 페이징을 수행하는 커맨드
 *  	  장소와 회원, 공지사항, 강연 및 만남, 만남승인의 페이징을 처리한다.
 *   
 */

package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

public class PagingCommand implements Command{
	//페이징
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		req.setCharacterEncoding("euc-kr");
		
		String classify = req.getParameter("classify");
		String url="";
		
		//분류에 따라 리턴할 url을 다르게 줌
		if(classify.equals("place")){
			url= "/WEB-INF/manage/Place_List.jsp";
		}
		else if(classify.equals("member")){
			url = "/WEB-INF/manage/Member_List.jsp";
		}
		else if(classify.equals("notice")){
			url = "Notice.jsp";
		}
		
		else if(classify.equals("meeting") || classify.equals("speech")){
			if(classify.equals("meeting")){
				url="/WEB-INF/manage/Meeting_List.jsp";
			}
			else{
				url="/WEB-INF/manage/Speech_List.jsp";
			}
			req.setAttribute("start", req.getParameter("start"));//시작날짜
			req.setAttribute("end", req.getParameter("end"));//끝나는 날짜
			req.setAttribute("progression", req.getParameter("progression"));//현재진행상황(모집 종료 및 진행중)
		}
		else if(classify.equals("meeting_grant")){
			url="/WEB-INF/manage/Meeting_Grant.jsp";
			if(req.getParameter("start")!=null){
				req.setAttribute("start", req.getParameter("start"));
				req.setAttribute("end", req.getParameter("end"));
			}
		}
	
		req.setAttribute("nowPage", Integer.parseInt(req.getParameter("nowPage")));//현재 페이지
		req.setAttribute("nowBlock", Integer.parseInt(req.getParameter("nowBlock")));//현재 블록
		req.setAttribute("keyWord", req.getParameter("keyWord"));
		req.setAttribute("keyField", req.getParameter("keyField"));
		
		
		return url;
	}
	
}

/*
 *  �ۼ��� : ������
 *  ���� : �˻��ÿ� ���Ǵ� Ŀ�ǵ�
 *  	  ��ҿ� ȸ��, ��������, ���� �� ����, ���������� �˻��� ó���Ѵ�.
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
	//�˻� ��ư�� ������ ��
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		String classify = req.getParameter("classify");
		String url="";
		
		//�з��� ���� �ٸ��� url�� ��
		if(classify.equals("place")){
			url= "/WEB-INF/manage/Place_List.jsp";
		}
		else if(classify.equals("member")){
			url = "/WEB-INF/manage/Member_List.jsp";
		}
		else if(classify.equals("notice")){
			url = "Notice.jsp";
		}
		//�����̳� ������ ���
		else if(classify.equals("meeting") || classify.equals("speech")){
			if(classify.equals("meeting")){
				url="/WEB-INF/manage/Meeting_List.jsp";
			}
			else{
				url="/WEB-INF/manage/Speech_List.jsp";
			}
			//��¥�� ���� �ƴҰ�쿡 request���� ����
			if(req.getParameter("start")!=null){
				req.setAttribute("start", req.getParameter("start"));
				req.setAttribute("end", req.getParameter("end"));
			}
			req.setAttribute("progression", req.getParameter("progression"));
		}
		//���� ����
		else if(classify.equals("meeting_grant")){
			url="/WEB-INF/manage/Meeting_Grant.jsp";
			if(req.getParameter("start")!=null){
				req.setAttribute("start", req.getParameter("start"));//�˻��� ��¥������ ������Ų��.
				req.setAttribute("end", req.getParameter("end"));
			}
		}
		
		req.setAttribute("keyField", req.getParameter("keyField"));//�˻��� Ű�ʵ�� Ű���带 ������Ų��.
		req.setAttribute("keyWord", req.getParameter("keyWord"));
		
		return url;
	}
}

/*
������ - ����������_Ȱ������_������ ����_����
�ۼ��� - ���ֿ�
������¥ - 2016/06/20
���� - ������ȣ�� �޾ƿ� ����  
 */

package model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.DeleteDao_Active;
import dto.DeleteDao_Cart;

public class DeleteSpeechCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		 	req.setCharacterEncoding("euc-kr");
		    req.setCharacterEncoding("euc-kr");
			String url = null;
		    
		   int price  = Integer.parseInt(req.getParameter("price"));
		    
		   if(price == 0){
		    	String check  = req.getParameter("check");			
				DeleteDao_Active dao = new DeleteDao_Active();		
				dao.delete_meeting(Integer.parseInt(check));
				url ="/WEB-INF/MyPage/Active/MyPage_active_sppech.jsp";
				return url;
		    }else{
		    	url = "/WEB-INF/MyPage/Payment/MyPage_payment.jsp";
		    	return url;
		    }	
	}
}

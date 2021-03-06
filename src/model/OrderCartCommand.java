package model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import create.placeDto;
import dto.Bookmark_Dto;
import dao.CartDao;
import dto.DeleteDao_Cart;
import dto.Message_Dto;
import dto.Participation_Dto;
import dto.PutInDto;

public class OrderCartCommand implements Command {
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("euc-kr");
		
		CartDao dao = new CartDao();
		Vector<PutInDto> dto = new Vector<PutInDto>();
		Vector<Participation_Dto> dto_p = new Vector<Participation_Dto>();
			
		String[] check = req.getParameterValues("check");
		if(check != null){
			for(int i=0; i < check.length; i++){	
		//장바구니번호로 강연, 모임에 대한 조회							
			dto = dao.OrderCartList(Integer.parseInt(check[i]));
		System.out.println(Integer.parseInt(check[i]));
			}
			
			for (int i = 0; i < dto.size(); i++) {

				PutInDto list = dto.get(i);				
				
				Participation_Dto dto_part = new Participation_Dto(); 
				dto_part.setMem_num(dto.get(i).getMem_num());
				dto_part.setS_m(dto.get(i).getS_m());
				dto_part.setNum(dto.get(i).getNum());
				dto_part.setReporting_date(dto.get(i).getReporting_date());
				dto_part.setPayment_option(dto.get(i).getPayment_option());

				dto_p.add(dto_part);
			}
				
			 for(int c = 0; c < dto_p.size(); c++){			 
				 
				 Participation_Dto list = dto_p.get(c);			 
				 			 
				 	list.getMem_num();
				 	list.getS_m();
				 	list.getNum();
				 	list.getReporting_date();
				 	list.getPayment_option();
				 	//list.setReporting_date("sysdate");
			 }		
			
		}
		
		dao.OrderPart(dto_p);
		
		return "../../../main.jsp";
	}
}

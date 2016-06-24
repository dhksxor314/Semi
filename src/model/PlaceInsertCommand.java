package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import dao.PlaceDao;
import dto.PlaceDto;

public class PlaceInsertCommand implements Command{
	//장소등록
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		PlaceDao dao = new PlaceDao();
		PlaceDto dto = new PlaceDto();
		dto.setPlace_name(req.getParameter("name"));
		dto.setPhone(req.getParameter("tel"));
		dto.setAddress(req.getParameter("addr"));
		dto.setCapacity(Integer.parseInt(req.getParameter("capacity")));
		dao.insertPlace(dto);
		
		return "/WEB-INF/manage/Place_List.jsp";
	}
	
}

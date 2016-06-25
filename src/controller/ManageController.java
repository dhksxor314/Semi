/*
 *  작성자 : 전현영
 *  설명 : 관리자 관련 작업을 할 때 사용하는 컨트롤러
 *   
 */

package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.Command;
import model.FactoryCommand;
import mybean.BasicBean;

public class ManageController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		resp.setCharacterEncoding("euc-kr");
		
		String cmd = req.getParameter("cmd");
		BasicBean basic = BasicBean.newInstance();
		//multipart타입일 경우 req.getParameter("cmd")가 널이 들어오므로 multilpart타입으로 받귀 위한 부문
		if(cmd==null){			
			basic.setPath(req, "upload");
			basic.setMax(50*1024*1024);
			basic.setEncType("euc-kr");
			basic.setMulti(req);

			cmd = basic.getMulti().getParameter("cmd");
		}
		String url = "";
		Command command = null;
		FactoryCommand factory = FactoryCommand.newInstance();
		command = factory.createCommand(cmd);

		try {
			url = (String) command.processCommand(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}

		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}
	
}

package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Command;
import model.FactoryCommand;

public class FrontController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("euc-kr");

		String cmd = req.getParameter("cmd");
		String url = "";

		Command command = null;
		
		FactoryCommand factory = FactoryCommand.newInstance();
		command = factory.createCommand(cmd);

		try {
			url = (String) command.processCommand(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		// 페이지이동
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}
}

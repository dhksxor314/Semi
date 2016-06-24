package model3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command{
	public Object processCommand(HttpServletRequest req, 
								HttpServletResponse resp) 
										throws ServletException, IOException;
	}//인터페이스를 기준으로 처리할 일들을 별도의 클래스로 만들어서 처리한다.


package basic;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BasicBean {
	private int max;
	private String  encType;
	private String path;
	private MultipartRequest multi;
	
	
	public void setPath(HttpServletRequest request, String path){
		this.path=request.getServletContext().getRealPath(path);
	}
	public void setMax(int max){
		this.max=max;
	}
	public void setEncType(String type){
		this.encType=type;
	}
	public void setMulti(HttpServletRequest request){
		try {
			multi=new MultipartRequest(request, path, max, "euc-kr", new DefaultFileRenamePolicy());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public MultipartRequest getMulti() {
		return multi;
	}
	public String getUser() {
		return multi.getParameter("user");
	}
	public String getTitle() {
		return multi.getParameter("title");
	}
	public String getUpFileInfo() {
		Enumeration enumer=multi.getFileNames();
		String result="";
		while(enumer.hasMoreElements()){
			String name=(String)enumer.nextElement();
			result = multi.getFilesystemName(name);
		}
		return result;
	}
	
}

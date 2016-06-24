package mybean;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.FactoryCommand;


public class BasicBean {
	
	String path;
	int max;
	String enctype;
	MultipartRequest multi;
	
	private static BasicBean instance = new BasicBean();
	public static BasicBean newInstance(){
		return instance;
	}

	public void setPath(HttpServletRequest request, String path){
		this.path = request.getServletContext().getRealPath(path);
	}
	
	public String getPath(){
		return path;
	}

	public void setMax(int max) {
		this.max = max;
	}

	public void setEncType(String enctype) {
		this.enctype = enctype;
	}

	public void setMulti(HttpServletRequest request) {
		try {
			multi = new MultipartRequest(request, path, max, enctype, new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public MultipartRequest getMulti(){
		return multi;
	}
	
	public String getUpFileInfo(){
		Enumeration enumer = multi.getFileNames();
		String result="";
		while(enumer.hasMoreElements()){
			String name = (String)enumer.nextElement();
			result=multi.getFilesystemName(name);
			File f = multi.getFile(name);
			//f.delete();
		}
		
		return result;
	}
}

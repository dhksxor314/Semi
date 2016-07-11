/*
 *  작성자 : 전현영
 *  설명 : 수업시간에 했던 것을 필요한 부분과 필요없는 부분들을 정리하여 만든 클래스
 *   
 */

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
	
	//이 클래스를 두번 생성할 시에 에러가 생기므로 싱글턴 패턴으로 생성
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
	//설정한 multipartrequest를 받아오기 위해 getMulti()를 생성
	public MultipartRequest getMulti(){
		return multi;
	}
	
	//사진을 저장하기 위해서 이름만을 사용하므로 이름만 리턴 할 수 있도록 수정
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

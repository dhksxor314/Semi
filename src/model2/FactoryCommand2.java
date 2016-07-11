package model2;

import model.Command;

public class FactoryCommand2 {//인스턴스 생성을 대신해줄 클래스
	private FactoryCommand2(){}
	private static FactoryCommand2 instance = new FactoryCommand2();
	public static FactoryCommand2 newInstance(){
		return instance;
	}
	
	public Command createCommand(String cmd){
		
		if(cmd.equals("sign_up")){
			return new MoveSignUp();
		}
		else if(cmd.equals("findId")){
			return new MoveFindId();
		}
		else if(cmd.equals("findPw")){
			return new MoveFindPw();
		}
		else if(cmd.equals("notice_read")){
			return new MoveNoticeRead();
		}
		else if(cmd.equals("notice")){
			return new MoveNotice();
		}
		else if(cmd.equals("logout")){
			return new LogoutCommand();
		}
		else if(cmd.equals("Member_Activity")){
			return new OpenActivity();
		}
		else if(cmd.equals("Member_Point")){
			return new OpenPoint();
		}
		else if(cmd.equals("speech_insert")){
			return new MoveSpeechInsert();
		}
		else if(cmd.equals("FindSpeaker")){
			return new MoveFindSpeaker();
		}
		else if(cmd.equals("FindPlace")){
			return new MoveFindPlace();
		}

		return null;
	}
}

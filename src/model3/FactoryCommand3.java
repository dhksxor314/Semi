package model3;

import model.CartCommand;
import model3.Command;
import model3.SectionCommand;

public class FactoryCommand3 {// 인스턴스 생성을 대신해줄 클래스
	private FactoryCommand3() {
	}

	private static FactoryCommand3 instance = new FactoryCommand3();

	public static FactoryCommand3 newInstance() {
		return instance;
	}

	public Command createCommand(String cmd) {

		if (cmd.equals("basicinfo")) {
			return new BasicinfoCommand();
		} else if (cmd.equals("section")) {
			return new SectionCommand();
		} else if (cmd.equals("create")) {
			return new CreateCommand();
		} else if (cmd.equals("wisdomer")) {
			return new WisdomerCommand();
		} else if (cmd.equals("requestreview")) {
			return new RequestreviewCommand();
		} else if (cmd.equals("createproc")) {
			return new CreateprocCommand();
		} else if (cmd.equals("joinlist")) {
			return new JoinlistCommand();
		} else if (cmd.equals("info")) {
			return new InfoCommand();
		} else if (cmd.equals("join")) {
			return new JoinCommand();
		} else if (cmd.equals("update")) {
			return new UpdateCommand();
		} else if (cmd.equals("join2")) {
			return new Join2Command();
		} else if (cmd.equals("join3")) {
			return new Join3Command();
		} else if (cmd.equals("payment")) {
			return new PaymentCommand();
		}else if (cmd.equals("paymentproc")) {
			return new PaymentprocCommand();
		}else if (cmd.equals("joinsuccess")) {
			return new JoinsuccessCommand();
		}else if(cmd.equals("cart")){
			return new CartCommand();
		}
		
		return null;
	}
}

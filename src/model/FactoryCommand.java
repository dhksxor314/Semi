package model;

public class FactoryCommand {// 인스턴스 생성을 대신해줄 클래스
	private FactoryCommand() {
	}

	private static FactoryCommand instance = new FactoryCommand();

	public static FactoryCommand newInstance() {
		return instance;
	}

	public Command createCommand(String cmd) {

		if (cmd.equals("place_insert")) {
			return new PlaceInsertCommand();
		} else if (cmd.equals("delete")) {
			return new DeleteCommand();
		} else if (cmd.equals("login")) {
			return new LoginCommand();
		} else if (cmd.equals("place_update")) {
			return new PlaceUpdateCommand();
		} else if (cmd.equals("go_placeUpdate")) {
			return new GoPlaceUpdate();
		} else if (cmd.equals("paging")) {
			return new PagingCommand();
		} else if (cmd.equals("search")) {
			return new SearchCommand();
		} else if (cmd.equals("findId")) {
			return new FindIdCommand();
		} else if (cmd.equals("findPw")) {
			return new FindPwCommand();
		} else if (cmd.equals("sign")) {
			return new SignUpCommand();
		} else if (cmd.equals("notice_insert")) {
			return new NoticeInsertCommand();
		} else if (cmd.equals("goNoticeUpdate")) {
			return new GoNoticeUpdateCommand();
		} else if (cmd.equals("notice_update")) {
			return new NoticeUpdateCommand();
		} else if (cmd.equals("goNoticeInsert")) {
			return new GoNoticeInsertCommand();
		} else if (cmd.equals("manage")) {
			return new GoManagePage();
		}

		else if (cmd.equals("grant_meeting")) {
			return new GrantMeetingCommand();
		} else if (cmd.equals("reject_meeting")) {
			return new RejectMeetingCommand();
		} else if (cmd.equals("Speech_List")) {
			return new GoSpeechList();
		} else if (cmd.equals("Meeting_List")) {
			return new GoMeetingList();
		} else if (cmd.equals("Meeting_Grant")) {
			return new GoMeetingGrant();
		} else if (cmd.equals("Member_List")) {
			return new GoMemberList();
		} else if (cmd.equals("Place_List")) {
			return new GoPlaceList();
		} else if (cmd.equals("Meeting_Grant_Read")) {
			return new GoMeetingGrantRead();
		} else if (cmd.equals("Speaker_Grant_Read")) {
			return new GoSpeakerGrantRead();
		} else if (cmd.equals("Speaker_Grant")) {
			return new GoSpeakerGrant();
		} else if (cmd.equals("Speaker_List")) {
			return new GoSpeakerList();
		} else if (cmd.equals("Speaker_Grant_Read")) {
			return new GoSpeakerGrantRead();
		} else if (cmd.equals("Place_Insert")) {
			return new GoPlaceInsert();

		} else if (cmd.equals("speech")) {
			return new ActiveSpeechCommand();
		} else if (cmd.equals("delete_speech")) {
			return new DeleteSpeechCommand();
		} else if (cmd.equals("meeting")) {
			return new ActiveMeetingCommand();
		} else if (cmd.equals("delete_meeting")) {
			return new DeleteMeetingCommand();
		} else if (cmd.equals("open")) {
			return new OpenCommand();
		} else if (cmd.equals("participant")) {
			return new ParticipantCommand();
		} else if (cmd.equals("delete_open")) {
			return new DeleteOpenCommand();
		} else if (cmd.equals("complete")) {
			return new CompleteCommand();
		} else if (cmd.equals("delete_complete")) {
			return new DeleteCompleteCommand();
		} else if (cmd.equals("cart")) {
			return new CartCommand();
		} else if (cmd.equals("delete_cart")) {
			return new DeleteCartCommand();
		} else if (cmd.equals("bookmark")) {
			return new BookmarkCommand();
		} else if (cmd.equals("delete_bookmark")) {
			return new DeleteBookmarkCommand();
		} else if (cmd.equals("message")) {
			return new MessageCommand();
		} else if (cmd.equals("message_board")) {
			return new MessageBoardCommand();
		} else if (cmd.equals("delete_message_board")) {
			return new DeleteMessageBoardCommand();
		} else if (cmd.equals("point")) {
			return new PointCommand();
		} else if (cmd.equals("payment")) {
			return new PaymentCommand();
		} else if (cmd.equals("delete_payment")) {
			return new DeletePaymentCommand();
		} else if (cmd.equals("update")) {
			return new UpdateCommand();
		} else if (cmd.equals("update_member")) {
			return new UpdateMemberCommand();
		} else if (cmd.equals("leave")) {
			return new LeaveCommand();
		} else if (cmd.equals("delete_leave")) {
			return new DeleteLeaveCommand();
		} else if (cmd.equals("speaker_open")) {
			return new SpeakerOpenCommand();
		} else if (cmd.equals("speaker_participant")) {
			return new SpeakerParticipantCommand();
		} else if (cmd.equals("speaker_complete")) {
			return new SpeakerCompleteCommand();
		} else if (cmd.equals("speaker_update")) {
			return new SpeakerUpdateCommand();
		} else if (cmd.equals("speaker_update_proc")) {
			return new SpeakerUpdateProcCommand();
		} else if (cmd.equals("speaker_leave")) {
			return new SpeakerLeaveCommand();
		}

		return null;
	}
}

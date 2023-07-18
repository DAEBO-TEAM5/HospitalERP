package hospital.utils;

import java.util.Properties;
import java.util.Random;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public final class NaverMailSend {

	private final String host = "smtp.naver.com";		  // SMTP 서버명
	private final String user = "soft8991@naver.com"; 	  // 발신자의 이메일 계정
	private final String password = "EBBK1V8RSRCW";     // 발신자의 SMTP 패스워드 
	
	public String sendEmail(String to) throws Exception {

		String authenCode = null;
		
		/* Property 객체에 SMTP 서버 정보 설정 */
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "465");		// SMTP 포트 
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		/* SMTP 서버 정보와 사용자 정보를 기반으로 Session 클래스의 인스턴스를 생성*/
		Session session = Session.getDefaultInstance(props, new Authenticator() {
		    protected PasswordAuthentication getPasswordAuthentication() {
		        return new PasswordAuthentication(user, password);
		    }
		});
		
		/* Message 객체에 수신자와 내용, 제목의 메시지를 작성 */
		try {
            // 인증번호 생성
       	    authenCode = makeAuthenticationCode();
			
		    Message message = new MimeMessage(session);
		    // 발신자 설정
		    message.setFrom(new InternetAddress(user, "5Ing Hospital"));

		    // 수신자 메일주소 설정
		    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

		    // 메일제목 설정
		    message.setSubject("비밀번호 변경 인증코드 메일입니다.");

		    // 메일 내용 설정
		    message.setText("비밀번호 변경 인증코드는 [ "+authenCode+ " ] 입니다.");
		    // Send the message
		    Transport.send(message);
		} catch (MessagingException e) {
		    e.printStackTrace();
		}
		
		return authenCode;
	}
	
	/** 인증코드 생성 메서드 */
	private String makeAuthenticationCode() throws Exception {
		
		int pwdLength = 8;
		final char[] pwdTable = { '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' };
		
		// System.currentTimeMillis(): 중복 방지 처리
		Random ran = new Random(System.currentTimeMillis());
		
		StringBuffer bf = new StringBuffer();
		for(int i=0; i<pwdLength; i++) {
			bf.append(pwdTable[ran.nextInt(pwdTable.length)]);
			
		}
		
		return bf.toString();
	}
	
}
package in.bushansirgur.vis.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordEncode {

	public static BCryptPasswordEncoder encode(){
		return new BCryptPasswordEncoder();
	}
	
	public static boolean checkPassword(String oldPassword, String encryptedPassword) {
		BCryptPasswordEncoder encoder = PasswordEncode.encode();
		if(encoder.matches(oldPassword, encryptedPassword)) {
			return true;
		}
		return false;
	}
}

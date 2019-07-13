package net.koreate.api;

import lombok.Data;

@Data
public class KakaoUserInfo {

	String id;
	String email;
	String nickname;
	String image;
	public KakaoUserInfo(String id, String email, String nickname, String image) {
		this.id = id;
		this.email = email;
		this.nickname = nickname;
		this.image = image;
	}
	
	
	
}

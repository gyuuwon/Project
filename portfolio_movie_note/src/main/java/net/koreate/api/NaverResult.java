package net.koreate.api;

import lombok.Data;

@Data
public class NaverResult {

	String resultcode;
	String message;
	NaverUserInfo response;
	
}

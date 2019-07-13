package net.koreate.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.Gson;

import net.koreate.api.KakaoUserInfo;
import net.koreate.api.NaverResult;
import net.koreate.api.NaverUserInfo;
import net.koreate.service.LoginService;

@Controller
public class LoginController {

	@Inject
	LoginService service;
	
	@RequestMapping(value = "/login")
	public String naverLogin(Model model,HttpSession session) {
		
		String naverAuthUrl = service.getNaverAuthorizationUrl(session);
		String kakaoAuthUrl = service.getKakaoAuthorizationUrl(session);
		System.out.println("네이버 : "+naverAuthUrl);
		System.out.println("카카오 : "+kakaoAuthUrl);
		model.addAttribute("kakaoUrl",kakaoAuthUrl);
		model.addAttribute("naverUrl",naverAuthUrl);
		
		return "/login";
	}
	@RequestMapping(value = "/naver/naverCallback")
	public String naverCallback (Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {
		System.out.println("NaverCallBack");
		OAuth2AccessToken oauthToken;
		oauthToken = service.getNaverAccessToken(session, code, state);
		String apiResult = service.getUserProfile(oauthToken);
		System.out.println("apiResult : "+apiResult);
		
		Gson gson = new Gson();
		NaverResult naverResult = gson.fromJson(apiResult, NaverResult.class);
		System.out.println("naverResult : "+naverResult);
		NaverUserInfo user = naverResult.getResponse();
		session.setAttribute("naverUser", user);
		System.out.println(user);
		
		return "redirect:/main";
	}
	@RequestMapping(value = "/kakao/kakaoCallback")
	public String kakaoCallback(Model model,@RequestParam String code,HttpSession session) {
		JsonNode userInfo = service.getKakaoUserInfo(code);
	    
	    System.out.println("userInfo : "+userInfo);

	    String id = userInfo.get("id").toString();
	    String[] em = userInfo.get("kaccount_email").toString().split("\"");
	    String email = em[1];
	    String[] imageAddress = userInfo.get("properties").get("profile_image").toString().split("\"");
	    String image = imageAddress[1];
	    String[] nick = userInfo.get("properties").get("nickname").toString().split("\"");
	    String nickname = nick[1];

	    KakaoUserInfo user = new KakaoUserInfo(id,email,nickname,image);
	    session.setAttribute("kakaoUser", user);

	    return "redirect:/main";
	  }
}

package net.koreate.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

import net.koreate.api.NaverLoginApi;
@Service
public class LoginService {
	
	// 네이버 API 정보
	private final static String NCLIENT_ID = "pKZIdxpnCahiAhaLUUdF";
	private final static String NCLIENT_SECRET = "G8im9NnEqC";
	private final static String NREDIRECT_URI = "http://localhost:8080/naver/naverCallback";
	private final static String SESSION_STATE = "oauth_state";
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";

	// 카카오 API 정보
	private final static String KCLIENT_ID = "11f5ae3d78bdd2c1ca90dc3e48e0e93b";
	private final static String KREDIRECT_URI = "http://localhost:8080/kakao/kakaoCallback";
	
	// 네이버 API
	public String getNaverAuthorizationUrl(HttpSession session) {

		String state = generateRandomString();
		setSession(session,state); 
		
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(NCLIENT_ID)
				.apiSecret(NCLIENT_SECRET)
				.callback(NREDIRECT_URI)
				.state(state)
				.build(NaverLoginApi.instance());

		
		
		return oauthService.getAuthorizationUrl();
	}
	
	public OAuth2AccessToken getNaverAccessToken(HttpSession session, String code, String state) throws IOException{
		
		String sessionState = getSession(session);
		if(StringUtils.pathEquals(sessionState, state)) {
			OAuth20Service oauthService = new ServiceBuilder()
					.apiKey(NCLIENT_ID)
					.apiSecret(NCLIENT_SECRET)
					.callback(NREDIRECT_URI)
					.state(state)
					.build(NaverLoginApi.instance());
			
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			return accessToken;
		}

		return null;
	}
	
	private String generateRandomString() {
		return UUID.randomUUID().toString();
		}
	private void setSession(HttpSession session,String state){
		session.setAttribute(SESSION_STATE, state);
		}
	private String getSession(HttpSession session){
		return (String) session.getAttribute(SESSION_STATE);
		}
	public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException{
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(NCLIENT_ID)
				.apiSecret(NCLIENT_SECRET)
				.callback(NREDIRECT_URI)
				.build(NaverLoginApi.instance());
		
		OAuthRequest request = new OAuthRequest(Verb.GET,PROFILE_API_URL,oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		
			
		return response.getBody();
	}
	
	
	 // 여기서부터 카카오 API
	 public String getKakaoAuthorizationUrl(HttpSession session) {
		 

		    String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?"
		        + "client_id=" + KCLIENT_ID + "&redirect_uri="
		        + KREDIRECT_URI + "&response_type=code";
		    return kakaoUrl;
		  }
	 public String getKakaoAccessToken(String autorize_code) {
		 

		    final String RequestUrl = "https://kauth.kakao.com/oauth/token";
		    final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		    postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		    postParams.add(new BasicNameValuePair("client_id", KCLIENT_ID)); // REST API KEY
		    postParams.add(new BasicNameValuePair("redirect_uri", KREDIRECT_URI)); // 리다이렉트 URI
		    postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정 중 얻은 code 값

		    final HttpClient client = HttpClientBuilder.create().build();
		    final HttpPost post = new HttpPost(RequestUrl);
		    JsonNode returnNode = null;

		    try {

		      post.setEntity(new UrlEncodedFormEntity(postParams));
		      final HttpResponse response = client.execute(post);
		      final int responseCode = response.getStatusLine().getStatusCode();
		      
		      System.out.println("responseCode : " +responseCode);

		      // JSON 형태 반환값 처리
		      ObjectMapper mapper = new ObjectMapper();
		      returnNode = mapper.readTree(response.getEntity().getContent());
		    } catch (Exception e) {e.printStackTrace();} 
		    return returnNode.get("access_token").toString();
		  }
	 public JsonNode getKakaoUserInfo(String autorize_code) {

		    final String RequestUrl = "https://kapi.kakao.com/v1/user/me";
		    final HttpClient client = HttpClientBuilder.create().build();
		    final HttpPost post = new HttpPost(RequestUrl);
		    String accessToken = getKakaoAccessToken(autorize_code);
		    post.addHeader("Authorization", "Bearer " + accessToken);
		    JsonNode returnNode = null;
		    try {
		      final HttpResponse response = client.execute(post);
		      final int responseCode = response.getStatusLine().getStatusCode();
		      System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
		      System.out.println("Response Code : " + responseCode);
		      ObjectMapper mapper = new ObjectMapper();
		      returnNode = mapper.readTree(response.getEntity().getContent());
		    } catch (Exception e) {
		      e.printStackTrace();
		  }
		    return returnNode;
	 }
}

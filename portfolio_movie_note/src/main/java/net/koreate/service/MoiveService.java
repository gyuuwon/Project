package net.koreate.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import net.koreate.util.Criteria;
import net.koreate.util.PageMaker;
import net.koreate.vo.MovieDetailVO;
import net.koreate.vo.MovieVO;


@Service
public class MoiveService {
	
	private static String clientID = "pKZIdxpnCahiAhaLUUdF";
	private static String clientSecret = "G8im9NnEqC";
	
	public MovieVO searchMovie(String query, int display){
		StringBuffer response = null;
		 try {
	            String text = URLEncoder.encode(query, "UTF-8");
	            String apiURL = "https://openapi.naver.com/v1/search/movie.json?query="+ text+"&display="+display; // json 결과
	            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("X-Naver-Client-Id", clientID);
	            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }
	            String inputLine;
	            response = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	                response.append(inputLine);
	            }
	            br.close();
	        } catch (Exception e) {
	            System.out.println(e);
	        }
		 System.out.println(response.toString());
		 Gson gson = new Gson();
         MovieVO vo =  gson.fromJson(response.toString(), MovieVO.class);
		return vo;
	}

	public PageMaker getPageMaker(String query, int page) throws Exception{
		Criteria cri = new Criteria(page,10);
		MovieVO vo = searchMovie(query,100);
		int totalCount =  vo.getTotal();
		System.out.println("totalCount : "+totalCount);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		return pageMaker;
	}
	public List<MovieDetailVO> listMovieDetailVO(MovieVO vo, PageMaker pageMaker){
		List<MovieDetailVO> list = new ArrayList<>();
		int pageStart = pageMaker.getCri().getPageStart();
		
		int perPageNum = pageMaker.getCri().getPerPageNum();
		
		int endPage = pageStart+(perPageNum-1);
		
		int maxPage =  vo.getTotal()-1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		System.out.println("pageStart : "+pageStart);
		System.out.println("perPageNum : " + perPageNum);
		List<MovieDetailVO> allList = vo.getItems();
		for(int i=pageStart; i <=endPage; i++) {
			list.add(allList.get(i));
		}
		
		/*java.util.Collections.sort(list, new Comparator<MovieDetailVO>() {
			@Override
			public int compare(MovieDetailVO o1, MovieDetailVO o2) {
				return o1.getUserRating().compareTo(o2.getUserRating());
			}
		});*/
		
		
		
		return list; 
	}
	

}

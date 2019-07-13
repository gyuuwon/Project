package net.koreate.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.koreate.service.MoiveService;
import net.koreate.service.LoginService;
import net.koreate.util.PageMaker;
import net.koreate.vo.MovieDetailVO;
import net.koreate.vo.MovieVO;

@Controller
public class HomeController {
	
	@Inject
	MoiveService ms;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}

	@GetMapping("/main")
	public void main() {}
	
	@GetMapping("/loginForm")
	public void loginForm() {}
	
	@GetMapping("detailView")
	public String detailViewGET() {
		return "detailView";
	}
	@GetMapping("/register")
	public void register() {}
	
	
	@GetMapping("/query")
	@ResponseBody
	public MovieVO query(String query) {
		
		MovieVO vo = ms.searchMovie(query,100);
		
		System.out.println(vo);
		
		return vo;
	}
	
	@GetMapping("/query/{title}/{page}")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> listPage(
			@PathVariable("title") String query,
			@PathVariable("page") int page){
		ResponseEntity<Map<String,Object>> entity = null;
		
		try {
			Map<String,Object> map = new HashMap<>();
			PageMaker pageMaker = ms.getPageMaker(query,page);
			MovieVO vo = ms.searchMovie(query,100);
			map.put("pageMaker", pageMaker);
			map.put("list", ms.listMovieDetailVO(vo, pageMaker));
			
			entity = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}

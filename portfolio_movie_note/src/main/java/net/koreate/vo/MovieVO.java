package net.koreate.vo;

import java.util.List;

import lombok.Data;

@Data
public class MovieVO {
	String lastBuildDate;
	int total;
	int start;
	int display;
	
	List<MovieDetailVO>  items;
}

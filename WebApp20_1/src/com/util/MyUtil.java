package com.util;

public class MyUtil
{
	// 전체 페이지 수를 구하는 메소드
	// numPerPage : 한 페이지에 표시할 데이터(게시물)의 수
	// dataCount : 전체 데이터(게시물) 수
	public int getPageCount(int numPerPage, int dataCount)
	{
		int pageCount = 0;
		
		pageCount = dataCount/numPerPage;
		
		if (dataCount%numPerPage != 0)
			pageCount++;
		
		return pageCount;
	}
	
	// 페이징 처리 기능 메소드
	// currentPage : 현재 표시할 메소드
	// totalPage : 전체 페이지수
	// listUrl : 링크를 설정할 url
	public String pageIndexList(int currentPage, int totalPage, int listUrl)
	{
		// 실제 페이징을 저장할 String 변수
		StringBuffer strList = new StringBuffer();
		
		int numPerBlock = 10;
		// 페이징 처리시 하단에 보여줄 리스트 수 지정
		
		int currentPageSetup;
		// 현재 페이지
		
		int page;
		int n;
		
		// 페이징 처리가 별도로 필요하지 않은 경우
		if (currentPage == 0)
		{
			return "";
		}
		
		//링크를 설정할 때 URL 에 대한 선가공 처리
		
		
		return strList.toString();
	}
	
}

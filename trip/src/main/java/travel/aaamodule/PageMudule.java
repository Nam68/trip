package travel.aaamodule;

public class PageMudule {
	
	private String previous = "Privious";
	private String next = "Next";
	
	public PageMudule() {
		
	}
	
	public String getPageNav(int cp, int total, int listSize, int pageSize, String href) {
		int pageTotal = getPageTotal(total, listSize);
		int start = getPageStart(cp, pageSize);
		int last = getPageLast(cp, pageSize, pageTotal);
		
		StringBuffer sb = new StringBuffer();
		defaultPageNav(start, pageTotal, last, sb);
		clickEventWithoutParam(start, pageSize, href, sb);
		
		return sb.toString();
	}
	
	public String getPageNav(int cp, int total, int listSize, int pageSize, String paramName, int param, String href) {
		int pageTotal = getPageTotal(total, listSize);
		int start = getPageStart(cp, pageSize);
		int last = getPageLast(cp, pageSize, pageTotal);
		
		StringBuffer sb = new StringBuffer();
		defaultPageNav(start, pageTotal, last, sb);
		clickEventWithParam(start, pageSize, paramName, param, href, sb);
		
		return sb.toString();
	}
	
	private void clickEventWithoutParam(int start, int pageSize, String href, StringBuffer sb) {
		sb.append("<script>");
		sb.append("$('.page-link').click(function(){ var cp = $(this).text().trim();");
		sb.append("if(cp=='"+previous+"') { cp = $('.pagination').find('a:eq(1)').text().trim() "+(start-pageSize)+"; }");
		sb.append("else if(cp=='"+next+"') { cp = Number($('.pagination').find('a:eq("+pageSize+")').text().trim()) +1;  }");
		sb.append("page_move_with_param('"+href+"', 'cp', cp);");
		sb.append("});");
		sb.append("</script>");
	}
	
	private void clickEventWithParam(int start, int pageSize, String paramName, int param, String href, StringBuffer sb) {
		sb.append("<script>");
		sb.append("$('.page-link').click(function(){ var cp = $(this).text().trim();");
		sb.append("if(cp=='"+previous+"') { cp = $('.pagination').find('a:eq(1)').text().trim() "+(start-pageSize)+"; }");
		sb.append("else if(cp=='"+next+"') { cp = Number($('.pagination').find('a:eq("+pageSize+")').text().trim()) +1;  }");
		sb.append("var names = new Array();");
		sb.append("names.push('cp');");
		sb.append("names.push('"+paramName+"');");
		sb.append("var params = new Array();");
		sb.append("params.push(cp);");
		sb.append("params.push("+param+");");
		sb.append("page_move_with_param('"+href+"', names, params);");
		sb.append("});");
		sb.append("</script>");
	}
	
	private void defaultPageNav(int start, int pageTotal, int last, StringBuffer sb) {
		boolean previousBtn = getPreviousBtn(start);
		boolean nextBtn = getNextBtn(pageTotal, last);
		
		// 페이지 시작
		sb.append("<nav aria-label=\"...\" class=\"nav justify-content-center\">");
		sb.append("<ul class=\"pagination\">");
		// 앞으로 가기 버튼
		sb.append("<li class=\"page-item ");
		if (!previousBtn)
			sb.append("disabled");
		sb.append("\"><a class=\"page-link\" href=\"#\">" + previous + "</a></li>");
		// 숫자 버튼
		for (int i = start; i <= last; i++) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href=\"#\">" + i + "</a></li>");
		}
		// 뒤로가기 버튼
		sb.append("<li class=\"page-item ");
		if (!nextBtn)
			sb.append("disabled");
		sb.append("\"><a class=\"page-link\" href=\"#\">" + next + "</a></li>");
		// 페이지 끝
		sb.append("</ul>");
		sb.append("</nav>");
	}
	
	private int getPageTotal(int total, int listSize) {
		int result = total/listSize+1;
		if(total%listSize==0) result--;
		return result;
	}
	
	private int getPageStart(int cp, int pageSize) {
		int result = cp/pageSize;
		if(cp%pageSize==0) result--;
		result = result *pageSize +1;
		return result;
	}
	
	private int getPageLast(int cp, int pageSize, int pageTotal) {
		int result = cp/pageSize+1;
		if(cp%pageSize==0) result--;
		result = result*5>pageTotal? pageTotal:result*5;
		return result;
	}
	
	private boolean getPreviousBtn(int start) {
		if(start != 1) return true;
		else return false;
	}
	
	private boolean getNextBtn(int pageTotal, int last) {
		if(last < pageTotal) return true;
		else return false;
	}
	
}

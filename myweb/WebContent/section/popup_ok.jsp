<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/* Cookie cks[] = request.getCookies();
	System.out.println("cks.length : " + cks.length);

	String cbs[] = request.getParameterValues("cb");
	boolean isCheckNoticeNoSee = false;
	if(cbs != null){ // 체크 되어 있는 것이 하나라도 존재할 경우
		for(int i = 0 ; i < cbs.length ; i++){
			if(cbs[i].equals("isCheckNoticeNoSee")){
				isCheckNoticeNoSee = true;
			}
		}
	}
	
	if(isCheckNoticeNoSee){ // 체크 한경우
		Cookie ckNotice = new Cookie("isCheckNoticeNoSee","true");
		ckNotice.setMaxAge(5);
		response.addCookie(ckNotice);
	} */
	
	String popupck = request.getParameter("popupck");
	
	if(popupck != null && popupck.equals("on")){ // 체크 했을 시
		Cookie ck = new Cookie("popupck","on");
		ck.setMaxAge(60*60*24); // 하루 24시간
		response.addCookie(ck);
	}
%>
<script>
	window.self.close();
</script>

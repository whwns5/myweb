<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdto" class="yong.bbs.BbsDTO"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="yong.bbs.BbsDAO"/>
<%
	int result = bdao.bbsWrite(bdto);
	
	if(result > 0){
%>
		<script>
			window.alert('게시글이 등록 되었습니다.');
			location.href = '/myweb/section/bbs/bbsList.jsp';
		</script>
<%		
	} else if (result == -1) {
%>
		<script>
			window.alert('게시글이 등록중 오류가 발생했습니다.');
			location.href = '/myweb/section/bbs/bbsList.jsp';
		</script>
<%		
	} else {
%>
		<script>
			window.alert('게시글 등록에 실패 하였습니다.');
			location.href = '/myweb/section/bbs/bbsList.jsp';
		</script>
<%		
	}
%>
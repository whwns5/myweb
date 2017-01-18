<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdao_t" class="yong.bbs.BbsDAO_t"></jsp:useBean>
<%
	String cp = request.getParameter("cp");
	String idx_s = request.getParameter("idx");
	int idx = 0;
	if(idx_s != null){
		idx = Integer.parseInt(idx_s);
	}
	
	int result = bdao_t.bbsDelete(idx);
	String msg = result > 0 ? "게시글 삭제 완료 !" : "게시글 삭제 실패 !";
%>
<script>
	window.alert('<%=msg%>');
	location.href = '/myweb/section/bbs_t/bbsList_t.jsp?cp=<%=cp%>';
</script>
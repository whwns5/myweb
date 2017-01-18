<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdto_t" class="yong.bbs.BbsDTO_t" scope="page"/>
<jsp:setProperty property="*" name="bdto_t"/>
<jsp:useBean id="bdao_t" class="yong.bbs.BbsDAO_t" scope="session"/>
<%
	int result = bdao_t.bbsReWrite(bdto_t);
	String msg = result > 0 ? "답글 등록완료 !" : "답글 등록 실패 !";
%>
<script>
	window.alert('<%=msg%>');
	location.href = '/myweb/section/bbs_t/bbsList_t.jsp';
</script>
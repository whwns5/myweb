<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="wf" class="yong.wf.WebFolderDAO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/index.css?ver=1">
<link rel="stylesheet" type="text/css" href="/myweb/css/section/wf/webFolder2.css?ver=1">
<style>

</style>
<script>
	function openUpload() {
		window.open('/myweb/section/wf/upload.jsp', 'upload', 'width=300,height=200');
		
	}
	function showCreateFolder() {
		var temp = document.getElementById('tx_folderName');
		if(temp == null){
			var listbody = document.getElementById('listbody');
			
			var htmlString = '';
			htmlString += '<tr>';
			htmlString += 	'<td><img src="/myweb/img/webfolder/folder.gif"></td>';
			htmlString += 	'<td colspan="2"><form name="createFolder_ok" action="/myweb/section/wf/createFolder_ok.jsp">';
			htmlString += 		'<input type="text" id="tx_folderName" name="folderName" placeholder="새폴더">';
			htmlString += 		'<input class="submit-button2" type="submit" value="생성">';
			htmlString += 		'<input class="submit-button2" type="button" value="취소" onclick="cancelCreateFolder();"></form>';
			htmlString += 	'</td>';
			htmlString += '</tr>';
			listbody.innerHTML += htmlString;
		} 
	}
	function cancelCreateFolder() {
		var listbody = document.getElementById('listbody');
		listbody.removeChild(listbody.lastChild);
		
	}
	function deleteFile(index){
		var result = window.confirm('정말로 삭제 하시겠습니까 ?');
		if(result){
			var deleteFileName = document.getElementById('hd_deleteFileName_'+index).value;
			location.href = '/myweb/section/wf/fileDelete_ok.jsp?deleteFileName='+deleteFileName;
		}
	}
</script>
</head>
<%
	String sid = (String) session.getAttribute("login_id");
	if(sid == null){
%>
		<script>
			window.alert('로그인후 이용가능한 서비스입니다.');
			location.href = '/myweb/index.jsp';
		</script>
<%
		return;
	}
	
	wf.setUser(sid);
	wf.userFolderExists();
	
	String cr = request.getParameter("cr");
	if(cr == null || cr.equals("")){
		cr = sid;
	}
	wf.setCrPath(cr);
%>
<body>
	<%@ include file="/header/header.jsp" %>
	<section>
		<article>
			<h2><%=sid %> 님 Y드라이브</h2>
			<fieldset>
				<legend>기본 사용 정보</legend>
				<ul>
					<li><label>총용량</label>
						<meter value="<%=wf.getTotalSize() %>" max="<%=wf.getTotalSize() %>" min="0"></meter>
					</li>
					<li><label>사용용량</label>
						<meter value="<%=wf.getUsedSize() %>" max="<%=wf.getTotalSize() %>" min="0"></meter>
					</li>
					<li><label>남은용량</label>
						<meter value="<%=wf.getFreeSize() %>" max="<%=wf.getTotalSize() %>" min="0"></meter>
					</li>
				</ul>
			</fieldset>
		</article>
		<article>
			<fieldset>
				<legend>탐색기</legend>
				<div class="submit-container">
 					<input class="submit-button" type="button" value="파일올리기" onclick="openUpload();">
					<input class="submit-button" type="button" value="폴더만들기" onclick="showCreateFolder();">
				</div>
				
				<table>
					<thead>
						<tr>
							<th>분류</th>
							<th colspan="2">파일명 및 폴더명</th>
						</tr>
					</thead>
					<tbody id="listbody">
						<%
							if( !(wf.getCrPath().equals(wf.getUser())) ){
								int pos = wf.getCrPath().lastIndexOf("/");
								String up_cp = wf.getCrPath().substring(0, pos);
						%>		
								<tr>
									<td><img src="/myweb/img/webfolder/back.gif"></td>
									<td colspan="2" align="left">
										<a href="/myweb/section/wf/webFolder2.jsp?cr=<%=up_cp%>">상위로 ...</a>
									</td>
	 							</tr>
						<%
							}
							File f = new File(wf.USERS_HOME + "/" + wf.getCrPath());
							File files[] = f.listFiles();
							
							if(files == null || files.length == 0){
						%>			
								<tr>
									<td colspan="3" align="center">등록된 파일 및 폴더가 없습니다.</td>
								</tr>
						<%
							} else {
								for(int i = 0 ; i < files.length ; i++){
						%>		
									<tr>
										<td><%=files[i].isFile() ? "<img src='/myweb/img/webfolder/unknown.gif'>" : "<img src='/myweb/img/webfolder/folder.gif'>" %></td>
										<td>
						<%
											if(files[i].isFile()){
						%>		
												<a href="/myweb/section/wf/upload/<%=wf.getCrPath()%>/<%=files[i].getName() %>"><%=files[i].getName() %></a>
						<%				
											} else {
						%>	
												<a href="/myweb/section/wf/webFolder2.jsp?cr=<%=wf.getCrPath()%>/<%=files[i].getName()%>">
												<%=files[i].getName() %>
												</a>
						<%
											}
						%>					
										</td>
										<td>
										<input type="hidden" id="hd_deleteFileName_<%=i%>" value="<%=files[i].getName()%>">
										<a href="javascript:deleteFile(<%=i%>);">삭제</a>
										</td>
									</tr>
						<%	
								}
							}
						%>
					</tbody>
				</table>		
			</fieldset>
		</article>
	</section>
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>
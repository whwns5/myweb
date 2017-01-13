<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="upload" action="upload_ok.jsp" method="post" enctype="multipart/form-data">
	<fieldset>
		<legend>파일 올리기</legend>
		파일명 : <input type="file" name="upload">
		<input type="submit" value="올리기">
	</fieldset>
</form>
</body>
</html>
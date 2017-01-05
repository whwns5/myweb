<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/index.css">
</head>
<body>

	<%@ include file="/header/header.jsp"%>

	<section>
		<article>
			<h2>beanTest_ok.jsp</h2>
			<jsp:useBean id="btest" class="yong.bean.BeanTest" />
			<jsp:setProperty name="btest" property="name" value="홍길동" />
			<jsp:setProperty name="btest" property="age" value="20" />

			<h3>
				이름 :
				<jsp:getProperty name="btest" property="name" /></h3>
			<h3>
				이름 :
				<jsp:getProperty name="btest" property="age" /></h3>
		</article>
		<article>
			<h2>beanTest_ok_2.jsp</h2>
			
			<%
				/*
				String name = request.getParameter("name");
				String age_s = request.getParameter("age");
				int age = Integer.parseInt(age_s);
				String addr = request.getParameter("addr");
				String tel = request.getParameter("tel");
				*/ 
				// useBean 경우 form 의 이름과 맴버변수 명이 같을 경우 생략 가능
				// 모두 같다면 * 로 한번에도 가능
				
				//request.setCharacterEncoding("UTF-8");
			
			%>
			<jsp:useBean id="btest2" class="yong.bean.BeanTest" />
			<jsp:setProperty property="*" name="btest2" />
			
			
			<table>
				<tr>
					<th>이름 :</th>
					<td><jsp:getProperty property="name" name="btest2" /></td>
				</tr>
				<tr>
					<th>나이 :</th>
					<td><jsp:getProperty property="age" name="btest2" /></td>
				</tr>
				<tr>
					<th>주소 :</th>
					<td><jsp:getProperty property="addr" name="btest2" /></td>
				</tr>
				<tr>
					<th>전화 :</th>
					<td><jsp:getProperty property="tel" name="btest2" /></td>
				</tr>
				<tr>
					<th>d :</th>
					<td><jsp:getProperty property="d" name="btest2" /></td>
				</tr>
			</table>
		</article>
	</section>

	<%@ include file="/footer/footer.jsp"%>
</body>
</html>
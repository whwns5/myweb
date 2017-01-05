<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>이것은 둘쨋날 만든 jsp 페이지</h2>
	<!-- 이것은 HTML 주석 HTML의 모든것을 다 쓸수 있어요~ -->
	
	<%
		// 이것은 스크립트 릿 영역입니다. service 메소드안에 삽입이되어 번역됨.
		/* 여러줄 주석 */
		/** 문서화 주석 */
		System.out.println("이것은 jsp에서 작성된 문자열~");
		// out : jsp 에서 제공하는 기본 출력 객체 (PrintWriter의 기본 객체)
		out.println("<h3>이것은 jsp에서 작성된 문자열</h3>");
		// 번역 순서 : 자바코드 -> 자바스크립트 -> css -> html
		String str = "jsp"; // 지역 변수
		
		out.println("<h3>str의 값: " + str + "</h3>" );
		
	%>

	<!-- 
		403:보안된 지점에 접근할때
		404:페이지 없음 
		500:서버측 에러 (오타)
	-->
	<h3>str의 값:<%=str%></h3>
	<!--  %= 는 out.println() 과 같다. -->
	
	<%! 
		// 이것은 선언부 영역입니다. class 내부안에 삽입되어 번역됨.
		String str = "java"; 
		public int getSum(int a, int b){
			return a + b;
		}
	%>
	
	<%
		out.println("<h3>3+5=" + getSum(3, 5) + "</h3>");
		out.println("<h3>str의 값: " + str + "</h3>" );
		out.println("<h3>str의 값: " + this.str + "</h3>" );
	%>
	<h3>5+6=<%=getSum(5, 6)%></h3>
	
	<%
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1;
		int day = now.get(Calendar.DATE);
		
		out.println("<h3>" + year + "년 " + month + "월 " + day + "일" + "</h3>");
	%>

</body>
</html>














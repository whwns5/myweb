package yong.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ScoreServlet extends HttpServlet{
	
	public ScoreServlet(){
		
	}
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
	}
	
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("1");
		super.service(arg0, arg1);
	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		super.destroy();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("2");
		userProcess(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("3");
		userProcess(req, resp);
	}
	
	protected void userProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("4");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		String docStr = "";
		
		docStr += "<html>"
					+ "<head>"
					+ "<title>Insert title here</title>"
					+ "<script type=\"text/javascript\">"
					+ 	"function showResult() {"
					+ 		"var resultStr = '';"
					+ 		"var kor = parseInt(document.fm.input_kor.value);"
					+ 		"var eng = parseInt(document.fm.input_eng.value);"
					+ 		"var mat = parseInt(document.fm.input_mat.value);"
					
					+ 		"resultStr += '국어 : ' + kor;"
					+ 		"resultStr += '\\n영어 : ' + eng;"
					+ 		"resultStr += '\\n수학 : ' + mat;"
					
					+		"var sum = kor + eng + mat;"
					+ 		"var avg = sum/3;"
					+ 		"resultStr += '\\n총점 : ' + sum;"
					+ 		"resultStr += '\\n평균 : ' + avg.toFixed(2);"
					
					+ 		"var grade = '';"
					
					+ 		"switch( parseInt(avg/10) ){"
					+ 		"case 10: case 9:"
					+ 			"grade = 'A';"
					+ 			"break;"
					+ 		"case 8:"
					+ 			"grade = 'B';"
					+ 			"break;"
					+ 		"case 7:"
					+ 			"grade = 'C';"
					+ 			"break;"
					+ 		"case 6:"
					+ 			"grade = 'D';"
					+ 			"break;"
					+ 		"default :"
					+ 			"grade = 'F';"
					+ 			"break;"
					+ 		"}"
					+ 		"resultStr += '\\n등급 : ' + grade;"

					+ 		"var result = '';"
					
					+ 		"if(kor > 40 && eng > 40 && mat > 40 && avg >= 60){"
					+ 			"result = '합격';"
					+ 		"}else{"
					+		 	"result = '불합격';"
					+ 		"}"
					
					+ 		"resultStr += '\\n결과 : ' + result;"
					+ 		"window.alert(resultStr);"
					+ 	"}"
					+ "</script>"
					+ "</head>"
					+ "<body>"
					+ 	"<form name=\"fm\">"
					+ 	"<table>"
					+ 		"<tr>"
					+ 			"<td colspan=\"2\">점수 입력</td>"
					+ 		"</tr>"
					+ 		"<tr>"
					+ 			"<td>국어</td>"
					+ 			"<td><input type=\"text\" size=\"10\" name=\"input_kor\"></td>"
					+ 		"</tr>"
					+ 		"<tr>"
					+ 			"<td>영어</td>"
					+ 			"<td><input type=\"text\" size=\"10\" name=\"input_eng\"></td>"
					+ 		"</tr>"
					+ 		"<tr>"
					+ 			"<td>수학</td>"
					+ 			"<td><input type=\"text\" size=\"10\" name=\"input_mat\"></td>"
					+ 		"</tr>"
					+ 		"<tr>"
					+ 			"<td colspan=\"2\"><input type=\"button\" value=\"결과보기\" onclick=\"showResult();\"><input type=\"reset\" value=\"지우기\"></td>"
					+ 		"</tr>"
					+ 	"</table>"
					+ 	"</form>"
					+ "</body>"
					+ "</html>";
		
		pw.println(docStr);
		
		pw.close();
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}

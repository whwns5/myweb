package yong.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

public class HelloServlet extends HttpServlet{
	
	@Override			// 요청 객체				 // 응답 객체
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userProcess(req, resp);
	}
	
	protected void userProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html><head><title>");
		pw.println("서블릿으로 만듬");
		pw.println("</title></head><body>");
		
		pw.println("<h2>Hello Servlet 처음 만든 서블릿 !</h2>");
		
		// 서버측 시간
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1;
		int day = now.get(Calendar.DATE);
		
		pw.println("<h2> " + year + "년 " + month + "월" + day + "일</h2>");
		
		pw.println("</body></html>");
		
		
		pw.close();
	}
}

package yong.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletLifeCycle extends HttpServlet{
	public ServletLifeCycle(){
		// 멤버 변수의 초기화
		System.out.println("1. 생성자 호출됨 !");
	
	}
	
	@Override
	public void init() throws ServletException {
		// 기능의 초기화
		System.out.println("2. init() 메서드");
	}
	
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
		// 실제 서비스를 제공해주는 메서드
		System.out.println("3. service() 메서드 수행됨 !!");
	}
	
	@Override
	public void destroy() {
		// 소멸자로서 사용되는 메서드 (서버가 꺼질때 호출)
		System.out.println("4. destory() 메서드 수행됨 !");
	}
}

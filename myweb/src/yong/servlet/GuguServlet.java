package yong.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GuguServlet
 */
@WebServlet("/GuguServlet")
public class GuguServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuguServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		guguProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		guguProcess(request, response);
	}
	
	public void guguProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		String docStr = "";
		
		docStr += "<html>";
		 docStr += "<head>";
		  docStr += "<title>Gugudan</title>";
		 docStr += "</head>";
		 docStr += "<body>";
		  docStr += "<table border = \"1\" >";
		  //docStr += "<table border = '1' >";
		  	for(int i = 1; i <= 9 ; i++){
		  		docStr += "<tr>";
		  		for(int j = 2; j <= 9 ; j++){
		  			docStr += "<td>" + j + " * " + i + " = " + (j*i) + "</td>";
		  		}
		  		docStr += "</tr>";
		  	}
		  docStr += "</table>";
		 docStr += "</body>"; 
		docStr += "</html>"; 
		
		pw.println(docStr);
		  
		pw.close();
	}

}

/* ==================
	Test1.java
=================== */

package com.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test1 extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	// 사용자의 http 프로토콜 요청이 GET 방식일 경우 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	// 사용자의 http 프로토콜 요청이 POST 방식을 경우 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	 
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		//*** 호출하는 주체와 장소 → 서블릿컨테이너.
		//*** 사용자가 요청하면 처리하는 곳 → web.xml
		
		
		// GET 방식이든 POST 방식이든
		// 어떤 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메소드
		
		
		// ①
		/*
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>" + "Test1.java"+ "</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<div>");
		pw.println("<h1>name: "+ "홍길동" + "</h1>");
		pw.println("<h1>age: "+ 19 + "</h1>");
		pw.println("</div>");
		pw.println("</body>");
		pw.println("</html>");
		*/
		
		// ② // **값을 상단에서 변수 처리**
		/*
		String name = "길현욱";
		int age = 21;
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
				
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>" + "Test1.java"+ "</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<div>");
		pw.println("<h1>name: "+ name + "</h1>");
		pw.println("<h1>age: "+ age + "</h1>");
		pw.println("</div>");
		pw.println("</body>");
		pw.println("</html>");
		*/
		
		// ③
		/*
		이전의 처리는,
			돌아가고 있는 구조라면 다른 값으로 바꾸고 싶어도(유지보수) 다시 빌드하고 패키지-배포해야함
		하지만 3번의 처리는 java 파일이 아니기 때문에 다시 빌드할 필요가 없고 xml은 그저 텍스트로 된 파일이기 때문에 효율적임
		*/
		
		// 『ServletConfig』
		//-- 컨테이너가 서블릿을 초기화할 때
		//	서블릿 당 하나씩 ServletConfig 을 생성하게 된다.
		ServletConfig config = getServletConfig();
		
		// 『web.xml』 에 『<init-param>』
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		/*
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>" + "Test1.java"+ "</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<div>");
		pw.println("<h1>name: "+ name + "</h1>");
		pw.println("<h1>age: "+ age + "</h1>");
		pw.println("</div>");
		pw.println("</body>");
		pw.println("</html>");
		*/
		
		// ④
		
		// 『ServletContext』
		//-- ServletConfig 는 서블릿에 대한 환경을 설정하는 과정에서
		//	필요한 값들을 전달하는 형태로 주로 사용된다면..
		//	ServletContext 는 서블릿에서 사용되는 컨텍스트를
		//	구성하는 형태로 활용된다.
		ServletContext context = getServletContext();
		
		String type = context.getInitParameter("type");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>" + "Test1.java"+ "</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<div>");
		pw.println("<h1>name: "+ name + "</h1>");
		pw.println("<h1>age: "+ age + "</h1>");
		
		pw.println("<h1>age: "+ type + "</h1>");	// 추가
		
		pw.println("</div>");
		pw.println("</body>");
		pw.println("</html>");
		
	}
}

/* ====================
	DBConn.java
=======================*/

/* ※ 싱글톤(singletone) 디자인 패턴을 이용한 Database 연결 객체 생성 전용 클래스
	  -> DB 연결 과정이 부하가 매우 크기 때문에
	  	 한번 연결된 객체를 계속 사용하는 것이 좋지 않을까...
	  	 
	** 
	*디자인 패턴: 계층에 대한 구조,공식화 된 설계 
	*ㄴ 코드레벨의 규칙성: 알고리즘
	*ex. 건축학 10층 짜리 건물을 짓는다-> 기초공사해야함
	**
*/
package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// ** 외울것 **
public class DBConn
{
	// 변수 선언(연결 객체)
	private static Connection dbConn;
	// ** static -> 싱글톤을 나타내는 대표 코드
	// ** ㄴ 탄생시점, 공유
	// ** 		이 구문에서는 공유의 개념을 가져감
	// ** c - class, i - interface
	
	// 메소드 정의 -> 연결
	public static Connection getConnection() throws ClassNotFoundException, SQLException
	{
		// ** 연결할 때 이 메소드를 통해 연결하겠다는 정의
		// ** 연결에 한번 연결되면 
		// 한 번 연결된 객체를 계속 사용
		// 즉, 연결되지 않은 경우에만 연결을 시도하겠다는 의미
		// -> 싱글톤(디자인 패턴)
		if (dbConn == null)
		{
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			//-- <localhost>는 오라클 서버의 ip 주소를 깆하는 부분
			//	"jdbc:oracle:thin:@localhost:1521:xe
			//	jdbc:oracle:thin:@211.238.142.164:1521:xe
			//	jdbc:oracle:thin:@127.0.0.1:1521:xe
					//	** 127.0.0.1 -> localhost **
					//	** xe: 시스템에 대해 고유하게 선택할 수 있는 권한
					//	** ㄴ 내가 접속
			//-- <1521> 은 오라클 리스너 Port Number
			//-- <xe> 는 오라클 SID(Express Edition 의 SID 는 xe)
			
			String user = "scott";			//-- 오라클 사용자 계정 이름
			
			String pwd = "tiger";
			//-- 오라클 사용자 계정 암호
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//-- OracleDriver 클래스에 대한 객체 생성(클래스 찾아줘~!!!)
				//	** Class라는 이름을 가진 클래스로부터.forName 메소드를 이름을 가진 행위를 함
				//	** forName: 이름을 찾는 것 **
			
			dbConn = DriverManager.getConnection(url, user, pwd);
			//-- 오라클 서버 실제 연결
				//	** getConnection: static 메소드 **
			//	갖고 있는 인자값(매개변수)은 오라클주소, 계정명,패스워드
		}
		
		// 기존에 만들어 놓은 연결객체가 있다면 그대로 반환
		return dbConn;
		//-- 구성된 연결 객체 반환
	}
	
	// 메소드 정의 -> 오버로딩 -> 연결
	public static Connection getConnection(String url, String user, String pwd) throws SQLException, ClassNotFoundException 
	{
		// 한 번 연결된 객체를 계속 사용
		// 즉, 연결되지 않은 경우에만 연결을 시도하겠다는 의미
		// -> 싱글톤(디자인 패턴)
		if (dbConn == null)
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			dbConn = DriverManager.getConnection(url, user, pwd);
		}
		
		return dbConn;
		//-- 구성된 연결 객체 반환
	}
	
	// 메소드 정의 -> 연결 종료
	public static void close() throws SQLException
	{
		// ** 이미 끊어진 것을 다시 끊지 않도록..
		// dbConn 변수(멤버 변수)는
		// Database 가 연결 된 상태일 경우 Connection을 갖는다.
		// 연결되지 않은 상태라면.. null인 상태가 된다.
		if (dbConn != null)
		{
			// ** 이름 앞에 is가 붙으면 맞는지 아닌지 확인하는 메소드 -> 결과 boolean
			// 연결 객체(dbConn)의 isClosed() 메소드를 통해 연결 상태 확인
			//-- 연결이 닫혀있는 경우 true 반환
			//	 연결이 닫혀있지 않은 경우 false 반환
			if (!dbConn.isClosed())
			{	
				dbConn.close();
				
				//-- 연결 객체의 close() 메소드 호출을 통해 연결 종료~!!
			}
		}
		
		// check~!!!
		dbConn = null;
		//-- 연결 객체 초기화
		// ** null 로 초기화 시키지 않으면 연결에 오류남
	}	
	
}

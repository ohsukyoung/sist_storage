/* ========================================================
	#05. IEmployeeDAO.java
	- 인터페이스
=========================================================== */

package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IEmployeeDAO 
{
	public ArrayList<Employee> list() throws SQLException;
	
	// IEmployeeDAO 로 한번에 처리할 수 있도록
	public ArrayList<Region> regionList() throws SQLException;
	public ArrayList<Department> departmentList() throws SQLException;
	public ArrayList<Position>	positionList() throws SQLException;
	
	public int getMinBasicPay(String positionId) throws SQLException;
	//** int 로 반환되는 이유: 내부적으로 익스큐트 업데이트면 행의 갯수를 반환해서
	//		몇개의 행이 업데이트 되었습니다~!

	public int employeeAdd(Employee employee) throws SQLException;
	public int remove(String employeeId) throws SQLException;
	public int modify(Employee employee) throws SQLException;
	public Employee searchId(String employeeId) throws SQLException; // 폼띄울 때 업데이트 됨
	
	public String login(String id, String pw) throws SQLException;
	public String loginAdmin(String id, String pw) throws SQLException;	
}

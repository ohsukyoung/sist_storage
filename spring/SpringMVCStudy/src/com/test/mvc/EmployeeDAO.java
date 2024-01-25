/* ========================================================
	#09. EmployeeDAO.java
	- 데이터베이스 액션 처리 클래스
	- 직원 데이터 CRUD 액션
	  (Create / Read / Update / Delete)
	- Connection 객체에 대한 의존성 주입을 위한 준비
	  → 인터페이스 형태의 속성 구성(DataSource)
	  → setter 구성
=========================================================== */

package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class EmployeeDAO implements IEmployeeDAO
{
	// 주요 속성 구성 → 
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	
	// 사원리스트
	@Override
	public ArrayList<Employee> list() throws SQLException
	{
		ArrayList<Employee> result = new ArrayList<Employee>();
		
		Connection conn = dataSource.getConnection();
		PreparedStatement pstmt = null;
		String sql = "";
		sql = "SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR, LUNARNAME"
	            + ", TELEPHONE, DEPARTMENTID, DEPARTMENTNAME, POSITIONID"
	            + ", POSITIONNAME, REGIONID, REGIONNAME, BASICPAY, EXTRAPAY, PAY, GRADE FROM EMPLOYEEVIEW"
	            + " ORDER BY EMPLOYEEID";
		
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			Employee employee = new Employee();
			employee.setEmployeeId(rs.getString("EMPLOYEEID"));	
			// select 쿼리문을 통해서 얻어오는 결과물은 데이터 형에 의존하지 않고, 받을 곳을 기준으로 가져오기
			// 오라클- number, 자바- String 일 경우(V) → getString!!
			employee.setName(rs.getString("NAME"));
			employee.setSsn(rs.getString("SSN"));
			employee.setBirthday(rs.getString("BIRTHDAY"));
			employee.setLunar(rs.getInt("LUNAR"));
			employee.setLunarName(rs.getString("LUNARNAME"));
			employee.setTelephone(rs.getString("TELEPHONE"));
			employee.setDepartmentId(rs.getString("DEPARTMENTID"));
			employee.setDepartmentName(rs.getString("DEPARTMENTNAME"));
			employee.setPositionId(rs.getString("POSITIONID"));
			employee.setPositionName(rs.getString("POSITIONNAME"));
			employee.setRegionId(rs.getString("REGIONID"));
			employee.setRegionName(rs.getString("REGIONNAME"));
			employee.setBasicPay(rs.getInt("BASICPAY"));
			employee.setExtraPay(rs.getInt("EXTRAPAY"));
			employee.setPay(rs.getInt("PAY"));
			employee.setGrade(rs.getInt("GRADE"));
			
			result.add(employee);
		}
		
		rs.close();
		pstmt.close();	
		conn.close();
		
		return result;
	}
	
	// 부서 리스트
	@Override
	public ArrayList<Region> regionList() throws SQLException
	{
		ArrayList<Region> result = new ArrayList<Region>();
		
		Connection conn = dataSource.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		sql = "SELECT REGIONID, REGIONNAME, DELCHECK FROM REGIONVIEW ORDER BY REGIONID";
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next())
		{
			Region region = new Region();
			region.setRegionId(rs.getString("REGIONID"));
			region.setRegionName(rs.getString("REGIONNAME"));
			region.setDelCheck(rs.getInt("DELCHECK"));
			
			result.add(region);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 부서리스트
	@Override
	public ArrayList<Department> departmentList() throws SQLException
	{
		ArrayList<Department> result = new ArrayList<Department>();
		
		Connection conn = dataSource.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		sql = "SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK FROM DEPARTMENTVIEW ORDER BY DEPARTMENTID";
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next())
		{
			Department department = new Department();
			department.setDepartmentId(rs.getString("DEPARTMENTID"));
			department.setDepartmentName(rs.getString("DEPARTMENTNAME"));
			department.setDelCheck(rs.getInt("DELCHECK"));
			
			result.add(department);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 직위 리스트
	@Override
	public ArrayList<Position> positionList() throws SQLException
	{
		ArrayList<Position> result = new ArrayList<Position>();
		
		Connection conn = dataSource.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		sql = "SELECT POSITIONID, POSITIONNAME, MINBASICPAY, DELCHECK FROM POSITIONVIEW ORDER BY POSITIONID";
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next())
		{
			Position position = new Position();
			position.setPositionId(rs.getString("POSITIONID"));
			position.setPositionName(rs.getString("POSITIONNAME"));
			position.setMinBasicPay(rs.getInt("MINBASICPAY"));
			position.setDelCheck(rs.getInt("DELCHECK"));
			
			result.add(position);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 직위 아이디에 따른 최소 기본급 확인/검색
	@Override
	public int getMinBasicPay(String positionId) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		PreparedStatement pstmt = null;
		String sql = "";
		sql="SELECT MINBASICPAY FROM POSITION WHERE POSITIONID=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(positionId));
		// check~!!!
		// positionid는 오라클- number, 자바- string
		// setString으로 넣을 경우 오라클 자동 형변환 이므로, oracle 형에 맞게 작성필요!
		
		ResultSet rs = pstmt.executeQuery();
		if(rs.next())
			result = rs.getInt("MINBASICPAY");
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 직원 데이터 추가
	@Override
	public int employeeAdd(Employee employee) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		PreparedStatement pstmt = null;
		String sql = "";
		sql = "INSERT INTO EMPLOYEE(EMPLOYEEID, NAME, BIRTHDAY, LUNAR " + 
				"                    , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID " + 
				"                    , BASICPAY, EXTRAPAY, SSN1, SSN2) " + 
				"VALUES(EMPLOYEESEQ.NEXTVAL, ?, TO_DATE(?,'YYYY-MM-DD'), ? " + 
				"        , ?,?,?,?, ?, ? " + 
				"        , ?, CRYPTPACK.ENCRYPT(?,?))";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, employee.getName());
		pstmt.setString(2, employee.getBirthday());
		pstmt.setInt(3, employee.getLunar());
		pstmt.setString(4, employee.getTelephone());
		pstmt.setInt(5, Integer.parseInt(employee.getDepartmentId()));
		pstmt.setInt(6, Integer.parseInt(employee.getPositionId()));
		pstmt.setInt(7, Integer.parseInt(employee.getRegionId()));
		pstmt.setInt(8, employee.getBasicPay());
		pstmt.setInt(9, employee.getExtraPay());
		pstmt.setString(10, employee.getSsn1());
		// **check~!! ssn2 2번 들어감!
		pstmt.setString(11, employee.getSsn2());
		pstmt.setString(12, employee.getSsn2());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 직원 데이터 삭제
	@Override
	public int remove(String employeeId) throws SQLException
	{
		int result = 0;

		Connection conn = dataSource.getConnection();
		String sql = "DELETE FROM EMPLOYEE WHERE EMPLOYEEID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(employeeId));
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 직원 데이터 수정
	@Override
	public int modify(Employee employee) throws SQLException
	{
		int result = 0;

		Connection conn = dataSource.getConnection();
		PreparedStatement pstmt = null;
		String sql = "";
		
		
		sql="UPDATE EMPLOYEE SET NAME = ?"
				+ ", BIRTHDAY=TO_DATE(?, 'YYYY-MM-DD')"		//** check~!!! 날짜 타입에 맞게 넘겨야 함
				+ ", LUNAR=?, TELEPHONE=?"
				+ ", DEPARTMENTID=?, POSITIONID=?, REGIONID=?"
				+ ", BASICPAY=?, EXTRAPAY=?"
				+ ", SSN1=?, SSN2=CRYPTPACK.ENCRYPT(?,?)"	//** check~!!! 같은 파라미터 암호화때문에 두번 넘겨야함
				//+ ", GRADE=? WHERE EMPLOYEEID=?";			//** grade 빼기
				+ " WHERE EMPLOYEEID=?";

		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, employee.getName());
		pstmt.setString(2, employee.getBirthday());
		pstmt.setInt(3, employee.getLunar());
		pstmt.setString(4, employee.getTelephone());
		pstmt.setInt(5, Integer.parseInt(employee.getDepartmentId()));
		pstmt.setInt(6, Integer.parseInt(employee.getPositionId()));
		pstmt.setInt(7, Integer.parseInt(employee.getRegionId()));
		pstmt.setInt(8, employee.getBasicPay());
		pstmt.setInt(9, employee.getExtraPay());
		pstmt.setString(10, employee.getSsn1());
		pstmt.setString(11, employee.getSsn2());
		pstmt.setString(12, employee.getSsn2());
		//pstmt.setInt(13, employee.getGrade());
		pstmt.setInt(13, Integer.parseInt(employee.getEmployeeId()));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 아이디로 직원 검색
	@Override
	public Employee searchId(String employeeId) throws SQLException
	{
		Employee employee = new Employee();
		
		Connection conn = dataSource.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		sql = "SELECT EMPLOYEEID, NAME, SSN1, TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY FROM EMPLOYEE WHERE EMPLOYEEID=?";
		pstmt= conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(employeeId));
		
		rs = pstmt.executeQuery();
		while(rs.next())
		{
			employee.setEmployeeId(rs.getString("EMPLOYEEID"));	
			employee.setName(rs.getString("NAME"));
			employee.setSsn1(rs.getString("SSN1"));
			employee.setBirthday(rs.getString("BIRTHDAY"));
			employee.setLunar(rs.getInt("LUNAR"));
			employee.setTelephone(rs.getString("TELEPHONE"));
			employee.setDepartmentId(rs.getString("DEPARTMENTID"));
			employee.setPositionId(rs.getString("POSITIONID"));
			employee.setRegionId(rs.getString("REGIONID"));
			employee.setBasicPay(rs.getInt("BASICPAY"));
			employee.setExtraPay(rs.getInt("EXTRAPAY"));
		}
		
		rs.close();
		pstmt.close();	
		conn.close();
		
		return employee;
	}

	// 일반 직원 로그인
	@Override
	public String login(String id, String pw) throws SQLException
	{
		//String result = "";	//** - (X)
		String result = null;	//** check~!!! 초기값 null!! 나중에 있는지 없는지 체크해야하기때문에
		
		Connection conn = dataSource.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		sql="SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=? AND SSN2 = CRYPTPACK.ENCRYPT(?,?)";
		
		pstmt= conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(id));
		pstmt.setString(2, pw);
		pstmt.setString(3, pw);
		
		rs= pstmt.executeQuery();
		
		if(rs.next())
			result = rs.getString("NAME");
		
		rs.close();
		pstmt.close();	
		conn.close();	
		
		return result;
	}

	// 관리자 로그인
	@Override
	public String loginAdmin(String id, String pw) throws SQLException
	{
		String result = null;
		
		Connection conn = dataSource.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		sql="SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID=? AND SSN2 = CRYPTPACK.ENCRYPT(?,?) AND GRADE = 0";
		
		pstmt= conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(id));
		pstmt.setString(2, pw);
		pstmt.setString(3, pw);
		
		rs= pstmt.executeQuery();
		
		if(rs.next())
			result = rs.getString("NAME");
		
		rs.close();
		pstmt.close();	
		conn.close();	
		
		return result;
	}
	
	
	
}

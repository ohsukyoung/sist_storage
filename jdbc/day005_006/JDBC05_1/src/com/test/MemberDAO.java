/* =========================================
	MemberDAO.java
	- 데이터베이스 액션 처리 전용 클래스
===========================================*/
package com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberDAO
{
	// 주요 속성 구성
	private Connection conn;
	
	// 데이터베이스 연결 담당 메소드
	public Connection connection() throws SQLException
	{
		conn = DBConn.getConnection();
		
		return conn;
	}
	
	// 데이터 입력 담당 메소드
	public int add(MemberDTO dto) throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("INSERT INTO TBL_EMP(EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG)"
				+ " VALUES(EMPSEQ.NEXTVAL, '%s', '%s', '%s', %d, '%s', %d, %d, %d , %d)"
				, dto.getEmp_name(), dto.getSsn(), dto.getIbsadate(), dto.getCityId(), dto.getTel(), dto.getBuseoId(), dto.getJikwiId(), dto.getBasicpay(), dto.getSudang());
		
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		
		return result;
	}
	
	// city 출력 메소드
	public ArrayList<MemberDTO> cityLists() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("SELECT CITY_ID, CITY_NAME FROM TBL_CITY");
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setCityId(rs.getInt("CITY_ID"));
			dto.setCityName(rs.getString("CITY_NAME"));
			
			result.add(dto);
		}
		
		rs.close();
		stmt.close();
		
		return result;
	}
	
	// city 확인 메소드
	public ArrayList<MemberDTO> cityLists(String cityName) throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("SELECT CITY_ID, CITY_NAME FROM TBL_CITY"
				+ " WHERE CITY_NAME = '%s'", cityName);
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setCityId(rs.getInt("CITY_ID"));
			dto.setCityName(rs.getString("CITY_NAME"));
			
			result.add(dto);
		}
		
		rs.close();
		stmt.close();
		
		return result;
	}
	
	// buseo 출력 메소드
	public ArrayList<MemberDTO> buseoLists() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("SELECT BUSEO_ID, BUSEO_NAME FROM TBL_BUSEO");
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setBuseoId(rs.getInt("BUSEO_ID"));
			dto.setBuseoName(rs.getString("BUSEO_NAME"));
			
			result.add(dto);
		}
		
		rs.close();
		stmt.close();
		
		return result;
	}
	
	// buseo 확인 메소드
	public ArrayList<MemberDTO> buseoLists(String buseoName) throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("SELECT BUSEO_ID, BUSEO_NAME FROM TBL_BUSEO"
				+ " WHERE BUSEO_NAME = '%s'", buseoName);
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setBuseoId(rs.getInt("BUSEO_ID"));
			dto.setBuseoName(rs.getString("BUSEO_NAME"));
			
			result.add(dto);
		}
		
		rs.close();
		stmt.close();
		
		return result;
	}
	
	// 직위 출력 메소드
	public ArrayList<MemberDTO> jikwiLists() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("SELECT JIKWI_ID, JIKWI_NAME, MIN_BASICPAY FROM TBL_JIKWI");
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setJikwiId(rs.getInt("JIKWI_ID"));
			dto.setJikwiName(rs.getString("JIKWI_NAME"));
			dto.setMinBasicPay(rs.getInt("MIN_BASICPAY"));
			
			result.add(dto);
		}
		
		rs.close();
		stmt.close();
		
		return result;
	}
	
	// 직위 확인 메소드
	public ArrayList<MemberDTO> jikwiLists(String jikwiName) throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("SELECT JIKWI_ID, JIKWI_NAME, MIN_BASICPAY FROM TBL_JIKWI"
				+ " WHERE JIKWI_NAME = '%s'", jikwiName);
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setJikwiId(rs.getInt("JIKWI_ID"));
			dto.setJikwiName(rs.getString("JIKWI_NAME"));
			dto.setMinBasicPay(rs.getInt("MIN_BASICPAY"));
			
			result.add(dto);
		}
		
		rs.close();
		stmt.close();
		
		return result;
	}
	
//	--------------------------------------------------------------------------------------------------------- 1 번 완료
	public ArrayList<MemberDTO> orderLists(int orderNum) throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		Statement stmt = conn.createStatement();
		
		String sql = "";
		
		switch (orderNum)
		{
			case 3:
				sql = String.format("SELECT * FROM EMP_LIST"
					+ " ORDER BY %s", "부서");
			break;
			case 4:
				sql = String.format("SELECT * FROM EMP_LIST"
					+ " ORDER BY %s", "직위");
			break;
			case 5:
				sql = String.format("SELECT * FROM EMP_LIST"
						+ " ORDER BY %s DESC", "급여");
				break;
			default:
				sql = String.format("SELECT * FROM EMP_LIST"
						+ " ORDER BY %d", orderNum);
				break;
		}
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setEmpId(rs.getInt("사번"));
			dto.setEmp_name(rs.getString("이름"));
			dto.setSsn(rs.getString("주민번호"));
			dto.setIbsadate(rs.getString("입사일"));
			dto.setCityName(rs.getString("지역"));
			dto.setTel(rs.getString("전화번호"));
			dto.setBuseoName(rs.getString("부서"));
			dto.setJikwiName(rs.getString("직위"));
			dto.setBasicpay(rs.getInt("기본급"));
			dto.setSudang(rs.getInt("수당"));
			
			result.add(dto);
		}
		
		rs.close();
		stmt.close();
		
		return result;
	}

	// 데이터 카운트 담당 메소드
	public int count() throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_EMP";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		rs.close();
		stmt.close();
		
		return result;
	}
//	--------------------------------------------------------------------------------------------------------- 2 번 완료
	public ArrayList<MemberDTO> searhLists(int SearchNum, int searchID, String searchText) throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		Statement stmt = conn.createStatement();
		
		String sql = "";
		
		switch (SearchNum)
		{
			case 1:
				sql = String.format("SELECT * FROM EMP_LIST"
					+ " WHERE 사번 = %d", searchID);
				break;
			case 2:
				sql = String.format("SELECT * FROM EMP_LIST"
					+ " WHERE 이름 = '%s'", searchText);
				break;
			case 3:
				sql = String.format("SELECT * FROM EMP_LIST"
					+ " WHERE 부서 = '%s'", searchText);
				break;
			case 4:
				sql = String.format("SELECT * FROM EMP_LIST"
					+ " WHERE 직위 = '%s'", searchText);
				break;
		}
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setEmpId(rs.getInt("사번"));
			dto.setEmp_name(rs.getString("이름"));
			dto.setSsn(rs.getString("주민번호"));
			dto.setIbsadate(rs.getString("입사일"));
			dto.setCityName(rs.getString("지역"));
			dto.setTel(rs.getString("전화번호"));
			dto.setBuseoName(rs.getString("부서"));
			dto.setJikwiName(rs.getString("직위"));
			dto.setBasicpay(rs.getInt("기본급"));
			dto.setSudang(rs.getInt("수당"));
			
			result.add(dto);
		}
		
		rs.close();
		stmt.close();
		
		return result;
	}

//	--------------------------------------------------------------------------------------------------------- 3 번 완료	
		
	// 데이터 수정 담당 메소드
	public int modify(MemberDTO dto) throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("UPDATE TBL_EMP"
				+ " SET EMP_NAME='%s', SSN='%s', IBSADATE='%s', CITY_ID=%d, TEL='%s', BUSEO_ID=%d, JIKWI_ID=%d, BASICPAY=%d , SUDANG=%d"
				+ " WHERE EMP_ID = %d"
				, dto.getEmp_name(), dto.getSsn(), dto.getIbsadate(), dto.getCityId(), dto.getTel()
				, dto.getBuseoId(), dto.getJikwiId(), dto.getBasicpay(), dto.getSudang(), dto.getEmpId());
		
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		
		return result;
	}
	
//	--------------------------------------------------------------------------------------------------------- 4 번 완료	
	
	// 데이터 삭제 담당 메소드
	public int delete(int empId) throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("DELETE FROM TBL_EMP WHERE EMP_ID = %d", empId);
		
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		
		return result;
	}
}

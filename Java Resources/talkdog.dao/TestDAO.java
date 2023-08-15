package talkdog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import talkdog.util.DBConn;
import talkdog.vo.TestnameVO;

public class TestDAO {
	
	private String query; 				//쿼리문 저장 필드
	private PreparedStatement pstmt;	//매개변수(ex.아이디, 이름)가 있는 경우에는 pstmt를 사용하는 것이 적합
	private ResultSet rs;				//select쿼리를 실행한 결과를 저장할 ResulSet형 필드
	private boolean result;				//DML처리결과 여부 저장
	
	 private Connection con;
	    
		public TestDAO() {
			this.con = DBConn.getConnection();
		}
	    public TestDAO(Connection con) {
	        this.con = con;
	    }
	    
	public List<TestnameVO> selectName(){
		List<TestnameVO> tnvoList = new ArrayList<>();
		TestnameVO tnvo = null;
		try {
			query = "SELECT * from testname";
			pstmt = con.prepareStatement(query);		// 바인딩할 게 없어서 Statement 사용하면 더 편함		
			rs = pstmt.executeQuery();
			while (rs.next() == true) {				 
				tnvo = new TestnameVO();
				tnvo.settName(rs.getString("t_name"));
			
				tnvoList.add(tnvo);  //List 객체에 추가
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(pstmt, rs);
		}
		return tnvoList;
	}

}

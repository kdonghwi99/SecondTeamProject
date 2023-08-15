package talkdog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import talkdog.util.DBConn;
import talkdog.vo.MemberResultVO;
import talkdog.vo.TestResultVO;
import talkdog.vo.TestVO;
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
      // 자가진단 항목 추가
    public boolean testEnroll(TestVO tvo) {
        // 자가진단 항목 추가 로직 구현
        // 성공하면 true, 실패하면 false 반환
    	
    	try {
            query = "INSERT INTO product VALUES (?,?,test_seq)";
            
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, tvo.gettName());
            pstmt.setString(2, tvo.gettItem());

            int execute = pstmt.executeUpdate();
            if(execute==1) {
                return true;
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConn.close(pstmt);
        }
        
        return false;
    }

      // 자가진단결과 추가
    public boolean testResultEnroll(TestResultVO trvo) {
        // 자가진단 항목 추가 로직 구현
        // 성공하면 true, 실패하면 false 반환
    	
    	try {
            query = "INSERT INTO product VALUES (?,?,?)";
            
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, trvo.gettScore());
            pstmt.setString(2, trvo.gettResult());
            pstmt.setString(3, trvo.gettName());

            int execute = pstmt.executeUpdate();
            if(execute==1) {
                return true;
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConn.close(pstmt);
        }
        
        return false;
    }


    // 자가진단 항목 개별 수정
    public boolean testUpdate(TestVO tvo) {
        // 자가진단 항목 개별 수정 로직 구현
        // 성공하면 true, 실패하면 false 반환
       return true;

    }

    // 자가진단 항목 개별 삭제
    public boolean testDelete(String tName, int tNum) {
        // 자가진단 항목 개별 삭제 로직 구현
        // 성공하면 true, 실패하면 false 반환
       return true;

    }

    // 자가진단 항목 조회
    public boolean testSelect(String tName) {
        // 자가진단 항목 조회 로직 구현
        // 해당 이름의 테스트가 존재하면 true, 없으면 false 반환
       return true;

    }

   // 자가진단 결과내용 조회
    public boolean testResultSelect(String tName) {
        // 자가진단 항목 조회 로직 구현
        // 해당 이름의 테스트가 존재하면 true, 없으면 false 반환
       return true;

    }

    // 자가진단 상세보기
    public TestVO testSelectDetail(String tName) {
       TestVO tvo = null;
        // 자가진단 상세보기 로직 구현
        // 해당 이름의 테스트 상세 정보를 TestVO 형태로 반환
       return tvo;
    }
   
    // 자가진단 결과 조회
    public List<MemberResultVO> testResultSelect() {
       List<MemberResultVO> mrvolist = new ArrayList<MemberResultVO>();      //쿼리 실행 결과로 담아올 list 공간 미리 준비
       MemberResultVO mrvo = null;
        // 자가진단 결과 조회 로직 구현
        // 모든 자가진단 결과를 List<MemberResultVO> 형태로 반환
       return mrvolist;
    }

    // 자가진단결과 항목 개별 수정
    public boolean testResultUpdate(TestResultVO trvo) {
        // 자가진단 항목 개별 수정 로직 구현
        // 성공하면 true, 실패하면 false 반환
       return true;

    }
    
    // 자가진단 결과 초기화
    public boolean testResultDelete(String tName) {
        // 자가진단 결과 초기화 로직 구현
        // 성공하면 true, 실패하면 false 반환
       return true;

    }
    
}
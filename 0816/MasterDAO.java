package talkdog.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import talkdog.util.DBConn;
import talkdog.vo.AdminMasterWrapperVO;
import talkdog.vo.AdminVO;
import talkdog.vo.MasterVO;

public class MasterDAO {

	private Connection con;

	public MasterDAO(Connection con) {
		this.con = con;
	}

	private String query;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// pkfk 신청일자를 신청자 정보에 넣고, 요청정보에 필요한걸 가져와서 > 가져오는 vo
	// 테이블에서 가져오는거에대한 vo join으로 만듬?
	// 트리거하면 요청정보에서 다 지우고 신청자 정보 거절당한 사람지우고 회원종류 업데이트
	// >많을때 ==/==view

	// 승인일자 컬럼 하나 만들어서 따로 join만들지말고
	// 승인이되면 업데이트하고 거절하면 정보 빼고
	// >양이 적을때 where

	// 신청일자 만들고 테이블 x 뷰 ㅓ하고 뷰 vo하고
	// 보고 승인하면 종류 업데이트, 틀리면 아이디 비교해서 지우고 >이걸로 픽 근데 트리거 그럼 세개 써야하나?

	// 전문가 프로필 정보 등록 - 작성자 정보 저장
	public boolean masInsert(MasterVO masvo) {
		query = " INSERT INTO master VALUES (?, ?, ?, ?, ?, ?, ?, SYSDATE, NULL, ?, ?) ";

		try { // getCon()이 con을 반환하므로 con 사용 가능
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, masvo.getAdmId());
			pstmt.setString(2, masvo.getMasPaper());
			pstmt.setString(3, masvo.getMasSveri());
			pstmt.setString(4, masvo.getMasIntro());
			pstmt.setString(5, masvo.getMasAddr());
			pstmt.setString(6, masvo.getMasAuth());
			pstmt.setString(7, masvo.getMasProf());
			pstmt.setString(8, masvo.getMasSchool());
			pstmt.setString(9, masvo.getMasCert());

			int result = pstmt.executeUpdate(); // 실행했을 때 1이 나와야 성공
			if (result == 1) // 정상적으로 회원가입 성공 시 true 반환
				return true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//			con.close();	// con을 생성하지 않았기 때문에 pstmt만 닫음
		}
		return false;

	}
	
	//전문가 요청 업데이트
	public boolean masReqList(MasterVO masvo) {
		query = " INSERT INTO request VALUES (?) ";

		try { // getCon()이 con을 반환하므로 con 사용 가능
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, masvo.getAdmId());

			int result = pstmt.executeUpdate(); // 실행했을 때 1이 나와야 성공
			if (result == 1) // 정상적으로 회원가입 성공 시 true 반환
				return true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//			con.close();	// con을 생성하지 않았기 때문에 pstmt만 닫음
		}
		return false;

	}

	// 승인 - 승인 여부 변경 //기준을 신청자정보로
	public boolean masConfirm(String masId) {
		// 업데이트해야할듯?
		query = "UPDATE master SET mas_confirm = '1' WHERE adm_id = ?";
		try {
			MasterVO masvo = new MasterVO();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, masvo.getAdmId());
//System.out.println("승인 테스트");
			int result = pstmt.executeUpdate(); // 실행했을 때 1이 나와야 성공
			if (result == 1) // 정상적으로 업데이트 시 true 반환
				return true;

		} catch (SQLException e) { // 예외 처리
			e.printStackTrace();
		} finally {
//			DBConn.close(pstmt); // pstmt만 닫음
		}

		return false;
		// 회원종류 없뎃때문에 만듬
	}

	// 승인 - 회원 종류 업데이트
	public boolean masConType(String masId) {

		query = "UPDATE admin SET adm_type = '1' WHERE adm_id = ?";
		try {
			AdminVO avo = new AdminVO();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, avo.getAdmId());

			int result = pstmt.executeUpdate(); // 실행했을 때 1이 나와야 성공
			if (result == 1) // 정상적으로 업데이트 시 true 반환
				return true;

		} catch (SQLException e) { // 예외 처리
			e.printStackTrace();
		} finally {
//			DBConn.close(pstmt); // pstmt만 닫음
		}

		return false;
	}

//	// 거절 - 승인 여부 변경
//	public boolean masReject(String masId) {
//
//		query = "UPDATE master SET mas_confirm = '0' WHERE adm_id = ?";
//		try {
//			MasterVO masvo = new MasterVO();
//			pstmt = con.prepareStatement(query);
//			pstmt.setString(1, masvo.getAdmId());
//
//			int result = pstmt.executeUpdate(); // 실행했을 때 1이 나와야 성공
//			if (result == 1) // 정상적으로 업데이트 시 true 반환
//				return true;
//
//		} catch (SQLException e) { // 예외 처리
//			e.printStackTrace();
//		} finally {
////			DBConn.close(pstmt); // pstmt만 닫음
//		}
//
//		return false;
//	}
	
	//거절 - 전문가 목록 삭제
	public boolean masDelete(String admId) { // 메모 삭제 시 메서드
		query = "DELETE FROM master WHERE adm_id = ?";
		System.out.println("delete 다오 테스트");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, admId); 
			
			
			int result = pstmt.executeUpdate(); // 실행했을 때 1이 나와야 성공
			if (result == 1) // 정상적으로 삭제 성공 시 true 반환
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//			DBConn.close(pstmt); // pstmt 닫음
		}
		return false; // 실패 시 false 반환
	}

	// 전문가요청 목록 삭제
	public boolean reqDelete(String admId) { // 메모 삭제 시 메서드
		query = "DELETE FROM request WHERE adm_id = ?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, admId); 

			int result = pstmt.executeUpdate(); // 실행했을 때 1이 나와야 성공
			if (result == 1) // 정상적으로 삭제 성공 시 true 반환
				return true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//			DBConn.close(pstmt); // pstmt 닫음
		}
		return false; // 실패 시 false 반환
	}
	

//	// 회원 정보 전문가 목록 - 전문가 목록
//	public List<MasterVO> masSelect(double amount, int pageNum, String masId, String masName) {
//		//이거도 어카냐..
//		
//		return null;
//	}

	// 전문가 프로필 정보 조회(본인이)
	public MasterVO masProfileSelect(String masId) {
		MasterVO masvo = null;		// 지역변수는 초기화 필수
		try {	
			query = "SELECT * FROM master WHERE adm_id = ?";		// 1. SELECT 쿼리문 만들기
			pstmt = con.prepareStatement(query);				// 2. pstmt 객체 생성
			pstmt.setString(1, masId);								// 3. 데이터 바인딩
			rs = pstmt.executeQuery();							// 4. 쿼리문 실행
			
			while(rs.next()) {			// 조회되는 레코드가 있다면 VO객체를 생성하여 해당 레코드 값을 저장
				masvo = new MasterVO();	// 레코드를 저장할 객체
				masvo.setAdmId(rs.getString("adm_id"));
				masvo.setMasPaper(rs.getString("mas_paper"));
				masvo.setMasSveri(rs.getString("mas_sveri"));
				masvo.setMasIntro(rs.getString("mas_intro"));
				masvo.setMasAddr(rs.getString("mas_addr"));
				masvo.setMasAuth(rs.getString("mas_auth"));
				masvo.setMasProf(rs.getString("mas_prof"));
				masvo.setMasRegi(rs.getDate("mas_regi"));
				masvo.setMasConfirm(rs.getString("mas_confirm"));
				masvo.setMasSchool(rs.getString("mas_school"));
				masvo.setMasCert(rs.getString("mas_cert"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
//			DBConn.close(pstmt, rs);	// 사용했던 rs, pstmt 순으로 닫음
		}
		return masvo;	
	}

//	// 전문가 프로필 정보 수정(join으로 수정)
//	public boolean masPUpdate(MasterVO masvo) {
//		query = "UPDATE master SET  mas_prof = ?, mas_name = ?, mas_intro = ?, mas_auth = ?, mas_addr = ?, mas_school = ?, mas_cert = ? WHERE adm_id = ?";
//		try {
//			pstmt = con.prepareStatement(query);
//			pstmt.setString(1, masvo.getMasProf()); // mvo의 getter에 들어간 데이터를 바인딩
//			pstmt.setString(2, masvo.getmas());
//			pstmt.setString(3, masvo.getAdmId());
//			pstmt.setString(4, masvo.getAdmEmail());
//			pstmt.setString(5, masvo.getAdmPhone());
//			pstmt.setString(6, masvo.getAdmId());
//
//			int result = pstmt.executeUpdate(); // 실행했을 때 1이 나와야 성공
//			if (result == 1) // 정상적으로 업데이트 시 true 반환
//				return true;
//
//		} catch (SQLException e) { // 예외 처리
//			e.printStackTrace();
//		} finally {
////			DBConn.close(pstmt);	// pstmt만 닫음
//		}
//
//		return false;
//	}

	// 전문가 요청 목록 조회 - 승인 거절 버튼 있는 곳
	public List<AdminMasterWrapperVO> masAppSelect() {
		List<AdminMasterWrapperVO> amvolist = new ArrayList<>();
		
		try {
			query = "SELECT ROWNUM AS request_num, M.mas_regi, M.mas_paper, M.mas_sveri, A.adm_name, A.adm_regi, R.adm_id, A.adm_email " +
			        "FROM request R " +
			        "INNER JOIN master M ON M.adm_id = R.adm_id " +
			        "INNER JOIN admin A ON A.adm_id = R.adm_id";
			pstmt = con.prepareStatement(query);

			rs = pstmt.executeQuery();
			
			while (rs.next() == true) {
				
				AdminMasterWrapperVO amvo = new AdminMasterWrapperVO(null, null);
				AdminVO avo = new AdminVO();
	            MasterVO masvo = new MasterVO();
	            
	            avo.setAdmId(rs.getString("adm_id"));
	            masvo.setAdmId(rs.getString("adm_id"));
				avo.setAdmName(rs.getString("adm_name"));
				avo.setAdmRegi(rs.getDate("adm_regi"));
				avo.setAdmEmail(rs.getString("adm_email"));
				masvo.setMasRegi(rs.getDate("mas_regi"));
				masvo.setMasPaper(rs.getString("mas_paper"));
				masvo.setMasSveri(rs.getString("mas_sveri"));
				
				
				amvo.setAvo(avo);
				amvo.setMasvo(masvo);
				
				amvolist.add(amvo);// List 객체에 추가

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(rs, pstmt);
		}
		return amvolist;
		
	}

}

package talkdog.dao;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import talkdog.util.DBConn;
import talkdog.vo.AdminVO;
import talkdog.vo.MasterVO;

public class AdminDAO {

	private Connection con;

	public AdminDAO() {
	}
	
	public AdminDAO(Connection con) {
		this.con = con;
	}

	private String query;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public Connection getCon() {
		return con;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	// 회원 로그인
	public boolean login(AdminVO avo) {
		try { // select count(*)를 실행하여 아이디와 전화번호가 회원 테이블에 존재하면 1이 반환, 그렇지 않으면 0이 반환
			query = " SELECT COUNT(*) FROM admin WHERE adm_id = ? AND adm_pw = ? ";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, avo.getAdmId()); // 데이터 바인딩
			pstmt.setString(2, avo.getAdmPw());
			rs = pstmt.executeQuery(); // 쿼리문 실행

			if (rs.next()) { // query문에서 1을 받으면 로그인 성공(true) 반환
				if (rs.getInt(1) == 1) // rs.getInt => ResultSet에서 인트값 가져옴
					return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(rs, pstmt);
		}
		return false;

	}

	// 회원 정보 등록
	public boolean admInsert(AdminVO avo) {
		query = "INSERT INTO admin VALUES (?,?,?,?,?,?,?,?,?,?,?,?,'0',SYSDATE)";

//		AdminVO avo = new AdminVO();
//		avo.getAdmType(true); //false는 0이 들어감, get으로 갖고왔을경우

		try { // getCon()이 con을 반환하므로 con 사용 가능
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, avo.getAdmId());
			pstmt.setString(2, avo.getAdmName());
			pstmt.setString(3, avo.getAdmNick());
			pstmt.setString(4, avo.getAdmPw());
			pstmt.setString(5, avo.getAdmMail());
			pstmt.setString(6, avo.getAdmAdd1());
			pstmt.setString(7, avo.getAdmAdd2());
			pstmt.setString(8, avo.getAdmAdd3());
			pstmt.setString(9, avo.getAdmPhone());
			pstmt.setString(10, avo.getAdmEmail());
			pstmt.setDate(11, (Date) avo.getAdmBirth());
			pstmt.setString(12, avo.getAdmPath());
//			pstmt.setBoolean(13, avo.getAdmType());
//			pstmt.setDate(14, (Date) avo.getAdmRegi());

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

	// 회원 정보 전체 목록
	public List<AdminVO> admSelectAll(double amount, int pageNum, String admId, String admName) {
//		List<AdminVO> avolist = new ArrayList<>();
//
//		AdminVO avo = null;
//		try {
//			query = " SELECT * FROM admin "; // 물음표가 없어서 stmt 사용가능
//			pstmt = DBConn.getConnection().prepareStatement(query);
//
//			rs = pstmt.executeQuery();
//			while (rs.next() == true) {
//				avo = new AdminVO();
//				avo.setAdmId(rs.getString("adm_id"));
//				avo.setAdmName(rs.getString("adm_name"));
//				avo.setAdmNick(rs.getString("adm_nick"));
//				avo.setAdmPw(rs.getString("adm_pw"));
//				avo.setAdmMail(rs.getString("adm_mail"));
//				avo.setAdmAdd1(rs.getString("adm_add1"));
//				avo.setAdmAdd2(rs.getString("adm_add2"));
//				avo.setAdmAdd3(rs.getString("adm_add3"));
//				avo.setAdmPhone(rs.getString("adm_phone"));
//				avo.setAdmEmail(rs.getString("adm_email"));
//				avo.setAdmPath(rs.getString("adm_path"));
//				avo.setAdmBirth(rs.getDate("adm_birth"));
//				avo.setAdmType(rs.getBoolean("adm_type"));
//				avo.setAdmRegi(rs.getDate("adm_regi"));
//
//				avolist.add(avo);// List 객체에 추가
//
//			}
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBConn.close(rs, pstmt);
//		}
//		return avolist;
		
		List<AdminVO> memberlist = new ArrayList<>();

		AdminVO avo = null;
		try {
			query = "SELECT * FROM (SELECT ROWNUM AS admRn, b.* FROM "
					+ " (SELECT * FROM admin ";
			
			if(!admId.equals("") && !admName.equals("")) {
				query += " WHERE " + admId + " LIKE '%" + admName + "%' ";
			}
			
			query += " ORDER BY num DESC) b WHERE ROWNUM <= ? * ?) WHERE admRn > ? * ?";
			
			pstmt = con.prepareStatement(query);
			pstmt.setDouble(1, amount);
			pstmt.setInt(2, pageNum);
			pstmt.setDouble(3, amount);
			pstmt.setInt(4, (pageNum - 1));
			
			rs = pstmt.executeQuery();
			while (rs.next()) { // 조회되는 레코드가 있다면 VO객체를 생성하여 해당 레코드 값을 저장
				avo = new AdminVO(); // 레코드를 저장할 객체
				avo.setAdmId(rs.getString("adm_id"));
				avo.setAdmName(rs.getString("adm_name"));
				avo.setAdmNick(rs.getString("adm_nick"));
				avo.setAdmPw(rs.getString("adm_add1"));
				avo.setAdmMail(rs.getString("adm_ma"));
				avo.setAdmAdd1(rs.getString("adm_add1"));
				avo.setAdmAdd2(rs.getString("adm_add2"));
				avo.setAdmAdd3(rs.getString("adm_add3"));
				avo.setAdmPhone(rs.getString("adm_phone"));
				avo.setAdmEmail(rs.getString("adm_email"));
				avo.setAdmBirth(rs.getDate("adm_birth"));
				avo.setAdmPath(rs.getString("adm_path"));
				avo.setAdmType(rs.getBoolean("adm_type"));
				avo.setAdmRegi(rs.getDate("adm_regi"));

				memberlist.add(avo); // List 객체에 mvo 데이터 추가
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(rs, pstmt); // 사용했던 rs, pstmt 순으로 닫음
		}
		return memberlist;


	}

//	// 회원 정보 일반 목록 (전문가 일반 정보도 여기서 불러옴)
//	public List<AdminVO> admSelectNormal(double amount, int pageNum, String admId, String admName) {
//		// 전체 목록이랑 비슷하게?
//
//		return null;
//	}

	// 회원 정보 상세 조회
	public AdminVO admSelect(String admId) {
		AdminVO avo = null;
		try {
			query = " SELECT * FROM admin WHERE admin_id = ? "; // 번호로 받아오게 됨
			pstmt = DBConn.getConnection().prepareStatement(query);
			// 2
			/* 1 */ pstmt.setString(1, admId);

			/* 2 */ rs = pstmt.executeQuery();
			if (rs.next() == true) {
				avo = new AdminVO();
				avo.setAdmId(rs.getString("adm_id"));
				avo.setAdmName(rs.getString("adm_name"));
				avo.setAdmNick(rs.getString("adm_nick"));
				avo.setAdmPw(rs.getString("adm_pw"));
				avo.setAdmMail(rs.getString("adm_mail"));
				avo.setAdmAdd1(rs.getString("adm_add1"));
				avo.setAdmAdd2(rs.getString("adm_add2"));
				avo.setAdmAdd3(rs.getString("adm_add3"));
				avo.setAdmPhone(rs.getString("adm_phone"));
				avo.setAdmEmail(rs.getString("adm_email"));
				avo.setAdmPath(rs.getString("adm_path"));
				avo.setAdmBirth(rs.getDate("adm_birth"));
				avo.setAdmType(rs.getBoolean("adm_type"));
				avo.setAdmRegi(rs.getDate("adm_regi"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { //

			DBConn.close(rs, pstmt);
		}

		return avo;
	}

	// 회원 정보 수정
	public boolean admUpdate(AdminVO avo) {
		query = "UPDATE admin SET  adm_name = ?, adm_type = ?, adm_id = ?, amd_email = ?, adm_phone = ? WHERE adm_id = ?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, avo.getAdmName()); // mvo의 getter에 들어간 데이터를 바인딩
			pstmt.setBoolean(2, avo.getAdmType());
			pstmt.setString(3, avo.getAdmId());
			pstmt.setString(4, avo.getAdmEmail());
			pstmt.setString(5, avo.getAdmPhone());
			pstmt.setString(6, avo.getAdmId());

			int result = pstmt.executeUpdate(); // 실행했을 때 1이 나와야 성공
			if (result == 1) // 정상적으로 업데이트 시 true 반환
				return true;

		} catch (SQLException e) { // 예외 처리
			e.printStackTrace();
		} finally {
//			DBConn.close(pstmt);	// pstmt만 닫음
		}

		return false;

	}

	// 회원 정보 삭제
	public boolean admDelete(String admId) {
		query = "DELETE FROM admin WHERE adm_id = ?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, admId); // mvo가 아닌 매개변수 mid 그대로 바인딩

			int result = pstmt.executeUpdate(); // 실행했을 때 1이 나와야 성공
			if (result == 1) // 정상적으로 삭제 성공 시 true 반환
				return true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//			DBConn.close(pstmt);	// pstmt 닫음
		}
		return false;
	}

	// 아이디 찾기
	public String admFid(/* String admPhone, String admName */AdminVO avo) {
//		avo = null;		//초기화화면 안됨
//		String admId = "";
		
		query = " SELECT adm_id FROM admin WHERE adm_name = ? AND adm_phone = ? ";
		try {	                                          //+ 해서 바로 변수명으로 불러올 수 있음
					
			pstmt = con.prepareStatement(query);				
			pstmt.setString(1, avo.getAdmName());								// 3. 데이터 바인딩
			pstmt.setString(2, avo.getAdmPhone());								// 3. 데이터 바인딩
			rs = pstmt.executeQuery();							// 4. 쿼리문 실행
			if(rs.next()) {
				  return rs.getString("adm_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			DBConn.close(rs, pstmt);	// 사용했던 rs, pstmt 순으로 닫음
		}
		return null;
	}

	// 비밀번호 찾기
	public AdminVO admFpw(AdminVO avo) {

//		avo = null;		// 지역변수는 초기화 필수
		
		query = " SELECT adm_pw FROM admin WHERE adm_id = ? AND adm_name = ? AND adm_phone = ? ";
		try {	
					
			pstmt = con.prepareStatement(query);				
			pstmt.setString(1, avo.getAdmId());								// 3. 데이터 바인딩
			pstmt.setString(2, avo.getAdmName());								// 3. 데이터 바인딩
			pstmt.setString(3, avo.getAdmPhone());								// 3. 데이터 바인딩
			rs = pstmt.executeQuery();							// 4. 쿼리문 실행
			
			while(rs.next()) {			// 조회되는 레코드가 있다면 VO객체를 생성하여 해당 레코드 값을 저장
				avo = new AdminVO();	// 레코드를 저장할 객체
				avo.setAdmId(rs.getString("adm_id"));
				avo.setAdmName(rs.getString("adm_name"));
				avo.setAdmNick(rs.getString("adm_nick"));
				avo.setAdmPw(rs.getString("adm_pw"));
				avo.setAdmMail(rs.getString("adm_mail"));
				avo.setAdmAdd1(rs.getString("adm_add1"));
				avo.setAdmAdd2(rs.getString("adm_add2"));
				avo.setAdmAdd3(rs.getString("adm_add3"));
				avo.setAdmPhone(rs.getString("adm_phone"));
				avo.setAdmEmail(rs.getString("adm_email"));
				avo.setAdmPath(rs.getString("adm_path"));
				avo.setAdmBirth(rs.getDate("adm_birth"));
				avo.setAdmType(rs.getBoolean("adm_type"));
				avo.setAdmRegi(rs.getDate("adm_regi"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			DBConn.close(rs, pstmt);	// 사용했던 rs, pstmt 순으로 닫음
		}
		return avo;	
	}

}

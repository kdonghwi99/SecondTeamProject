package talkdog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import talkdog.util.DBConn;
import talkdog.vo.ProductVO;

public class ProductDAO {
	
	private String query; 				//쿼리문 저장 필드
	private PreparedStatement pstmt;	//매개변수(ex.아이디, 이름)가 있는 경우에는 pstmt를 사용하는 것이 적합
	private ResultSet rs;				//select쿼리를 실행한 결과를 저장할 ResulSet형 필드
	private boolean result;				//DML처리결과 여부 저장
	
	//기본 생성자 - con 객체 초기화

	    private Connection con;
	    
		public ProductDAO() {
			this.con = DBConn.getConnection();
		}
	    public ProductDAO(Connection con) {
	        this.con = con;
	    }

    // 상품 등록
	    public boolean productEnroll(ProductVO pvo) {
	        try {
	            
	            // insert 쿼리문
	            query = "INSERT INTO product VALUES (?,?,?,?,?,?,SYSDATE,NVL(?, 'default.png'),NVL(?, 'default.png'),?)";

	            // DBConn에 싱글톤패턴으로 만들어둔 커넥션 사용
	            pstmt = con.prepareStatement(query);
	            pstmt.setString(1, pvo.getpId());
	            pstmt.setString(2, pvo.getpName());
	            pstmt.setInt(3, pvo.getpVol());
	            pstmt.setString(4, pvo.getpDetail());
	            pstmt.setInt(5, pvo.getpPrice());
	            pstmt.setString(6, pvo.getpCate());
	            pstmt.setString(7, pvo.getpMimg());
	            pstmt.setString(8, pvo.getpImg());
	            pstmt.setString(9, pvo.getpType());
	            
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
    // 상품 수정
	    public boolean productUpdate(ProductVO pvo) {
	        try {
	            // UPDATE 쿼리문
	            query = "UPDATE product SET p_id=?, p_name=?, p_vol=?, p_detail=?, p_price=?, p_cate=?, p_mimg=NVL(?, p_mimg), p_img=NVL(?, p_img), p_type=? WHERE p_id=?";

	            // DBConn에 싱글톤패턴으로 만들어둔 커넥션 사용
	            pstmt = con.prepareStatement(query); //prepareStatement는 쿼리를 미리 준비해뒀으니까 매개변수로 query받음
	            pstmt.setString(1, pvo.getpId());
	            pstmt.setString(2, pvo.getpName());
	            pstmt.setInt(3, pvo.getpVol());
	            pstmt.setString(4, pvo.getpDetail());
	            pstmt.setInt(5, pvo.getpPrice());
	            pstmt.setString(6, pvo.getpCate());
	            pstmt.setString(7, pvo.getpMimg());
	            pstmt.setString(8, pvo.getpImg());
	            pstmt.setString(9, pvo.getpType());
	            pstmt.setString(10, pvo.getpId());

	            int execute = pstmt.executeUpdate();    // executeUpdate가 잘 되면, 성공 실행 건수 1이 반환됨
	            if (execute == 1) {
	                return true;
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            DBConn.close(pstmt);
	        }
	        return false;
	    }


    // 상품 삭제
    public boolean productDelete(String pid) {
    	try {
			// delete 쿼리문
			query = "DELETE FROM product WHERE p_id=?";
			
			pstmt = con.prepareStatement(query);		// prepareStatement는 쿼리를 미리 준비해뒀으니까 매개변수로 query받음
			
			pstmt.setString(1, pid);

			int execute = pstmt.executeUpdate(); // executeUpdate가 잘 되면, 성공 실행 건수 1이 반환됨
			if (execute == 1) {
				return true;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConn.close(pstmt);
		} 
		
		return false;
	}


    // 상품 상세 조회
    public ProductVO productSelect(String pid) {
    	
    ProductVO pvo = null;	// MemberVO의 객체 메모리 미리 준비	
		
		try {
			// select 쿼리문
			query = "SELECT * FROM product WHERE p_id=?";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pid);	// 물음표 바인딩
			
			rs = pstmt.executeQuery();	// 쿼리실행 -> 받는 값이 있는 read이므로 executeQuery();
			
			if(rs.next()) {		// 조회된 레코드가 있다면 MemberVO 객체를 생성하여 해당 레코드값을 저장
				pvo = new ProductVO();		// rs가 있을 때에만 mvo 생성
				pvo.setpId(rs.getString("p_id"));
				pvo.setpName(rs.getString("p_name"));
				pvo.setpVol(rs.getInt("p_vol"));
				pvo.setpDetail(rs.getString("p_detail"));
				pvo.setpPrice(rs.getInt("p_price")); 
				pvo.setpCate(rs.getString("p_cate"));
				pvo.setpMimg(rs.getString("p_mimg"));
				pvo.setpImg(rs.getString("p_img"));
				pvo.setpType(rs.getString("p_type"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConn.close(pstmt, rs);	// pstmt와 rs를 둘 다 닫아야 하므로 매개변수 두 개를 받는 close 메서드
		}

		return pvo;
	}

    
  //전체 게시물 수
  	public int totalCount(String type, String keyword) {
  		int cnt = 0;

  		try {
			query = " SELECT COUNT(*) FROM product ";

			if(!type.equals("") && !keyword.equals("")) {
				query += " WHERE " + type + " LIKE '%" + keyword + "%' ";
			}
			
			pstmt = con.prepareStatement(query);

			rs = pstmt.executeQuery();
			if (rs.next() == true) {				 
				cnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(pstmt, rs);
		}
		return cnt;
  	}
    
  	
	//전체 게시물 목록 - 페이징
	public List<ProductVO> selectAll(double amount, int pageNum, String type, String keyword ){	
		List<ProductVO> pvoList = new ArrayList<>();
		ProductVO pvo = null;	
		try {
			query = " SELECT * "
					+ "FROM    (SELECT ROWNUM AS rnum, b.* "
					+ "         FROM   (SELECT * FROM product ";
			
			if(!type.equals("") && !keyword.equals("")) {
				query += "      WHERE " + type + " LIKE '%" + keyword + "%' ";
			}
			
			query += "                  ORDER BY num DESC) b "
					+ "         WHERE  ROWNUM <= ? * ? ) "
					+ "WHERE  rnum > ? * ? ";
			
			pstmt = con.prepareStatement(query);
			pstmt.setDouble(1, amount);
			pstmt.setInt(2, pageNum);
			pstmt.setDouble(3, amount);
			pstmt.setInt(4, (pageNum - 1));

			rs = pstmt.executeQuery();
			while (rs.next() == true) {				 
				pvo = new ProductVO();
				pvo.setpId(rs.getString("p_id"));
				pvo.setpName(rs.getString("p_name"));	 
				pvo.setpVol(rs.getInt("p_vol"));	
				pvo.setpDetail(rs.getString("p_detail"));	 
				pvo.setpPrice(rs.getInt("p_price"));
				pvo.setpCate(rs.getString("p_cate"));	 
				pvo.setpDate(rs.getDate("p_date"));
				pvo.setpMimg(rs.getString("p_mimg"));
				pvo.setpImg(rs.getString("p_img"));
				pvo.setpType(rs.getString("p_type"));
				
				
				
				pvoList.add(pvo);  //List 객체에 추가
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(pstmt, rs);
		}
		return pvoList;
	}
	
	public List<ProductVO> selectAll(){	
		List<ProductVO> pvoList = new ArrayList<>();
		ProductVO pvo = null;	
		try {
			query = "SELECT * FROM product";
			pstmt = con.prepareStatement(query);		// 바인딩할 게 없어서 Statement 사용하면 더 편함		

			rs = pstmt.executeQuery();
			while (rs.next() == true) {				 
				pvo = new ProductVO();
				pvo.setpId(rs.getString("p_id"));
				pvo.setpName(rs.getString("p_name"));	 
				pvo.setpVol(rs.getInt("p_vol"));	
				pvo.setpDetail(rs.getString("p_detail"));	 
				pvo.setpPrice(rs.getInt("p_price"));
				pvo.setpCate(rs.getString("p_cate"));	 
				pvo.setpDate(rs.getDate("p_date"));
				pvo.setpMimg(rs.getString("p_mimg"));
				pvo.setpImg(rs.getString("p_img"));
				pvo.setpType(rs.getString("p_type"));
				
				
				
				pvoList.add(pvo);  //List 객체에 추가
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(pstmt, rs);
		}
		return pvoList;
	}
	
	//게시물 조회 수 증가
	public void updateHit(String pid) {
		try {
			query = " UPDATE product SET p_Hit = p_Hit + 1 WHERE p_id=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.close(pstmt);
		}
	}
}
	


package talkdog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import talkdog.vo.CartVO;
import talkdog.vo.ProductVO;

public class CartDAO {

	private Connection con;
    
	// setter/getter 말고 생성자로
	    public CartDAO(Connection con) {   
	      this.con = con;
	   }
	    
	   private String query;
	   private PreparedStatement pstmt;
	   private ResultSet rs;


	   //장바구니 전체 조회
	   public List<CartVO> cartSelectAll(String id){
		   //특정 회원의 장바구니를 조회하므로 매개변수로 id 필요
		   List<CartVO> cvoList = new ArrayList<CartVO>();
		   CartVO cvo = null;
			
			try {
				query = "SELECT * "
						+ " FROM (SELECT ROWNUM AS rnum, c.* "
						+ 				" FROM (SELECT * FROM cart  WHERE adm_id='" + id + "' ORDER BY cart_no DESC) c )";
				pstmt = con.prepareStatement(query);
				rs = pstmt.executeQuery();
				
				while (rs.next() == true) {				 
					cvo = new CartVO();
					cvo.setCartNo(rs.getInt("cart_no"));
					cvo.setCartRn(rs.getInt("rnum"));	 
					cvo.setpId(rs.getString("p_id"));	
					cvo.setAdmId(rs.getString("adm_id"));	 
					cvo.setCartQuan(rs.getInt("cart_quan"));
					cvo.setCartOpt(rs.getString("cart_opt"));
					
					cvoList.add(cvo);  //List 객체에 추가
				}	
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return cvoList;
	   }
	   
	   
	   //장바구니에 추가
	   public boolean cartInsert(String sid, String pId, int cartQuan, String cartOpt) {
		   try {
				// insert 쿼리문
				query = "INSERT INTO cart VALUES (CART_SEQ.NEXTVAL, ?, ?, ?, ?)";
				if(cartOpt==null) {
					cartOpt = "옵션없음";
				}
				System.out.println("cartOpt: " + cartOpt);
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, pId);
				pstmt.setString(2, sid);
				pstmt.setInt(3, cartQuan);
				pstmt.setString(4, cartOpt);
				
				int execute = pstmt.executeUpdate();	// executeUpdate가 잘 되면, 성공 실행 건수 1이 반환됨
				if(execute==1) {
					return true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return false;
	   }
	   
	   
	   //장바구니 개별삭제 (개별상품 삭제)
	   public boolean cartRemove(int cartNo) {				
				try {
					// delete 쿼리문
					query = "DELETE FROM cart WHERE cart_no=?";
					
					pstmt = con.prepareStatement(query);
					pstmt.setInt(1, cartNo);

					int execute = pstmt.executeUpdate(); // executeUpdate가 잘 되면, 성공 실행 건수 1이 반환됨
					if (execute == 1) {
						return true;
					}
				}catch (SQLException e) {
					e.printStackTrace();
				}
				return false;
	   }
	   
	   //장바구니 전체삭제 (특정회원의 장바구니 전체삭제)
	   public boolean cartRemoveAll(String sid) {
		   try {
				query = "DELETE FROM cart WHERE adm_id=?";
				
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, sid);

				int execute = pstmt.executeUpdate(); // executeUpdate가 잘 되면, 성공 실행 건수 1이 반환됨
				if (execute > 0) {
					return true;
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}
			return false;
	   }
	   
	   
	   
	   //장바구니 수정 (수량조절)
	   public boolean cartUpdate(int newQuan, int cartNo) {
		   try {
				// insert 쿼리문
				query = "UPDATE cart SET cart_quan=? WHERE cart_no=?";
				
				pstmt = con.prepareStatement(query); 	//prepareStatement는 쿼리를 미리 준비해뒀으니까 매개변수로 query받음
				pstmt.setInt(1, newQuan);
				pstmt.setInt(2, cartNo);
				
				int execute = pstmt.executeUpdate();	// executeUpdate가 잘 되면, 성공 실행 건수 1이 반환됨
				if(execute==1) {
					return true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return false;
	   }
	   
	   
	 //pId로 productVO  가져옴
	   public ProductVO getPvo(String pId) {
		   //장바구니 전체조회 시 -> pid로 상품명, 상품가격을 담은 vo반환메서드
		   
		   ProductVO pvo = null;
		   
		   try {
				query = "SELECT * FROM product WHERE p_id=?";
				
				pstmt = con.prepareStatement(query); 	//prepareStatement는 쿼리를 미리 준비해뒀으니까 매개변수로 query받음
				pstmt.setString(1, pId);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {		
					pvo = new ProductVO();		// rs가 있을 때에만 qvo 생성
					pvo.setpName(rs.getString("p_name"));
					pvo.setpPrice(rs.getInt("p_price"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return pvo;
	   }
	   
}

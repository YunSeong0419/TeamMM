
package com.mealmaker.babiyo.order.service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealmaker.babiyo.cart.dao.CartDao;
import com.mealmaker.babiyo.cart.model.CartDto;
import com.mealmaker.babiyo.cash.dao.CashDao;
import com.mealmaker.babiyo.order.dao.OrderDao;
import com.mealmaker.babiyo.order.model.OrderDetailDto;
import com.mealmaker.babiyo.order.model.OrderDto;
import com.mealmaker.babiyo.product.dao.ProductDao;
import com.mealmaker.babiyo.util.Paging;
import com.mealmaker.babiyo.util.SearchOption;

@Service
public class OrderServiceImpl implements OrderService{
	
	private final OrderDao orderDao;
	
	@Resource 
	private CashDao cashDao;
	
	@Resource
	private CartDao cartDao;
	
	@Resource
	private ProductDao productDao;
	
	@Autowired
	public OrderServiceImpl(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	@Override
	public int order(OrderDto orderDto, OrderDetailDto orderDetailDto) {
		// TODO Auto-generated method stub
		
		List<OrderDetailDto> detailList = orderDetailDto.getOrderDetailList();
		Map<Integer, Integer> stockMap = new HashMap<Integer, Integer>();
		
		for (OrderDetailDto detail : detailList) {
			int stock = productDao.stockView(detail.getProductNo());
			
			if(stock < detail.getQuantity()) {
				System.out.println("주문오류: 구매하려는 상품수가 재고보다 많습니다");
				return -1;
			}
			
			int productNo = detail.getProductNo();
			int quantity = detail.getQuantity();
			
			// map에 제품번호를 키로 판매하고 남은 개수를 밸류에 저장
			stockMap.put(productNo, stock-quantity);
		}
		
		// 금액 차감
		orderCashUpdate(orderDto);
		
		// 주문정보를 db에 저장
		orderDao.order(orderDto);
		
		int orderNo = orderDto.getNo();
		
		String memeberId = orderDto.getMemberId();
		
		orderDetailDto.setOrderNo(orderNo);
		
		// 주문상세내용을 db에 저장
		orderDao.orderDetail(orderDetailDto);
		
		CartDto cartDto = new CartDto();
		
		cartDto.setMemberId(memeberId);
		
		List<CartDto> cartList = new ArrayList<CartDto>();
		
		// 구매한 물품을 장바구니 db에서 삭제하기 위해서 배열에 저장
		for (OrderDetailDto detail : detailList) {
			CartDto cart = new CartDto();
			cart.setProductNo(detail.getProductNo());
			
			int productNo = detail.getProductNo();
			// 제품마다 남은개수를 맵에서 불러옴
			int stock = stockMap.get(productNo);
			
			// 구매한 상품개수 만큼 재고 차감
			productDao.stockUpdate(productNo, stock);
			
			cartList.add(cart);
		}
		
		cartDto.setCartList(cartList);
		
		// 배열에 들어있는 장바구니 삭제
		cartDao.cartDelete(cartDto);
		
		return orderNo;
	}

	@Override
	public OrderDto lastOrder(String memberId) {
		// TODO Auto-generated method stub
		return orderDao.lastOrder(memberId);
	}
	

	@Override
	public Map<String, Object> orderList(String memberId, SearchOption searchOption, int curPage) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		
		int totalCount = orderDao.memberOrderCount(memberId, searchOption);
		
		Paging paging = new Paging(totalCount, curPage);
		
		int begin = paging.getPageBegin();
		int end = paging.getPageEnd();
		
		List<OrderDto> orderList = orderDao.orderList(memberId, begin, end, searchOption);
		
		map.put("orderList", orderList);
		map.put("paging", paging);
		
		return map;
	}

	@Override
	public Map<String, Object> orderView(int orderNo) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		OrderDto orderDto = orderDao.orderView(orderNo);
		
		List<OrderDetailDto> orderDetailList = orderDao.orderDetailView(orderNo);
		
		map.put("orderDto", orderDto);
		map.put("orderDetailList", orderDetailList);
		
		return map;
	}

	@Override
	public int orderCancel(int orderNo) {
		// TODO Auto-generated method stub
		orderDao.orderCancel(orderNo);
		
		Map<String, Object> map = orderDao.totalAmountView(orderNo);
		List<OrderDetailDto> detailList = orderDao.orderDetailView(orderNo);
		
		// 주문취소시 상품의 개수 반환
		for (OrderDetailDto detail : detailList) {
			int productNo = detail.getProductNo();
			int stock = productDao.stockView(productNo);
			int quantity = detail.getQuantity();
			int updateStock = stock + quantity;
			
			productDao.stockUpdate(productNo, updateStock);
		}
		
		String memberId = (String)map.get("MEMBER_ID");
		int totalAmount = Integer.parseInt(map.get("TOTAL_AMOUNT").toString());
		
		cancelCashUpdate(memberId, totalAmount);
		
		return totalAmount;
	}

	@Override
	public List<Map<String, Object>> orderStateList() {
		// TODO Auto-generated method stub
		return orderDao.orderStateList();
	}


	@Override
	public Map<String, Object> adminOrderList(SearchOption searchOption, int curPage) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int totalCount = orderDao.adminOrderCount(searchOption);
		
		Paging paging = new Paging(totalCount, curPage);
		
		int begin = paging.getPageBegin();
		int end = paging.getPageEnd();
		
		List<OrderDto> orderList = orderDao.adminOrderList(begin, end, searchOption);
		
		map.put("paging", paging);
		map.put("orderList", orderList);
		
		return map;
	}

	@Override
	public void orderAccept(int orderNo) {
		// TODO Auto-generated method stub
		orderDao.orderAccept(orderNo);
	}


	@Override
	public List<OrderDetailDto> salesView(SearchOption searchOption) {
		// TODO Auto-generated method stub
		return orderDao.orderDetailList(searchOption);
	}

	
	public void orderCashUpdate(OrderDto orderDto) {
		
		String memberId = orderDto.getMemberId();
		int totalAmount = orderDto.getTotalAmount();
		
		// 유저의 돈을 뺌
		cashDao.cashUpdateOne(memberId, totalAmount * -1);
		
		// 받은돈을 증가시킴
		cashDao.cashUpdateOne("admin", totalAmount);
	}
	
	public void cancelCashUpdate(String memberId, int totalAmount) {
		
		// 취소한 주문금액만큼 차감
		cashDao.cashUpdateOne("admin", totalAmount * -1);
		
		// 유저의 돈을 돌려줌
		cashDao.cashUpdateOne(memberId, totalAmount);
		
	}

	

}

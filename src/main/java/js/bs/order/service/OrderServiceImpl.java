package js.bs.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import js.bs.order.dao.OrderDAO;
import js.bs.order.vo.OrderVO;

@Service("orderService")
@Transactional(propagation = Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;

	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws Exception {
		List<OrderVO> orderGoodsList;
		orderGoodsList = orderDAO.listMyOrderGoods(orderVO);

		return orderGoodsList;
	}

	public void addNewOrder(List<OrderVO> myOrderList) throws Exception {
		orderDAO.insertNewOrder(myOrderList);
		orderDAO.removeGoodsFromCart(myOrderList);
	}

	public OrderVO findMyOrder(String order_id) throws Exception {
		return orderDAO.findMyOrder(order_id);
	}
}

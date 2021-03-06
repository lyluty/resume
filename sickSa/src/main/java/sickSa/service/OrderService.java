package sickSa.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sickSa.domain.Order;
import sickSa.domain.OrderDetail;
import sickSa.domain.Product;
import sickSa.domain.ProductCategory;
import sickSa.domain.Table;
import sickSa.mapper.OrderDao;
import sickSa.mapper.ProductDao;
import sickSa.mapper.TableDao;

@Service
public class OrderService {

	@Autowired
	private OrderDao orderDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	TableDao tableDao;

	/* 전체 테이블리스트 */
	public List<Table> tableList() {
	  return tableDao.selectTableList();
	}
	
	/* 잔여좌석 확인 */
	public int getRestTableCount() {
	  return tableDao.selectRestTableCount();
	}

	/* 결제 완료 - 레코드 생성 */
	public Order createOrder(List<OrderDetail> sCart, int tableNo, String paymentMethod) {
		int orderId = orderDao.selectOrderSequence();
		int total = 0;
		for (OrderDetail orderDetail : sCart) {
			Product product = orderDetail.getProduct();
			total += product.getPdt_price() * orderDetail.getOrdt_amount();
		}
		Order order = new Order(orderId, total, paymentMethod, tableNo, sCart);
		orderDao.insertOrder(order);
		for (OrderDetail orderDetail : sCart) {
			orderDetail.setOrd_id(orderId);
			orderDao.insertOrderDetail(orderDetail);
		}
		Table table = tableDao.selectTable(tableNo);
		table.setTbl_is_empty("FALSE");
		tableDao.updateTable(table);
		order.setOrd_date(orderDao.selectOrderDate(orderId));
		return order;
	}

	public void setOrder(Order order) {
		orderDao.updateOrder(order);
	}

	/* 전체목록 불러오기 */
	public List<Order> orderList() {
		return orderDao.selectOrderList();
	}

	public List<ProductCategory> productCategoryList() {
		return productDao.selectProductCategoryList();
	}

	public List<Product> productListByCategoryId(int categoryId) {
		return productDao.selectProductListByCategoryId(categoryId);
	}

	public List<OrderDetail> addToCart(List<OrderDetail> sCart, Product product) {
		List<OrderDetail> cart = sCart == null ? new ArrayList<OrderDetail>() : sCart;
		for (OrderDetail orderDetail : cart) {
			if (orderDetail.getPdt_id() == product.getPdt_id()) {
				orderDetail.setOrdt_amount(orderDetail.getOrdt_amount() + 1);
				return cart;
			}
		}
		cart.add(new OrderDetail(product));
		return cart;
	}

	public Product getProduct(int productId) {
		return productDao.selectProductByProductId(productId);
	}
	
	public List<OrderDetail> setOrdtAmount(List<OrderDetail> sCart, int pId, int amount) {
		for (OrderDetail orderDetail : sCart) {
			if (orderDetail.getPdt_id() == pId) {
				orderDetail.setOrdt_amount(amount);
				break;
			}
		}
		return sCart;
	}
}

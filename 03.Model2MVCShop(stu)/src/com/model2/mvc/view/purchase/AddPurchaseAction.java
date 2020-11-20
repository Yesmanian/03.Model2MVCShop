package com.model2.mvc.view.purchase;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;

public class AddPurchaseAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Product productVO = (Product)session.getAttribute("productVO");
		User userVO=(User)session.getAttribute("user");
			
		Purchase vo = new Purchase();
		vo.setBuyer(userVO);
		vo.setDivyAddr(request.getParameter("receiverAddr"));
		vo.setDivyDate(request.getParameter("receiverDate"));
		vo.setDivyRequest(request.getParameter("receiverRequest"));
		//vo.getOrderDate();
		vo.setPaymentOption(request.getParameter("paymentOption"));
		vo.setPurchaseProd(productVO);
		vo.setReceiverName(request.getParameter("receiverName"));
		vo.setReceiverPhone(request.getParameter("receiverPhone"));
		
		PurchaseService service = new PurchaseServiceImpl();
		service.addPurchase(vo);
		System.out.println("addPurchaseAction¿¡¼­ÀÇ purchaseVO :"+vo);
		
		request.setAttribute("vo", vo);
		
		return "forward:/purchase/addPurchase.jsp";
	}
	
}

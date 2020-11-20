package com.model2.mvc.view.product;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.framework.Action;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;


public class ListProductAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
			
			Search searchVO = new Search();
			
			
			int currentPage = 1;
			System.out.println("1"+currentPage);
			if(request.getParameter("currentPage") != null){
				System.out.println("2"+currentPage);
				if(request.getParameter("currentPage").equals("")) {
					currentPage = 1;
				}else {
				currentPage=Integer.parseInt(request.getParameter("currentPage"));
				System.out.println("3"+currentPage);
				}
			}	
			searchVO.setCurrentPage(currentPage);
			System.out.println(currentPage);
			searchVO.setSearchCondition(request.getParameter("searchCondition"));
			System.out.println("��ġ��"+request.getParameter("searchCondition"));
			searchVO.setSearchKeyword(request.getParameter("searchKeyword"));
			
			int pageSize = Integer.parseInt( getServletContext().getInitParameter("pageSize"));
			int pageUnit  =  Integer.parseInt(getServletContext().getInitParameter("pageUnit"));
			searchVO.setPageSize(pageSize);
			
			//Business logic
			ProductService service = new ProductServiceImpl();
			Map<String,Object> map=service.getProductList(searchVO);
			
			Page resultPage	= 
					new Page( currentPage, ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
			System.out.println("ListUserAction ::"+resultPage);
			
			request.setAttribute("list", map.get("list"));
			request.setAttribute("resultPage", resultPage);
			request.setAttribute("search", searchVO);
			
			String role = request.getParameter("menu");
			request.setAttribute("menu", role);

				return "forward:/product/listProduct.jsp";

		}
}

package edu.osu.cse5234.controller;
import java.io.IOException;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.osu.cse5234.business.view.Item;
import edu.osu.cse5234.model.Order;
import edu.osu.cse5234.model.PaymentInfo;
import edu.osu.cse5234.model.ShippingInfo;
import edu.osu.cse5234.util.ServiceLocator;

@Controller
@RequestMapping("/purchase")
public class Purchase 
{	
	@RequestMapping( method = RequestMethod.GET)
	public String viewOrderEntryForm(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{// ... instantiate and set order object with items to display
		Order order = new Order();
		List<Item> items = ServiceLocator.getInventoryService().getAvailableInventory().getItems();
		for(Item item : items) {
			item.setQuantity("0");
		}
		order.setItems(items);
		request.setAttribute("order", order);
		return "OrderEntryForm";
	}
	
	@RequestMapping(path = "/checkQuantityItems", method = RequestMethod.POST)
	public void checkQuantityItems(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		String item = request.getParameter("item");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		if(item.equals("Potatoes") && quantity > 10) {
			response.sendError(400, "Potatoes quantity should be less than 10");
		}
		if(item.equals("Tomatoes") && quantity > 15) {
			response.sendError(400, "Tomatoes quantity should be less than 15");
		}
		if(item.equals("Onions") && quantity > 10) {
			response.sendError(400, "Onions quantity should be less than 10");
		}
		if(item.equals("Chips") && quantity > 25) {
			response.sendError(400, "Chips quantity should be less than 25");
		}
		if(item.equals("Milk") && quantity > 5) {
			response.sendError(400, "Milk quantity should be less than 5");
		}
		
	}
	
	@RequestMapping(path = "/submitItems", method = RequestMethod.POST)
	public String submitItems(@ModelAttribute("order") Order order, HttpServletRequest request) 
	{
		if(ServiceLocator.getOrderProcessingService().validateItemAvailability(order)) {
			request.getSession().setAttribute("order", order);
			request.getSession().removeAttribute("quantityError");
			return "redirect:/purchase/paymentEntry";
		}
		request.getSession().setAttribute("quantityError", "Please resubmit quantities");
		return "redirect:/purchase";
	}	
	@RequestMapping(path = "/paymentEntry", method = RequestMethod.GET)
	public String viewPaymentEntryForm(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		request.setAttribute("paymentInfo", new PaymentInfo());
		return "PaymentEntryForm";
	}
	@RequestMapping(path = "/submitPayment", method = RequestMethod.POST)
	public String submitPayment(@ModelAttribute("paymentInfo") PaymentInfo paymentInfo, HttpServletRequest request) 
	{
		request.getSession().setAttribute("paymentInfo", paymentInfo);
		return "redirect:/purchase/shippingEntry";
	}
	@RequestMapping(path = "/shippingEntry", method = RequestMethod.GET)
	public String viewShippingEntryForm(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		request.setAttribute("shippingInfo", new ShippingInfo());
		return "ShippingEntryForm";
	}
	@RequestMapping(path = "/submitShipping", method = RequestMethod.POST)
	public String submitPayment(@ModelAttribute("shippingInfo") ShippingInfo shippingInfo, HttpServletRequest request) 
	{
		request.getSession().setAttribute("shippingInfo", shippingInfo);
		return "redirect:/purchase/viewOrder";
	}
	@RequestMapping(path = "/viewOrder", method = RequestMethod.GET)
	public String viewOrder(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		return "ViewOrder";
	}
	@RequestMapping(path = "/confirmOrder", method = RequestMethod.POST)
	public String submitOrder(HttpServletRequest request) 
	{
		Order order = (Order) request.getSession().getAttribute("order");
		String orderNumber = ServiceLocator.getOrderProcessingService().processOrder(order);
		request.getSession().setAttribute("orderNumber", orderNumber);
		return "redirect:/purchase/viewConfirmation";
	}
	@RequestMapping(path = "/viewConfirmation", method = RequestMethod.GET)
	public String viewConfirmation(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		return "Confirmation";
	}
}
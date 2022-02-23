package com.sportyshoes.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sportyshoes.controller.service.AdminDao;
import com.sportyshoes.controller.service.CartDao;
import com.sportyshoes.controller.service.CategoryDao;
import com.sportyshoes.controller.service.OrderDao;
import com.sportyshoes.controller.service.ProductDao;
import com.sportyshoes.controller.service.UserDao;
import com.sportyshoes.controller.entities.Address;
import com.sportyshoes.controller.entities.Admin;
import com.sportyshoes.controller.entities.Cart;
import com.sportyshoes.controller.entities.Category;
import com.sportyshoes.controller.entities.Orders;
import com.sportyshoes.controller.entities.Product;
import com.sportyshoes.controller.entities.User;

@Controller
public class CrudController {

	@Autowired
	ProductDao dao_prod;
	@Autowired
	CategoryDao dao_cat;
	@Autowired
	UserDao dao_user;
	@Autowired
	OrderDao dao_order;
	@Autowired
	CartDao dao_cart;
	@Autowired
	AdminDao dao_admin;
	
	/////// User Related Options
	
	@RequestMapping("/login")
	public ModelAndView login(@RequestParam("email") String email,@RequestParam("password") String password, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		User user = dao_user.findByEmail(email);
		List<Cart> carts = new ArrayList<Cart>(); 
		if(user!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("email", user.getEmail());
			session.setAttribute("carts",carts);
			session.setAttribute("isAdmin", false);
			List<Category> categories = dao_cat.getAll();
			mv.addObject("categories", categories);
			mv.setViewName("home");
		}
		else {
			mv.setViewName("login");
		}
		return mv;
	}
	

	@RequestMapping("/productbycat")
	public ModelAndView productByCat(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		Category c = dao_cat.getById(id);
		System.out.println(c.getId() +" "+c.getName());
		List<Product> productlist = c.getProducts();
		for(Product pr : productlist)
			System.out.println(pr.getName());
		
		mv.addObject("category", c.getName());
		mv.addObject("products", productlist);
		mv.setViewName("productlistbycat");
		return mv;
	}
	
	@RequestMapping("/addtocart")
	public ModelAndView addToCart(@RequestParam("id") int id, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session= request.getSession(false);
		 List<Cart> carts = (List<Cart>)session.getAttribute("carts");
		 Product p = dao_prod.getById(id);
		 Cart c = new Cart();
		 c.setCartProduct(p);
		 c.setQuantity(1);
		 carts.add(c);
		 session.setAttribute("carts", carts);
		int c_id = p.getCategory().getId();
		Category cid = dao_cat.getById(c_id);
		List<Product> productlist = cid.getProducts();
		mv.addObject("category", cid.getName());
		mv.addObject("products", productlist);
		mv.setViewName("productlistbycat");
		return mv;
	}

	@RequestMapping("/removefromcart")
	public ModelAndView removeFromCart(@RequestParam("id") int id, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session= request.getSession(false);
		 List<Cart> carts = (List<Cart>)session.getAttribute("carts");
		 Product p = dao_prod.getById(id);
		 for(Cart ct : carts) {
			 if(ct.getCartProduct().getId() == id) {
				 carts.remove(ct);
				 break;
			 }
		 }
		session.setAttribute("carts", carts);
		mv.setViewName("cartitems");
		return mv;
	}
	
	/*
	@RequestMapping("/orderdetails")
	public ModelAndView orderDetail() {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	*/
	
	@RequestMapping("/checkout")
	public ModelAndView checkout(@RequestParam("society") String society,@RequestParam("city") String city,@RequestParam("state") String state,@RequestParam("pincode") int pincode ,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session= request.getSession(false);
		Address addrs = new Address();
		addrs.setCity(city);
		addrs.setSociety(society);
		addrs.setPincode(pincode);
		addrs.setState(state);
		Orders orders = new Orders();
		orders.setAddrs(addrs);
	//	LocalDate localDate = LocalDate.now();	
	    Date date = new Date();  
	    SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");  
	    String strDate = formatter.format(date);  
	    System.out.println("Date Format with MM-dd-yyyy : "+strDate);  

	  
		orders.setDate(strDate);
		double grandtotal = (Double)session.getAttribute("totalamount");
		orders.setAmount(grandtotal);
		String useremail = (String)session.getAttribute("email");
		User user = dao_user.findByEmail(useremail);
		orders.setUser(user);
		Orders placedOrder = dao_order.insert(orders);
		
		List<Cart> carts = (List<Cart>)session.getAttribute("carts");
		for(Cart cart : carts) {
			Product p = cart.getCartProduct();
			int quantity = cart.getQuantity();
			dao_prod.updateQuantity(p.getId(),quantity);
			cart.setOrders(placedOrder);
			dao_cart.insert(cart);
		}
	//	List<Orders> purchaselist = dao_order.getAll();
	//	mv.addObject("purchaselist", purchaselist);
		Orders order_d = dao_order.getById(placedOrder.getId());
		List<Cart> carts1 = order_d.getCarts();
		mv.addObject("placedorder", order_d);
		mv.addObject("carts", carts1);

		mv.setViewName("placedorderdetails");
		return mv;
	}

	@RequestMapping("/register")
	public ModelAndView registerUser(@RequestParam("fname") String fname, @RequestParam("lname") String lname, @RequestParam("email") String email, @RequestParam("password") String password) {
		ModelAndView mv = new ModelAndView();
		User user = new User();
		user.setFirstName(fname);
		user.setLastName(lname);
		user.setEmail(email);
		user.setPassword(password);
		User c1 =dao_user.insert(user);
		mv.setViewName("login");
		return mv;
	}
	
	@RequestMapping("/home")
	public ModelAndView home() {
		ModelAndView mv= new ModelAndView();
		List<Category> categories = dao_cat.getAll();
		mv.addObject("categories", categories);
		mv.setViewName("home");
		return mv;
	}

	@RequestMapping("/products")
	public ModelAndView  productList() {
		ModelAndView mv= new ModelAndView();
		List<Product> products = dao_prod.getAll();
		mv.addObject("products", products);
		mv.setViewName("products");
		return mv;
	}
	
	@RequestMapping("/purchasedetails")
	public ModelAndView purchaseDetails(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		Orders order_d = dao_order.getById(id);
		List<Cart> carts = order_d.getCarts();
		mv.addObject("placedorder", order_d);
		mv.addObject("carts", carts);
		mv.setViewName("orderdetails");
		return mv;
	}
	
	@RequestMapping("/purchase")
	public ModelAndView purchaseList() {
		ModelAndView mv = new ModelAndView();
		List<Orders> purchaselist = dao_order.getAll();
		mv.addObject("purchaselist", purchaselist);
		mv.setViewName("purchaselist");
		return mv;
	}
	
	//////	Admin Related Options

	@RequestMapping("/changepassword")
	public ModelAndView changePassword(HttpServletRequest request,@RequestParam("new_password") String password,@RequestParam("confirm_password") String confirmpassword ) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(false);
		String email= (String)session.getAttribute("email");
		if(password.equals(confirmpassword)) {
			dao_admin.updatePassword(email,password);
			mv.setViewName("adminlogin");
		}
		else
			mv.setViewName("changepassword");
		return mv;
	}
	
	@RequestMapping("/category")
	public ModelAndView category() {
		ModelAndView mv = new ModelAndView();
		List<Category> categories = dao_cat.getAll();
		mv.addObject("categories", categories);
		mv.setViewName("categorylist");
		return mv;
	}
	
	@RequestMapping("/addcategory")
	public ModelAndView addCategory(@RequestParam("name") String name) {
		ModelAndView mv = new ModelAndView();
		Category c = new Category();
		c.setName(name);
		Category c1 =dao_cat.insert(c);
		System.out.println(c1);
		List<Category> categories = dao_cat.getAll();
		mv.addObject("categories", categories);
		mv.setViewName("categorylist");
		return mv;
	}
	
	@RequestMapping("/deletecategory")
	public ModelAndView deleteCategory(@RequestParam("id") String id) {
		ModelAndView mv = new ModelAndView();
		String msg =dao_cat.deleteById(Integer.parseInt(id));
		List<Category> categories = dao_cat.getAll();
		mv.addObject("categories", categories);
		mv.setViewName("categorylist");
		return mv;
	}

	@RequestMapping("/addnewproduct")
	public ModelAndView addNewProduct(@RequestParam("name") String name, @RequestParam("price") double prince, @RequestParam("category") String category) {
		ModelAndView mv = new ModelAndView();
		Product prod = new Product();
		prod.setName(name);
		prod.setPrice(prince);
		Category c = dao_cat.findByName(category);
		prod.setCategory(c);
		prod.setQuantity(10);
		prod.setSize(11);
		Product c1 =dao_prod.insert(prod);
		mv.setViewName("productlist");
		return mv;
	}
	
	@RequestMapping("/addquantity")
	public ModelAndView addProductQuantity(@RequestParam("id") int id,@RequestParam("quantity") int quantity) {
		ModelAndView mv = new ModelAndView();
		System.out.println(id+ " "+ quantity);
		dao_prod.updateToQuantity(quantity,id);
		List<Product> products = dao_prod.getAll();
		mv.addObject("products", products);
		mv.setViewName("products");
		return mv;
	}
	
	@RequestMapping("/users")
	public ModelAndView userList() {
		ModelAndView mv = new ModelAndView();
		List<User> users =dao_user.getAll();
		mv.addObject("users", users);
		mv.setViewName("userlist");
		return mv;
	}
	
	@RequestMapping("/admindashboard")
	public ModelAndView adminDashboard() {
		ModelAndView mv = new ModelAndView();
		int totalUser = dao_user.getTotalNumberOfUser();
		int totalOrder = dao_order.getTotalNumberOfOrder();
		mv.addObject("totaluser", totalUser);
		mv.addObject("totalorder", totalOrder);
		mv.setViewName("dashboard");
		return mv;
	}
	
	@RequestMapping("/adminlogin")
	public ModelAndView adminLogin(@RequestParam("email") String email,@RequestParam("password") String password, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Admin admin = dao_admin.findByEmail(email);		 
		if(admin!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("email", admin.getEmail());
			session.setAttribute("isAdmin", true);
			int totalUser = dao_user.getTotalNumberOfUser();
			int totalOrder = dao_order.getTotalNumberOfOrder();
			mv.addObject("totaluser", totalUser);
			mv.addObject("totalorder", totalOrder);
			mv.setViewName("dashboard");
		}
		else {
			mv.setViewName("adminlogin");
		}
		return mv;
	}
	
	@RequestMapping("/searchuser")
	public ModelAndView searchUserByName(@RequestParam("searchname") String name) {
		ModelAndView mv = new ModelAndView();
		List<User> users = dao_user.findAllByName(name);
		mv.addObject("users", users);
		mv.setViewName("userlist");
		return mv;
	}

	@RequestMapping("/searchorder")
	public ModelAndView searchOrdersByCategoryAndDate(@RequestParam("category") String category, @RequestParam("searchdate") String date ) {
		ModelAndView mv = new ModelAndView();
		List<Orders> orderbycat = new ArrayList<Orders>();
		List<Orders> orderlist = dao_order.filterByDate(date);
		for(Orders o : orderlist) {
			List<Cart> cart = o.getCarts();
			for(Cart c : cart) {
				Product prod = c.getCartProduct();
				if(prod.getCategory().getName() == category);
					orderbycat.add(o);
			}				
		}
		mv.addObject("purchaselist", orderbycat);
		mv.setViewName("purchaselist");
		return mv;
	}

	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(false);
		boolean isAdmin = (Boolean)session.getAttribute("isAdmin");
		if(isAdmin)
			mv.setViewName("adminlogin");
		else
			mv.setViewName("login");
		session.invalidate();
		return mv;
	}
}

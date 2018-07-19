package controller.invoice;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import controller.PMF;
import controller.users.AccessControllerU;
import model.entity.*;

public class EditController extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (AccessControllerU.isPermited(req.getServletPath(), req, resp, this)){
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Invoice user = pm.getObjectById(Invoice.class, Long.parseLong(req.getParameter("id")));
		req.setAttribute("invoice", user);
		String query = "SELECT FROM "+ Product.class.getName();
		List<Product> products = (List<Product>)pm.newQuery(query).execute();
		req.setAttribute("products", products);
		pm.close();
		RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Bills/edit.jsp");
		rd.forward(req, resp);
		}
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		Invoice user = pm.getObjectById(Invoice.class, Long.parseLong(req.getParameter("id")));
		try {
			user.setMade(date.parse(req.getParameter("date")));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		user.setIdProduct(Long.parseLong(req.getParameter("product")));
		user.setName(req.getParameter("name"));
		user.setAddress(req.getParameter("address"));
		user.setRUC(req.getParameter("ruc"));
		pm.close();
		req.setAttribute("invoice", user);
		resp.sendRedirect("/bills/view?id="+req.getParameter("id"));
	}
}

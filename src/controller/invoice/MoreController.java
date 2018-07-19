package controller.invoice;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.repackaged.org.joda.time.DateTimeZone;
import com.google.appengine.repackaged.org.joda.time.LocalDateTime;

import controller.users.AccessControllerU;
import controller.PMF;
import model.entity.*;

public class MoreController extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Invoice invoice = pm.getObjectById(Invoice.class, Long.parseLong(request.getParameter("idBill")));
		Product product = pm.getObjectById(Product.class, Long.parseLong(request.getParameter("product")));
		int quant=Integer.parseInt(request.getParameter("quant"));
		long idProd= Long.parseLong(request.getParameter("product"));
		Boolean more =Boolean.parseBoolean( request.getParameter("more"));
		if(product.getstock()<quant){
			RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Errores/unstock.jsp");
			rd.forward(request, response);
		}
		else{
			product.setSaled(product.saled+quant);
			product.setStock(product.getstock()-quant);
			invoice.setCola(idProd, quant);
			if(more){
				pm.close();
				response.sendRedirect("/bills");
			}
			else {
				String query = "SELECT FROM "+ Product.class.getName();
				List<Product> products = (List<Product>)pm.newQuery(query).execute();
				request.setAttribute("products", products);
				request.setAttribute("idBill", invoice.getId());
				pm.close();
				RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Bills/more.jsp");
				rd.forward(request, response);
			}
		}
	}

}

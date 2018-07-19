
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

public class AddController extends HttpServlet {
	public static int NRecibo= 1;
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (AccessControllerU.isPermited(req.getServletPath(), req, resp, this)){	
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String query = "SELECT FROM "+ Product.class.getName();
		List<Product> products = (List<Product>)pm.newQuery(query).execute();
		req.setAttribute("products", products);
		RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Bills/add.jsp");
		rd.forward(req, resp);
}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Boolean more= Boolean.parseBoolean(request.getParameter("more"));
		Product product = pm.getObjectById(Product.class, Long.parseLong(request.getParameter("product")));
		int quant=Integer.parseInt(request.getParameter("quant"));
		String address=request.getParameter("address").replace(" ", "");
		String ruc= request.getParameter("ruc");
		String name= request.getParameter("name").replace(" ","");
		long idProd= Long.parseLong(request.getParameter("product"));
		if(product.getstock()<quant){
			RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Errores/unstock.jsp");
			rd.forward(request, response);
		}
		else{
			Invoice invoice = new Invoice(product.getCostF(),quant,address,ruc,name,NRecibo,idProd);
			product.setSaled(product.saled+quant);
			product.setStock(product.getstock()-quant);
			if(!address.equals("")&&!name.equals("")){
				pm.makePersistent(invoice);
			}
			else{
				pm.close();
				response.sendRedirect("/bills");
			}
			if(more){
				pm.close();
				NRecibo++;
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


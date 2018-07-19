package controller.products;

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

import controller.PMF;
import controller.users.AccessControllerU;
import model.entity.*;;

public class AddController extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	if (AccessControllerU.isPermited(req.getServletPath(), req, resp, this)){
		RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Products/add.jsp");
		rd.forward(req, resp);
	}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		boolean crea=true;
		if (AccessControllerU.isPermited(request.getServletPath(), request, response, this)){
		PersistenceManager pm = PMF.get().getPersistenceManager();
		double costI= Double.parseDouble(request.getParameter("costI"));
		double costF= Double.parseDouble(request.getParameter("costF"));
		int stock=Integer.parseInt(request.getParameter("quant"));
		String nombre=request.getParameter("nombre").replace(" ", "");
		String brand=(request.getParameter("brand").replace(" ",""));
		String code=(request.getParameter("code"));
		Product invoice = new Product(nombre,costI,costF,stock,code,brand);
		
		String query = "SELECT FROM "+ Product.class.getName();
		List<Product> users = (List<Product>)pm.newQuery(query).execute();
		for(int i=0; i<users.size();i++){
			if(users.get(i).compareTo(invoice)==true){
				crea=false;
				break;
			}
		}
	if(crea&&!nombre.equals("")&&!code.equals("")){	
		pm.makePersistent(invoice);
	}
		pm.close();
		response.sendRedirect("/products");
	}
	}
}


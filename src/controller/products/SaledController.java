package controller.products;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import controller.PMF;
import controller.users.AccessControllerU;
import model.entity.*;

public class SaledController extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//if (AccessControllerU.isPermitedIndex(req.getServletPath(), req, resp, this)){
			PersistenceManager pm = PMF.get().getPersistenceManager();
			String query = "SELECT FROM "+ Product.class.getName();
			List<Product> users = (List<Product>)pm.newQuery(query).execute();
			 int n = users.size();
			    Product temp ;
			   
			    for (int i = 0; i < n; i++) {
			        for (int j = 1; j < (n - i); j++) {
			            if (users.get(j-1).saled> users.get(j).saled) {
			                temp = users.get(j - 1);
			                users.set(j - 1,users.get(j));
			                users.set(j,temp);
			            }

			        }   
			    }
			    
			    
			pm.close();
			req.setAttribute("users", users);
			RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Products/mostsaled.jsp");
			rd.forward(req, resp);
		//}
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		doGet(req,resp);
	}
}

package controller.products;
import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import controller.PMF;
import controller.users.AccessControllerU;
import model.entity.*;
public class DeleteController extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (AccessControllerU.isPermited(req.getServletPath(), req, resp, this)){
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Product user = pm.getObjectById(Product.class, new Long(req.getParameter("id")).longValue());
		String query = "SELECT FROM "+ Invoice.class.getName();
		List<Invoice> users = (List<Invoice>)pm.newQuery(query).execute();
		for(int i=0;i<users.size();i++){
			if(users.get(i).getIdProduct()==user.getId()){
				pm.deletePersistent(users.get(i));
			}
		}
		if (user!=null){
			pm.deletePersistent(user);
		}
		pm.close();
		resp.sendRedirect("/products");
	}
	}
}

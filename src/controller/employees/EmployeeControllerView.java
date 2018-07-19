package controller.employees;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.UserServiceFactory;

import controller.PMF;
import model.entity.Access;
import model.entity.Employee;
import model.entity.Resource;
import model.entity.Usuario;

public class EmployeeControllerView extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
com.google.appengine.api.users.User uGoogle =UserServiceFactory.getUserService().getCurrentUser();
		
		// Vefiricando Login
		if(uGoogle==null){
			RequestDispatcher dp =getServletContext().getRequestDispatcher("/WEB-INF/Views/Errores/error1.jsp");
			dp.forward(request, response);
			
		}else{
			System.out.println(uGoogle.getEmail()+"j");
			//PMF para consultas
			PersistenceManager pm=PMF.get().getPersistenceManager();
			//buscando usuarios registrado   activo con el email
			String query ="select from " + Usuario.class.getName() +
					" where email=='" + uGoogle.getEmail() + "'" +
					" && status==true";
			
			System.out.println(query);
			List<Usuario> uSearch =(List<Usuario>) pm.newQuery(query).execute();
			//Verificando Usuario registrado
			if(uSearch.isEmpty()){
				RequestDispatcher dp =getServletContext().getRequestDispatcher("/WEB-INF/Views/Errores/error2.jsp");
				dp.forward(request, response);
			}else{
				System.out.println(request.getServletPath());
				//Buscando resource registrado activo de acuerdo a la URL
				String query2= "select from " + Resource.class.getName() +
						" where url=='"+ request.getServletPath() + "'" +
						" && status==true";
				List<Resource> rSearch =(List<Resource>) pm.newQuery(query2).execute();
				//verificando recurso registrado
				if(rSearch.isEmpty()){
					RequestDispatcher dp =getServletContext().getRequestDispatcher("/WEB-INF/Views/Errores/error3.jsp");
					dp.forward(request, response);
				}else{
					System.out.println(request.getServletPath());
					String query3="select from "+Access.class.getName()+
							" where idRole=="+ uSearch.get(0).getIdRole()+
							" && idResource=="+ rSearch.get(0).getId()+
							" && status==true";
					List<Access> aSearch =(List <Access>)pm.newQuery(query3).execute();
					//verificando acceso registrado//
					if(aSearch.isEmpty()){
						RequestDispatcher dp =getServletContext().getRequestDispatcher("/WEB-INF/Views/Errores/error4.jsp");
						dp.forward(request, response);
						
					}else{
						
						if(request.getParameter("action").equals("reading")){
							 String query5 = "select from " + Employee.class.getName();
							 List<Employee> employees = (List<Employee>)pm.newQuery(query5).execute();
							 for(int i = 0;i<employees.size() && employees.get(i) != null;i++){
								
								 if(employees.get(i).getId()== Long.parseLong((request.getParameter("employeeId")))){
									 request.setAttribute("employee", employees.get(i));
									 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Employees/read.jsp");
									 dispatcher.forward(request, response);
									 break;
								 }
							 }
							}
							else{
								System.out.println("Error");
							}
						
					}
				}
			}
			
		}
		
		/*if(request.getParameter("action").equals("reading")){
		 PersistenceManager pm = PMF.get().getPersistenceManager();
		 String query = "select from " + Employee.class.getName();
		 List<Employee> employees = (List<Employee>)pm.newQuery(query).execute();
		 for(int i = 0;i<employees.size() && employees.get(i) != null;i++){
			
			 if(employees.get(i).getId()== Long.parseLong((request.getParameter("employeeId")))){
				 request.setAttribute("employee", employees.get(i));
				 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Employees/read.jsp");
				 dispatcher.forward(request, response);
				 break;
			 }
		 }
		}
		else{
			System.out.println("Error");
		}*/
	}
}
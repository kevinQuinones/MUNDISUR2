package controller.invoice;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.PMF;
import model.entity.Invoice;

public class PrintController extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	/*try{

			String type="";

			if(state == SEARCH_PRESCRIPTION)
				type = "Prescription ";
			else if(state == SEARCH_ILLNESS)
				type = "Illness ";

			displayInformation("Please wait while system detects printer information.\n(Click OK to continue)");

			Calendar calendar = new GregorianCalendar();

			patientsTable.print(JTable.PrintMode.valueOf("FIT_WIDTH"), 
					new MessageFormat("SuCure System Patient "+type+"Report"),
					new MessageFormat("Reported on "+ calendar.get(Calendar.DAY_OF_MONTH) + " - " + 
							(calendar.get(Calendar.MONTH) + 1) + " - " + 
							calendar.get(Calendar.YEAR) + "    " + 
							calendar.get(Calendar.HOUR_OF_DAY) + " : " + calendar.get(Calendar.MINUTE)
							) 
					);

		}
		catch(Exception e)
		{
			displayError("Unable to print report.");
		}
*/
	}
	
}
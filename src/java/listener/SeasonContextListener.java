package listener;

import java.time.LocalDate;
import java.time.Month;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import model.Milktea;

/**
 *
 * @author maxim
 */
public class SeasonContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        if (LocalDate.now().getMonth() == Month.DECEMBER) {
            ServletContext sc = sce.getServletContext();
            int monthlyFlavorPrice = Integer.parseInt(sc.getInitParameter("monthlyFlavorPrice"));
            String monthlyFlavorName = sc.getInitParameter("monthlyFlavorName");
            String monthlyFlavorDescription = sc.getInitParameter("monthlyFlavorDescription");
            String monthlyFlavorImagePath = sc.getInitParameter("monthlyFlavorImagePath");
            
            Milktea monthlyMilktea = new Milktea(monthlyFlavorPrice, monthlyFlavorName, monthlyFlavorDescription, monthlyFlavorImagePath);
            sc.setAttribute("monthlyMilktea", monthlyMilktea);
            sc.setAttribute("seasonTheme", "winterTheme");
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }
    
}

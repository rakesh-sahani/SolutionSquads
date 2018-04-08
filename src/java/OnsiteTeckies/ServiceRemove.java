package OnsiteTeckies;

import java.io.IOException;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet({"/admin/ServiceRemove"})
public class ServiceRemove
  extends HttpServlet
{
  String scat;
  int i;
  PreparedStatement ps = null;
  
  public ServiceRemove() {}
  
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession(true);
    response.setContentType("text/html;charset=UTF-8");
    Connection con = Connect.makeConnection();
    scat = request.getParameter("Title");
    if (scat != null) {
      try {
        System.out.println("in Servlet = " + scat + "");
        String SqlQuery = "delete from services WHERE sid = '" + scat + "'";
        ps = con.prepareStatement(SqlQuery);
        i = ps.executeUpdate();
        if (i > 0) {
          session.setAttribute("result", "Success!");
          response.sendRedirect("ServiceRemove.jsp");
        } else {
          session.setAttribute("result", "Error!");
          response.sendRedirect("ServiceRemove.jsp");
        }
        ps.close();
        con.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
  }
}
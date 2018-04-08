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


@WebServlet({"/admin/SEOServlet"})
public class SEOServlet
  extends HttpServlet
{
  String title;
  String key;
  String des;
  int S_NO;
  int pid;
  int i;
  PreparedStatement ps = null;
  
  public SEOServlet() {}
  
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { HttpSession session = request.getSession(true);
    response.setContentType("text/html;charset=UTF-8");
    Connection con = Connect.makeConnection();
    pid = Integer.parseInt(request.getParameter("pid"));
    title = request.getParameter("title");
    key = request.getParameter("key");
    des = request.getParameter("desc");
    if (title != null) {
      try {
        System.out.println("in Servlet = " + title + "");
        String SqlQuery = "insert into seo (id,pid,title,keyword,des) values (?,?,?,?,?)";
        ps = con.prepareStatement(SqlQuery);
        ps.setInt(1, S_NO);
        ps.setInt(2, pid);
        ps.setString(3, title);
        ps.setString(4, key);
        ps.setString(5, des);
        i = ps.executeUpdate();
        if (i > 0) {
          session.setAttribute("result", "Success!");
          response.sendRedirect("SEO.jsp");
        } else {
          session.setAttribute("result", "Error!");
          response.sendRedirect("SEO.jsp");
        }
        ps.close();
        con.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
  }
}
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OnsiteTeckies;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet({"/admin/ChangeServlet"})
public class ChangeServlet extends HttpServlet {

  int S_NO, i;
    PreparedStatement ps = null;
   

    public ChangeServlet() {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        response.setContentType("text/html;charset=UTF-8");
        Connection con = Connect.makeConnection();
        String access = request.getParameter("access");
        String old = request.getParameter("old");
        String newp = request.getParameter("newp");
        if (old != null) {
            try {
                System.out.println("in ProjectServlet = " + access + "");
               
                String SqlQuery = "UPDATE user SET password = '" + newp + "' WHERE  user = '" + access + "' and password = '" + old + "'  and user_id = 1";
                ps = con.prepareStatement(SqlQuery);
                i = ps.executeUpdate();
                if (i > 0) {
                    session.setAttribute("result", "Success!");
                    response.sendRedirect("ChangePassword.jsp");
                } else {
                    session.setAttribute("result", "Error!");
                    response.sendRedirect("ChangePassword.jsp");
                }
                ps.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

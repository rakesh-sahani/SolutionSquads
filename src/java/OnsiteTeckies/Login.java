/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OnsiteTeckies;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ryu
 */
@WebServlet({"/admin/Login"})
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Connection con = Connect.makeConnection();
        Statement st;
        ResultSet rs;
        String user, pass;
        user = request.getParameter("user");
        pass = request.getParameter("pass");
        try {
            String SqlQuery = "select * from user where user = '" + user + "' and '" + pass + "'";
            st = con.createStatement();
            rs = st.executeQuery(SqlQuery);
            if (rs.next()) {
                String User = rs.getString(2);
                session.setAttribute("user", User);
                response.sendRedirect("Home.jsp");
            } else {
                session.setAttribute("MSG", "Please, Correct Username and Password");
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("ISSUE");

        }

    }
}

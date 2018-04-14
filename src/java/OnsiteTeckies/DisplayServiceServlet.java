/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OnsiteTeckies;

import java.io.IOException;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ryu
 */
@WebServlet({"/admin/DisplayServiceServlet"})
public class DisplayServiceServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd;
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        String sid = request.getParameter("sid");

        try {
            con = OnsiteTeckies.Connect.makeConnection();
            String query = "select * from services where sid =" + sid;
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(2);
                String scat = rs.getString(3);               
                String content = rs.getString(4);
                 String img = rs.getString(5);
                request.setAttribute("id", id);
                request.setAttribute("cat", scat);
                request.setAttribute("con", content);
                request.setAttribute("img", img);
                rd = request.getRequestDispatcher("ServiceUpdate.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

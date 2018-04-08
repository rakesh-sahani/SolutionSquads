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
@WebServlet({"/admin/DisplayServlet"})
public class DisplayServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String pid = request.getParameter("pid");

        try {
            con = OnsiteTeckies.Connect.makeConnection();
            String query = "select * from pricing where pid =" + pid;
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(2);
                String pname = rs.getString(3);
                String img = rs.getString(4);
                String detail = rs.getString(5);
                request.setAttribute("id", id);
                request.setAttribute("RS", pname);
                request.setAttribute("de", detail);
                request.setAttribute("img", img);
                rd = request.getRequestDispatcher("Price.jsp");
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

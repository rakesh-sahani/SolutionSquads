/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OnsiteTeckies;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet({"/admin/HomeServlet"})
@MultipartConfig(fileSizeThreshold = 2097152, maxFileSize = 10485760L, maxRequestSize = 52428800L)
public class HomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String SAVE_DIR = "images";
    String Msg, test;
    int S_NO, i;
    PreparedStatement ps = null;
    InputStream ImgPath = null;

    public HomeServlet() {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        response.setContentType("text/html;charset=UTF-8");
        Connection con = Connect.makeConnection();

        ServletConfig config = getServletConfig();
        String context = config.getServletContext().getRealPath("/");
        String savePath = context + File.separator + "images";
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        Part part = request.getPart("img");
        String fileName = extractFileName(part);
        part.write(savePath + File.separator + fileName);

        Msg = request.getParameter("msg");
        test = request.getParameter("test");
        if (Msg != null) {
            try {
                System.out.println("in ProjectServlet = " + Msg + "");
                String filePath = fileName;
                String SqlQuery = "UPDATE homepage SET ImgPath = '" + filePath + "', msg = '" + Msg + "', test = '" + test + "' WHERE id = 1";
                ps = con.prepareStatement(SqlQuery);
                i = ps.executeUpdate();
                if (i > 0) {
                    session.setAttribute("result", "Success!");
                    response.sendRedirect("Home.jsp");
                } else {
                    session.setAttribute("result", "Error!");
                    response.sendRedirect("Home.jsp");
                }
                ps.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}

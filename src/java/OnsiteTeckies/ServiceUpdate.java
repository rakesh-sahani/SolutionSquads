package OnsiteTeckies;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet({"/admin/ServiceUpdate"})
@MultipartConfig(fileSizeThreshold = 2097152, maxFileSize = 10485760L, maxRequestSize = 52428800L)
public class ServiceUpdate
        extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String SAVE_DIR = "images";

    public ServiceUpdate() {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String scat;
        int sid;
        String scontent;        
        int i;
        PreparedStatement ps;

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
        sid = Integer.parseInt(request.getParameter("id"));
        scontent = request.getParameter("detail");
        scat = request.getParameter("sname");
        if (scat != null) {
            try {
                System.out.println("in ServiceUpdate = " + scat + "");
                String filePath = fileName;
                String SqlQuery = "UPDATE services SET scat = '" + scat + "',scontent = '" + scontent + "',ImgPath = '" + filePath + "' WHERE sid = '" + sid + "'";
                ps = con.prepareStatement(SqlQuery);
                i = ps.executeUpdate();
                if (i > 0) {
                    System.out.println("in ServiceUpdate = " + sid + "");
                    session.setAttribute("result", "Success!");
                    response.sendRedirect("ServiceUpdate.jsp");
                } else {
                    session.setAttribute("result", "Error!");
                    response.sendRedirect("ServiceUpdate.jsp");
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

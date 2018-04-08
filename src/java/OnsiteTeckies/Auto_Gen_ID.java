package OnsiteTeckies;

import java.sql.*;

public class Auto_Gen_ID {

    static Connection con = null;
    static ResultSet rs = null;
    static PreparedStatement ps = null;
    static String genID = "";
    static String generateid = "";

    /**
     * **************method for increase auto id for global form *********************
     */
    public static String globalGenId(String pref, String form_name) {
        try {
            con = OnsiteTeckies.Connect.makeConnection();
            genID = pref;
            String temp = null;
            String num = null;
            int r = 1;
            String sql = "select prefix_id from auto_gen_id where form_name='" + form_name + "'";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                temp = rs.getString(1).trim();
                String auto_id[] = temp.split("-");
                num = auto_id[1];
                r = Integer.parseInt(num) + 1;

            }
            generateid = "";
            if (r < 10) {
                generateid = genID + "0000" + r;
            } else if (r < 100) {
                generateid = genID + "000" + r;
            } else if (r < 1000) {
                generateid = genID + "00" + r;
            } else if (r < 10000) {
                generateid = genID + "0" + r;
            } else {
                generateid = genID + r;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return (generateid);
    }

    /**
     * ******************** Method for update Auto generate id **************************
     */
    public static void updateAutoID(String form_name, String id) {
        try {
            Connection con22 = OnsiteTeckies.Connect.makeConnection();
            PreparedStatement pst22 = con22.prepareStatement("update auto_gen_id set prefix_id='" + id + "' where form_name='" + form_name + "'");
            pst22.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

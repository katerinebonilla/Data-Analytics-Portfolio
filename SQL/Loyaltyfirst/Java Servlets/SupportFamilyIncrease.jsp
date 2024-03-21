

<%@page import="java.sql.*" %>


<%
    try {
        // Create database connection
        DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
        //OracleDataSource od = new OracleDataSource();
        String serverIP = "artemis.vsnet.gmu.edu";
        String portNumber = "1521";
        String serviceName = "vse18c.vsnet.gmu.edu";
        String dbuser = "ashala2";
        String dbpass = "ugreefum";
        String url = "jdbc:oracle:thin:@//" + serverIP + ":" + portNumber + "/" + serviceName;
        Connection conn = DriverManager.getConnection(url, dbuser, dbpass);
        //Connection conn = od.getConnection();
        Statement stmt = conn.createStatement();
        // Get input parameters
        String trefinput = request.getParameter("tref");
        String cidinput = request.getParameter("cid");
        
        
        
        
        ResultSet rs = stmt.executeQuery("SELECT FAMILY_ID,PERCENT_ADDED,T_POINTS " + 
                                          "FROM POINT_ACCOUNTS pa JOIN TRANSACTIONS t " +
                                          "ON (pa.CID=t.CID) " +
                                          "WHERE PA.CID='" + cidinput + "' and t.tref='" + trefinput + "' ");
        //out.print("Succeeded!");
        response.setContentType("text/html");
        //PrintWriter out = response.getWriter();
        String output = "";
        while(rs.next()) {
            out.print("#" + rs.getString(1) + "," + rs.getString(2) + "," + rs.getString(3) + ",");
        }
        conn.close();
        out.print(output);
    } catch (Exception e) {
        out.print(e);
        //System.out.println(e);
    }
    //out.print("Hi!");
%>
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
        String cidinput = request.getParameter("cid");
        String pidinput = request.getParameter("prizeid");
        
        
        
        
        ResultSet rs = stmt.executeQuery("SELECT rh.R_DATE,p.P_DESCRIPTION,p.POINTS_NEEDED,ec.CENTER_NAME " + 
                                          "FROM REDEMPTION_HISTORY rh JOIN EXCHGCENTERS ec " +
                                          "ON(rh.CENTER_ID=ec.CENTER_ID) " +
                                          "JOIN Prizes p " +
                                          "ON(rh.PRIZE_ID=p.PRIZE_ID) " +
                                          "WHERE rh.CID='" + cidinput + "' and rh.PRIZE_ID='" + pidinput + "'");
        //out.print("Succeeded!");
        response.setContentType("text/html");
        //PrintWriter out = response.getWriter();
        String output = "";
        while(rs.next()) {
            out.print("#" + rs.getString(1) + "," + rs.getString(2) + "," + rs.getString(3) + "," + rs.getString(4) + ",");
        }
        conn.close();
        out.print(output);
    } catch (Exception e) {
        out.print(e);
        //System.out.println(e);
    }
    //out.print("Hi!");
%>
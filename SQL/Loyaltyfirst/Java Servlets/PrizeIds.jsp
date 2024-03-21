

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
        
        
        
        
        
        ResultSet rs = stmt.executeQuery("SELECT DISTINCT PRIZE_ID " + 
                                          "FROM REDEMPTION_HISTORY " +
                                          "JOIN CUSTOMERS " +
                                          "ON(REDEMPTION_HISTORY.CID=CUSTOMERS.CID) " +
                                          "WHERE REDEMPTION_HISTORY.CID='" + cidinput + "'");
        //out.print("Succeeded!");
        response.setContentType("text/html");
        //PrintWriter out = response.getWriter();
        String output = "";
        while(rs.next()) {
            out.print("#" + rs.getString(1));
        }
        conn.close();
        out.print(output);
    } catch (Exception e) {
        out.print(e);
        //System.out.println(e);
    }
    //out.print("Hi!");
%>
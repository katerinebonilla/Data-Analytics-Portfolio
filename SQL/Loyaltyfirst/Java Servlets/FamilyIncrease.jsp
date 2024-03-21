

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
        String fidinput = request.getParameter("fid");
        String cidinput = request.getParameter("cid");
        String pointsinput = request.getParameter("npoints");
        
        
        
        
        ResultSet rs = stmt.executeQuery("UPDATE POINT_ACCOUNTS " + 
                                          "SET NUM_OF_POINTS=NUM_OF_POINTS + " + pointsinput +
                                          " WHERE FAMILY_id='" + fidinput + "' AND CID!='" + cidinput + "' ");
        //out.print("Succeeded!");
        response.setContentType("text/html");
        //PrintWriter out = response.getWriter();
        if(rs.next()) {
            try {
                out.print(rs.getString(1));
            } catch (java.sql.SQLException e) {
                out.print("Succeeded!");
            }
        }
        conn.close();
    } catch (Exception e) {
        out.print(e);
        //System.out.println(e);
    }
    //out.print("Hi!");
%>
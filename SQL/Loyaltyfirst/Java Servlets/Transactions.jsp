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
        
        
        
        
        
        ResultSet rs = stmt.executeQuery("SELECT TREF ,T_DATE,T_POINTS,AMOUNT " + 
                                          "FROM TRANSACTIONS " +
                                          "JOIN CUSTOMERS " +
                                          "ON(TRANSACTIONS.CID=CUSTOMERS.CID) " +
                                          "WHERE TRANSACTIONS.CID='"+cidinput+"'");
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
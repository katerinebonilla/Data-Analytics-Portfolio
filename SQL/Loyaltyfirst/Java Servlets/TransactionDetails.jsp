

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
        
        
        
        
        
        ResultSet rs = stmt.executeQuery("SELECT t.TREF, t.T_DATE, t.T_POINTS ,p.PROD_NAME,p.PROD_POINTS, tp.QUANTITY " + 
                                          "FROM TRANSACTIONS t JOIN TRANSACTIONS_PRODUCTS tp " +
                                          "ON(t.TREF=tp.TREF) " +
                                          "JOIN PRODUCTS p " +
                                          "ON(p.PROD_ID=tp.PROD_ID) " +
                                          "WHERE t.TREF = '"+trefinput+"'");
        //out.print("Succeeded!");
        response.setContentType("text/html");
        //PrintWriter out = response.getWriter();
        String output = "";
        while(rs.next()) {
            out.print("#" + rs.getString(1) + "," + rs.getString(2) + "," + rs.getString(3) + "," + rs.getString(4) + "," + rs.getString(5) + "," + rs.getString(6) + ",");
        }
        conn.close();
        out.print(output);
    } catch (Exception e) {
        out.print(e);
        //System.out.println(e);
    }
    //out.print("Hi!");
%>
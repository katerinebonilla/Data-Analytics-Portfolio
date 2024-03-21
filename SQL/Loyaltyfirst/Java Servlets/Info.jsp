

<%@page import="java.sql.*" %>


<%
    try {
        // Create database connection
        DriverManager.registerDriver(new oracle.jdbc.OracleDriver());

        String serverIP = "artemis.vsnet.gmu.edu";
        String portNumber = "1521";
        String serviceName = "vse18c.vsnet.gmu.edu";
        String dbuser = "ashala2";
        String dbpass = "ugreefum";
        String url = "jdbc:oracle:thin:@//" + serverIP + ":" + portNumber + "/" + serviceName;

        Connection conn = DriverManager.getConnection(url, dbuser, dbpass);
        Statement stmt = conn.createStatement();

        // Get input parameters
        String cidinput = request.getParameter("cid");

        ResultSet rs = stmt.executeQuery("SELECT c.cname, p.num_of_points " + 
                                          "FROM Customers c " +
                                          "INNER JOIN Point_Accounts p " +
                                          "ON c.cid = p.cid " +
                                          "WHERE c.cid = '" + cidinput + "'");

        response.setContentType("text/html");
        String output = "";
        while(rs.next()) {
            output += rs.getString(1) + ", " + rs.getString(2);
        }

        conn.close();
        out.print(output);

    } catch (Exception e) {
        out.print(e);
        
    }
    
%>
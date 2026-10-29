
<%@ page import="java.sql.*" %>
<html>
<body>
<h2>NSS Camp Registration</h2>

<%
String name = request.getParameter("volunteer");
String branch = request.getParameter("branch");
String tshirt = request.getParameter("tshirt");
String mobile = request.getParameter("mobile");

if (name == null || name.trim().isEmpty()) {
    out.println("Error: Volunteer name was not received. Go back and enter the name.");
} else if (mobile == null || !mobile.matches("[0-9]{10}")) {
    out.println("Error: Mobile number must be exactly 10 digits.");
} else {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/nss_db", "root", "root");

        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO nss_camp(volunteer,branch,tshirt,mobile) VALUES(?,?,?,?)");

        ps.setString(1, name.trim());
        ps.setString(2, branch);
        ps.setString(3, tshirt);
        ps.setString(4, mobile);

        ps.executeUpdate();

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM nss_camp");

        out.println("<table border='1'><tr><th>ID</th><th>Name</th><th>Branch</th><th>Size</th><th>Mobile</th></tr>");

        int count = 0;
        while (rs.next()) {
            count++;
            out.println("<tr><td>" + rs.getInt("id") + "</td><td>"
                + rs.getString("volunteer") + "</td><td>"
                + rs.getString("branch") + "</td><td>"
                + rs.getString("tshirt") + "</td><td>"
                + rs.getString("mobile") + "</td></tr>");
        }

        out.println("</table><h3>Total Records: " + count + "</h3>");
        out.println("<a href='index.jsp'>Back</a>");

        rs.close();
        st.close();
        ps.close();
        con.close();

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
}
%>

</body>
</html>

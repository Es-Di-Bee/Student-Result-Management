<%@ page import = "Project.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>

<%

String rollNo = request.getParameter("rollNo");
String s1 = request.getParameter("s1");
String m1 = request.getParameter("m1");
String s2 = request.getParameter("s2");
String m2 = request.getParameter("m2");
String s3 = request.getParameter("s3");
String m3 = request.getParameter("m3");
String s4 = request.getParameter("s4");
String m4 = request.getParameter("m4");


try {
	Connection con = Project.ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("SELECT * from student WHERE rollNo='"+rollNo+"'");
	rs.next();
	if (rs.getString(2).equals(rollNo)) {
		st.executeUpdate("insert into result values('"+rollNo+"', '"+s1+"', '"+m1+"', '"+s2+"', '"+m2+"', '"+s3+"', '"+m3+"', '"+s4+"', '"+m4+"')");
	}
	response.sendRedirect("adminHome.jsp");
} catch (Exception e) {
	response.sendRedirect("adminHome.jsp");
}

%>
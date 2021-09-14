<%@ page import = "Project.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>

<%

//String course = request.getParameter("course");
String dept = request.getParameter("dept");
String rollNo = request.getParameter("rollNo");
String name = request.getParameter("name");
String fatherName = request.getParameter("fatherName");
String gender = request.getParameter("gender");
String password = request.getParameter("password");


try {
	Connection con = Project.ConnectionProvider.getCon();
	Statement st = con.createStatement();
	if (!dept.equals("") && !rollNo.equals("") && !name.equals("") && !fatherName.equals("") && !gender.equals("") && !password.equals("")) {
		st.executeUpdate("insert into student values('"+dept+"', '"+rollNo+"', '"+name+"', '"+fatherName+"', '"+gender+"', '"+password+"')");
	}
	response.sendRedirect("adminHome.jsp");
} catch (Exception e) {
	out.println(e);
}

%>
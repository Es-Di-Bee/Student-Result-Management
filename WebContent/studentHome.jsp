<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
try {
	String rollNo = request.getParameter("rollNo");
	String password = request.getParameter("password");
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("SELECT * from student WHERE rollNo='"+rollNo+"'");
	rs.next();
	if (rs.getString(6).equals(password)) {
		rs = st.executeQuery("select * from student inner join result where student.rollNo=result.rollNo and student.rollNo='"+rollNo+"'");
	} else {
		throw new Exception();
	}
	if(rs.next()) {

%>

<img src="logo.png"  align="left"width="150" height="150">
<center><img src="bracu_logo.png" width="150" height="150">
<img src="grades.png" align="right"  width="150" height="150"></center>
    <a href="dgiOneView.html">Back</a>
  <hr class="new1">
<style>
table{
  width:100%;
  table-layout: fixed;
}
th{
  padding: 20px 15px;
  text-align: left;
  font-weight: 500;
  font-size: 12px;
  color: #fff;
  text-transform: uppercase;
 border: 2px solid rgba(255,255,255,0.3);
}


/* demo styles */

@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
body{
  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4);
  font-family: 'Roboto', sans-serif;
}

</style>
  <!--for demo wrap-->
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>institution Name: BRAC University</th>
          <th>Dept Name: <%=rs.getString(1) %></th>
          <th><center>RollNo: <%=rs.getString(2) %></center></th>
        </tr>
      </thead>
      <thead>
        <tr>
          <th>Name: <%=rs.getString(3) %></th>
          <th>Father Name: <%=rs.getString(4) %></th>
          <th>Gender: <%=rs.getString(5) %></th>
          <th><a titlt="print screen" alt="print screen" onclick="window.print();" target="_blank" style="cursor:pointer;"><center><img src="print.png"></center></a></th>
        </tr>
      </thead>
    </table>
  </div>
<style>
html {
  font-family:arial;
  font-size: 25px;
}

td {
  border: 2px solid #726E6D;
  padding: 15px;
  color:black;
  text-align:center;
}

thead{
  font-weight:bold;
  text-align:center;
  background: #625D5D;
  color:white;
}

table {
  border-collapse: collapse;
}

.footer {
  text-align:right;
  font-weight:bold;
}

tbody >tr:nth-child(odd) {
  background: #D1D0CE;
}

</style>
<head>
  <hr class="new1">
</head>
<body>
  <table>
    <thead>
      <tr>
        <td colspan="3">Course</td>
        <td rowspan="2">Full Marks</td>
        <td rowspan="2">Passing Marks</td>
        <td rowspan="2">Obtained Marks</td>
        <td rowspan="2">Grade Point</td>
      </tr>
      <tr>
        <td>No. </td>
        <td colspan="2"> Code </td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>01</td>
        <td colspan="2"><%=rs.getString(8) %></td>
        <td>100</td>
        <td> 50 </td>
        <td><%=rs.getString(9) %></td>
        <td><%=getcgpa(rs.getInt(9)) %></td>
      </tr>
      <tr>
        <td>02</td>
        <td colspan="2"><%=rs.getString(10) %></td>
        <td>100</td>
        <td>50</td>
        <td><%=rs.getString(11) %> </td>
        <td><%=getcgpa(rs.getInt(11)) %></td>
      </tr>
      <tr>
        <td>03</td>
        <td colspan="2"><%=rs.getString(12) %></td>
        <td>100</td>
        <td>50</td>
        <td> <%=rs.getString(13) %></td>
        <td><%=getcgpa(rs.getInt(13)) %></td>
      </tr>
      <tr>
        <td>04</td>
        <td colspan="2"><%=rs.getString(14) %></td>
        <td>100</td>
        <td>50</td>
        <td> <%=rs.getString(15) %></td>
        <td><%=getcgpa(rs.getInt(15)) %></td>
      </tr>

     
      
    </tbody>
    
    <tfoot>
      
      <tr>
        <td colspan="4" class="footer">Semester CGPA</td>
        <td colspan="3"> <%= (getcgpa(rs.getInt(9))  + getcgpa(rs.getInt(11)) + getcgpa(rs.getInt(13))  + getcgpa(rs.getInt(15))) / 4.0 %></td>
      </tr>
      
  </table>
    <hr class="new1">
  <center><h6>Plese contact admin if you find any discrepancy in your gradesheet. Thank you.</h6></center>
  <hr class="new1">
</body>

<%

	}
	else {
		response.sendRedirect("errorDgiOneView.html");
	} 
}
	catch(Exception e) {
		response.sendRedirect("errorDgiOneView.html");
	}

%>


<%!

double getcgpa(double m) {
	if (m >= 90) return 4.0;
	else if (m >= 85) return 3.7;
	else if (m >= 80) return 3.3;
	else if (m >= 75) return 3.0;
	else if (m >= 70) return 2.7;
	else if (m >= 65) return 2.3;
	else if (m >= 60) return 2.0;
	else if (m >= 50) return 1.5;
	return 0.0;
}

%>
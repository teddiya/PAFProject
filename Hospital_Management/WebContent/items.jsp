<%@page import="model.DoctorRegister"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	//Insert item---------------------------------
	if (request.getParameter("DocLNo") != null) {  //`DocID`,`DocLNo`,`Name`,`NIC`,`PhoneNo`,`Email`,`Address`,`DocSpeacialist`,`WorkingXp`,`Password`
		DoctorRegister itemObj = new DoctorRegister();
		String stsMsg = itemObj.insertItem(request.getParameter("DocLNo"), request.getParameter("Name"),
				request.getParameter("NIC"), request.getParameter("PhoneNo"), request.getParameter("Email")
				, request.getParameter("Address"), request.getParameter("DocSpeacialist"), request.getParameter("WorkingXp")
				, request.getParameter("Password"));
		session.setAttribute("statusMsg", stsMsg);
	}
	//Delete item----------------------------------
	if (request.getParameter("DocID") != null) {
		DoctorRegister itemObj = new DoctorRegister();
		String stsMsg = itemObj.deleteItem(request.getParameter("DocID"));
		session.setAttribute("statusMsg", stsMsg);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
</head>
<body>
	<h1>Doctor Management</h1>
	<form method="post" action="items.jsp">
		Doctor licen: <input name="DocLNo" type="text"><br> 
		Name: <input name="Name" type="text"><br>
		NIC:<input name="NIC" type="text"><br>
		Phone number:<input name="PhoneNo" type="text"><br>
		Email:<input name="Email" type="text"><br>
		Address:<input name="Address" type="text"><br>
		DocSpeacialist:<input name="DocSpeacialist" type="text"><br>
		WorkingXp:<input name="WorkingXp" type="text"><br>
		Password: <input name="Password" type="password"><br> <input
			name="btnSubmit" type="submit" value="Save">
	</form>
	<%
		out.print(session.getAttribute("statusMsg"));
	%>
	4
	<br>
	<%
		DoctorRegister docobj = new DoctorRegister();
		out.print(docobj.readItems());
	%>
</body>
</html>
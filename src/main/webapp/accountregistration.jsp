<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="FinalsPackage.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Register Account Successful</title>
	</head>
	<body>
		<jsp:useBean id="account" class="FinalsPackage.Account" />
		<jsp:setProperty property="*" name="account" />
		<%
		AccountDao accountDao = new AccountDao();
			int status = accountDao.registerAccount(account);
			if (status > 0) {
				out.print("You are successfully registered");
			}
		%>
	</body>
</html>


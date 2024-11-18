<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="FinalsPackage.*"%>
<!DOCTYPE html>
<html>
	<head>
		<style>	
		*{
		  margin: 0px;
		  padding: 0px;
		  font-family: "Roboto", sans-serif;
		}
		body{
		  background: linear-gradient(48deg, #ee6c3b, #710461);
		  height: 100vh;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		  animation: BackgroundAnimation 2s linear infinite;
		}
		form {
		    background: rgba(255, 255, 255, 0.7);
		    padding: 60px 50px;
		    border-radius: 24px;
		    box-shadow: 8px 8px 8px rgba(0, 0, 0, 0.1);
	  	}
		h6{
		  color: rgb(145, 103, 158);
		  text-align: center;
		  padding-bottom: 11px;
		  font-size: 33px;
		  text-transform: uppercase;
		  font-weight: 700;
		}
		span{
		  display: block;
		  text-align: center;
		  font-size: 13px;
		  text-decoration: none;
		  color: #000;
		  margin-top: 10px;
		  transition: 0.2s;
		  text-transform: capitalize;
		}
		a{
		  text-decoration: none;
		  color: #000;
		}
		a:hover{
		  color: #36e454;
		  cursor: pointer;
		}
		@keyframes BackgroundAnimation {
		  0%{
		    background-position: right;
		  }
		  100%{
		    background-position: left;
		  }
		}
		ul {
		  list-style-type: none;
		  color: #808080; 
		}
		</style>
		<meta charset="ISO-8859-1">
		<title>Registered Account Succesfully</title>
		</head>
		<body>
			<script type="text/javascript">
		        // Wait for 5 seconds (5000 milliseconds) before redirecting
		        setTimeout(function() {
		            window.location.href = "loginform.jsp";
		        }, 5000);
		    </script>
			<form>
		      <h6>Registered Account Succesfully</h6>
		      <jsp:useBean id="account" class="FinalsPackage.Account" />
			<jsp:setProperty property="*" name="account" />
			<p style="color: rgb(145, 103, 158);
			  text-align: center;"><%
				AccountDao accountDao = new AccountDao();
				int status = accountDao.registerAccount(account);
				if (status > 0) {
					out.print("Redirecting you to Login Page");
				}
			%></p>
		    </form>
			
		</body>
</html>
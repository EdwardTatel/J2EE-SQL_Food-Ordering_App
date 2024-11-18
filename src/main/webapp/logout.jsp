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
	    padding: 60px 20px;
	    border-radius: 24px;
	    box-shadow: 8px 8px 8px rgba(0, 0, 0, 0.1);
  	}
	input{
	  padding: 17px 24px;
	  display: block;
	  margin: 20px;
	  outline: none;
	  border: 1px solid rgb(145, 103, 158);
	  width: 222px;
	  border-radius: 24px;
	  background: rgba(255, 255, 255, 0.2);
	  box-shadow: 8px 8px 8px rgba(0, 0, 0, 0.1);
	  color: #808080; 
	}
	input:focus{
	  border-color: rgb(91, 162, 255);
	}
	button {
	    padding: 17px 24px;
	    background: linear-gradient(48deg, #f38158, #bf5af2);
	    border: none;
	    color: #fff;
	    width: calc(100% - 40px); 
	    border: 1px solid rgb(145, 103, 158);
	    font-size: 15px;
	    margin: 20px 20px; 
	    background-size: 500%;
	    border-radius: 24px;
	    outline: none;
	    transition: 1s;
	    box-shadow: 8px 8px 8px rgba(0, 0, 0, 0.1);
	  }
	button:hover{
	  background-position: bottom;
	  cursor: pointer;
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
	</style>
    <meta charset="ISO-8859-1">
<head>
    <meta charset="UTF-8">
    <title>Logging Out..</title>
</head>
<body>

	<%
    if (session != null) {
        session.invalidate();
    }
	%>
	
	    <form method="post">
	    		<h6>Logging Out!</h6>
	    		<p style="color: rgb(145, 103, 158); text-align: center;">Thanks for using the app!</p>
		</form>
		<script type="text/javascript">
		        // Wait for 5 seconds (5000 milliseconds) before redirecting
		        setTimeout(function() {
		            window.location.href = "loginform.jsp";
		        }, 5000);
		    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, java.util.ArrayList, FinalsPackage.Order, FinalsPackage.OrderDao" %>
<%@ page session="true" %>
<%@page import="FinalsPackage.GetOrders"%>
<%@page import="java.util.List"%>
<%@page import="FinalsPackage.Order"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order History</title>
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
	.formbody {
	    background: rgba(255, 255, 255, 0.7);
	    border-radius: 24px;
	    box-shadow: 8px 8px 8px rgba(0, 0, 0, 0.1);
	    width: 35vw;
	    margin: 2vw;
	    height: 60vh;
	    position: relative;
	    padding-top: 3vh;
	    padding-bottom: 3vh;
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
	    border: 1px solid rgb(145, 103, 158);
	    font-size: 15px;
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
	.addbutton{
		margin-top: 8%;
		width: 100%;
	}
	
	h6{
	  color: rgb(145, 103, 158);
	  padding-bottom: 11px;
	  font-size: 33px;
	  text-transform: uppercase;
	  font-weight: 700;
	  margin-left: 1.4vw;
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
	td{
		padding: 10px;
		text-align: center;
	}
	tdend{
		padding: 10px;
		text-align: center;
	}
	
	.nicebox {
	    width: 100%;
	    text-align: center;
	}
	
	.nicebox figure {
	    margin: 0;
	}
	
	.nicebox img {
	    width: 100%;
	    height: auto;
	}
	
	.nicebox figcaption {
	    padding: 20px;
	    text-align: left; 
	    background: rgba(44, 63, 82, 0.8);
	    color: #ED4E6E;
	}
	
	.nicebox figcaption h3 {
	    margin-top: 0;
	    text-transform: uppercase;
	    color: #fff;
	}
	
	.nicebox figcaption span {
	    color: #fff;
	}
	
	.nicebox figcaption p {
	    margin: 15px 0 0;
	    color: #fff;
	}
	figure {
	
	    border-radius: 24px;
	    margin: 30px;
	    width: auto;
	    height: 300px;
	    overflow: hidden;
	    position: relative;
	    background-color: #2C3F52;
	    box-shadow: 8px 8px 8px rgba(0, 0, 0, 0.1);
	}
	
	figure img {
	    height: 5%;
	    width: 5%;
	    object-fit: cover;
	    display: block;
	    will-change: transform;
	    transform-origin: top;
	    transition: transform 0.4s ease;
	}
	
	figcaption {
	    position: absolute;
	    left: 0;
	    bottom: 0;
	    height: 20vh;
	    padding: 30px;
	    background: rgba(44, 63, 82, 0.8);
	    color: #ED4E6E;
	    transform-origin: center;
	    transform: translateY(50%);
	    transition: transform 400ms ease, background 600ms;
	    will-change: transform;
	}
	
	figcaption h3 {
	    margin-top: 0;
	    text-transform: uppercase;
	    color: #fff;
	}
	
	figcaption p {
	    margin: 25px 0 0;
	    transition: opacity 0.4s ease;
	    color: #fff;
	    opacity: 0;
	}
	
	figure:hover figcaption {
	    transform: translateY(-30px);
	    background: transparentize(#2C3F52, 0.1);
	}
	
	figure:hover figcaption p {
	    opacity: 1;
	}
	
	figure:hover img {
	    transform: translateY(-50px);
	}
	.scrollable-table-wrapper {
	  max-height: 55vh; 
	  overflow-y: auto; 
	  scrollbar-width: none; 
	  padding-left: 5%;
	  padding-right: 5%;
	  border-radius: 24px;
	}
	
	.scrollable-table-wrapper::-webkit-scrollbar {
	  display: none; 
	  border-radius: 24px;
	}
	.quantity-container {
	    display: flex;
	    align-items: center;
	}
	
	.quantity-container span {
	    margin:auto;
  		display:block;
	}
	.bottomform{
		height: 9.5vh;
		width: 100%; 
		position: absolute; 
		bottom:0; 
		border-radius: 24px; 
		color: white;
		background: rgba(44, 63, 82, 0.8);
	}
	.welcome-container {
	    position: fixed; 
	    top: 0; 
	    left: 0; 
	    color: white;
	    margin: 10px; 
	    padding: 10px;
	    box-shadow: 0 2px 5px rgba(0,0,0,0.01); 
	    z-index: 1000; 
	    font-weight: bold;
	}
	.clickable-text {
	    display: block;
	    font-size: 14px; 
	    color: #710461; 
	    text-decoration: none; 
	    margin-top: 5px; 
	}
	
	.clickable-text:hover {
		color: #ee6c3b;
	    text-decoration: underline;
	}
	.logout-container {
	    position: fixed; 
	    top: 0; 
	    right: 0;
	    color: white;
	    margin: 10px; 
	    padding: 10px; 
	    box-shadow: 0 2px 5px rgba(0,0,0,0.01);
	    z-index: 1000; 
	    font-weight: bold;
	}
	.clickable-text2 {
	    display: block; 
	    font-size: 14px;
	    color: #ee6c3b;
	    text-decoration: none; 
	    margin-top: 5px; 
	}
	
	.clickable-text2:hover {
		color: #710461;
	    text-decoration: underline;
	}
	
	.closebutton{
		position: absolute;
		color: rgb(145, 103, 158);
		  padding-bottom: 11px;
		  font-size: 33px;
		  font-weight: 700;
		  right: 2vw;
		  margin-top: -.30vh;
	}
	
	.closebutton:hover {
		color: #ee6c3b;
	}
	 </style>
</head>
<body>
<div class="welcome-container">
		<%
		    String username = (String) session.getAttribute("username");
			int userId = (int) session.getAttribute("userId");
		%>
	    <div class="welcome-text">Welcome, <%out.print(username);%></div>
	    <a href="orderpage.jsp" class="clickable-text">Go back to order page</a>
	</div>
	<div class="logout-container">
	    <a href="logout.jsp" class="clickable-text2">Logout</a> 
	</div>

		<% 
	   		GetOrders orders = new GetOrders(); 
	   	    List<Order> orderList = orders.getOrdersByUserId(userId); 
	   	    Order prevOrder = new Order("", "", 0, 0,"");
	   	%>
	<div class="formbody">
	    <a href="orderpage.jsp" class="closebutton">x</a> 
    <h6>Order History</h6>
    <div class="scrollable-table-wrapper">
        <table style="width: 100%;border-collapse: collapse">
        <% if (orderList != null && !orderList.isEmpty()) {%>
            <tr style = "border-bottom: 2px solid rgb(145, 103, 158);">
                <th>Order Number</th>
                <th>Item</th>
                <th>Quantity</th>
                <th>Price</th>
            </tr>
            
		<% } %>
	   		

		<%!
		int getRowCount(List<Order> orderList, int orderNumber, int currentIndex) {
		    int count = 1;
		    for (int i = currentIndex + 1; i < orderList.size(); i++) {
		        Order order = orderList.get(i);
		        if (Integer.parseInt(order.getOrderNumber()) == orderNumber) {
		            count++;
		        } else {
		            break;
		        }
		    }
		    return count;
		}
		%>
		
		<%
		int prevOrderNumber = -1;
		boolean isFirstRow = true; 
		float totalOrderPrice = 0; 
		for (int i = 0; i < orderList.size(); i++) {
		    Order currentOrder = orderList.get(i);
		    int currentOrderNumber = Integer.parseInt(currentOrder.getOrderNumber());
		    if (prevOrderNumber != currentOrderNumber) {
		%>
		        <tr>
		            <%
		            if (isFirstRow) { 
		            %>
		            <td rowspan="<%= getRowCount(orderList, currentOrderNumber, i) + 1%>"> <%= currentOrder.getOrderNumber() %></td>
		            <%
		            isFirstRow = false; 
		            }
		            %>
		            <td><%= currentOrder.getOrderName() %></td>
		            <td><%= currentOrder.getOrderQuantity() %></td>
		            <td><%= currentOrder.getOrderPrice() %></td>
		        </tr>
		<%
		        totalOrderPrice += currentOrder.getOrderPrice(); 
		        prevOrderNumber = currentOrderNumber; 
		    } else {
		       
		%>
		        <tr>
		            <td><%= currentOrder.getOrderName() %></td>
		            <td><%= currentOrder.getOrderQuantity() %></td>
		            <td><%= currentOrder.getOrderPrice() %></td>
		        </tr>
		<%
		        totalOrderPrice += currentOrder.getOrderPrice();
		    }
		    
		    if ((i + 1 < orderList.size() && Integer.parseInt(orderList.get(i + 1).getOrderNumber()) != currentOrderNumber) || i == orderList.size() - 1) {
		%>
		        <tr style = "border-bottom: 2px solid rgb(145, 103, 158);">
		        	<td>Time Ordered: <%= currentOrder.getOrderDate() %></td>
		            <td style="text-align: right;">Total Price:</td>
		            <td>  <%= totalOrderPrice %> </td>
		        </tr>
		<%
		        totalOrderPrice = 0; 
		        isFirstRow = true; 
		    }
		}
		%>

        </table>
    </div>
</div>

</body>
</html>
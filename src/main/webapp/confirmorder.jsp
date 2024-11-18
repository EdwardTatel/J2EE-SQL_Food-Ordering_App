<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%@ page session="true" %>
 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Confirm Order</title>
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
	  padding-left: 2%;
	  padding-right: 2%;
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
		</style>
	</head>
	<body>
	
	<%
	    
	    if (session.getAttribute("orderNameList") == null) {
	        session.setAttribute("orderNameList", new ArrayList<String>());
	    }
	    if (session.getAttribute("orderPriceList") == null) {
	        session.setAttribute("orderPriceList", new ArrayList<Float>());
	    }
	    if (session.getAttribute("orderQuantityList") == null) {
	        session.setAttribute("orderQuantityList", new ArrayList<Integer>());
	    }
	    
	    
	    List<String> orderNameList = (List<String>) session.getAttribute("orderNameList");
	    List<Float> orderPriceList = (List<Float>) session.getAttribute("orderPriceList");
	    List<Integer> orderQuantityList = (List<Integer>) session.getAttribute("orderQuantityList");
	    
	    
	    float totalPrice = 0.0f; 
	    
	    if (orderPriceList != null && orderQuantityList != null && orderPriceList.size() == orderQuantityList.size()) {
	        for (int i = 0; i < orderPriceList.size(); i++) {
	            totalPrice += orderPriceList.get(i) * orderQuantityList.get(i);
	        }
	    }
	    
	%>

<div>
     <form action="" class="formbody" method="post">
        <h6 style="top: 2%;">Orders</h6>
        <div class="scrollable-table-wrapper" style="margin-left: 1vw; margin-right: 1vw; max-height: 48vh; ">
            <table style="width: 100%; border-collapse: collapse">
                
                <% 
   			 if (orderNameList != null && !orderNameList.isEmpty()) {%>
		    <tr>
		        <th style="padding-left: 0; width: 2vw;">Item</th>
		        <th>Quantity</th>
		        <th>Price</th>
		    </tr>
		<% } %>
		
		<% 
		    for (int i = 0; i < orderNameList.size(); i++) {
		        int quantity = orderQuantityList.get(i); 
		%>
		<tr style="border-top: 2px solid rgb(145, 103, 158); height: 10vh;">
		    <td style="padding-left: 0; "><%= orderNameList.get(i) %></td>
		    <td>
		        <form action="" method="post">
		            <div class="quantity-container">
		                <span id="quantity_<%=i%>"><%=quantity%></span>
		                <input type="hidden" name="listIndex" value="<%= i %>">
		            </div>
		        </form>
		    </td>
		    <td style="width: 5vw"><%= String.format("%.2f", orderPriceList.get(i) * orderQuantityList.get(i)) %></td>
		</tr>
			
		<% } %>
		<% if (orderNameList != null && !orderNameList.isEmpty()) {%>
		<tr style="border-top: 2px solid rgb(145, 103, 158); height: 10vh;">
		    <td></td>
		    <td></td>
		    <td style = "widht: 50%; white-space: nowrap;"><h3>Total Price: <%= totalPrice %></h3></td>
		</tr>
		<% } %>
            </table>
            
        </div>
        	<table class="bottomform">
                <tr>
                    <th>Confirm Order?</th>
                    <th><form action="orderpage.jsp" method="post" style="display: inline-block; margin-right: 3%;">
					    <button type="submit">Edit</button>
					  </form>
					  <form action="ordersuccess.jsp" method="post" style="display: inline-block;">
					    <button type="submit">Confirm</button>
					  </form>
                    </th>
                </tr>
            </table>
    </form>
    
</div>

</body>

</html>
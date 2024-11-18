<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%@ page session="true" %>
 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Page</title>
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
	    height:220px;
	    padding: 30px;
	    background: rgba(44, 63, 82, 0.8);
	    color: #ED4E6E;
	    transform-origin: center;
	    transform: translateY(160px);
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
	    transform: translateY(30px);
	    background: transparentize(#2C3F52, 0.1);
	}
	
	figure:hover figcaption p {
	    opacity: 1;
	}
	
	figure:hover img {
	    transform: translateY(-2vh);
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
		border-top-left-radius: 0;
	    border-top-right-radius: 0;
	    border-bottom-left-radius: 24px; 
	    border-bottom-right-radius: 24px;
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
		</style>
	</head>
	<body>
	<div class="welcome-container">
		<%
		    String username = (String) session.getAttribute("username");
			int userId = (int) session.getAttribute("userId");
		%>
	    <div class="welcome-text">Welcome, <%out.print(username);%></div>
	    <a href="orderhistory.jsp" class="clickable-text">Check Order History</a> 
	</div>
	<div class="logout-container">
	    <a href="logout.jsp" class="clickable-text2">Logout</a> 
	</div>
	
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
	    
	    
	    String listIndexParam = request.getParameter("listIndex");
	    String addQuantityParam = request.getParameter("addQuantity");
	    
	    // subtract and add quantity
	    try {
	        
	        Integer listIndexValue = Integer.parseInt(listIndexParam);
	        Integer addQuantity = Integer.parseInt(addQuantityParam);
	        
	        
	        if (listIndexValue >= 0 && listIndexValue < orderQuantityList.size()) {
	            
	            orderQuantityList.set(listIndexValue, addQuantity);
	           
	        } else {
	            
	        }
	    } catch (NumberFormatException e) {
	        
	        e.printStackTrace(); 
	    }
	    
	    // add quantity through add to cart
	    String addButtonValue = request.getParameter("addButton");
	    boolean found = false;
	    
	    
	    if (addButtonValue != null && !addButtonValue.isEmpty()) {
	        
	        if (orderNameList != null && !orderNameList.isEmpty() && orderQuantityList != null && !orderQuantityList.isEmpty()) {
	            
	            for (int i = 0; i < orderNameList.size(); i++) {
	                // button pressed already in the list / check if item added is already in the list)
	                if (addButtonValue.equalsIgnoreCase(orderNameList.get(i))) {
	                    
	                    Integer currentQuantity = orderQuantityList.get(i);
	                    Float currentPrice = orderPriceList.get(i);
	                    orderQuantityList.set(i, currentQuantity + 1);
	                    orderPriceList.set(i, currentPrice); 
	                    found = true;
	                    break;
	                }
	            }
	        }
	    }
	    
	    if (!found) {
	        if ("Steak".equals(addButtonValue)) { 
	            orderNameList.add("Steak");
	            orderPriceList.add(150.0f); 
	            orderQuantityList.add(1); 
	        } else if ("Pizza".equals(addButtonValue)) { 
	            orderNameList.add("Pizza");
	            orderPriceList.add(120.0f); 
	            orderQuantityList.add(1); 
	        }
	        else if ("Hamburger".equals(addButtonValue)) { 
	            orderNameList.add("Hamburger");
	            orderPriceList.add(90.0f); 
	            orderQuantityList.add(1); 
	        }
	        else if ("Salmon".equals(addButtonValue)) { 
	            orderNameList.add("Salmon");
	            orderPriceList.add(150.0f); 
	            orderQuantityList.add(1); 
	        }
	        else if ("Kebab".equals(addButtonValue)) { 
	            orderNameList.add("Kebab");
	            orderPriceList.add(80.0f); 
	            orderQuantityList.add(1); 
	        }
	        else if ("Cake".equals(addButtonValue)) { 
	            orderNameList.add("Cake");
	            orderPriceList.add(40.0f); 
	            orderQuantityList.add(1); 
	        }
	        else if ("Macaron".equals(addButtonValue)) { 
	            orderNameList.add("Macaron");
	            orderPriceList.add(60.0f); 
	            orderQuantityList.add(1); 
	        }
	        else if ("Pancake".equals(addButtonValue)) { 
	            orderNameList.add("Pancake");
	            orderPriceList.add(70.0f); 
	            orderQuantityList.add(1); 
	        }
	        else if ("Tea".equals(addButtonValue)) { 
	            orderNameList.add("Tea");
	            orderPriceList.add(30.0f); 
	            orderQuantityList.add(1); 
	        }
	        else if ("Juice".equals(addButtonValue)) { 
	            orderNameList.add("Juice");
	            orderPriceList.add(40.0f); 
	            orderQuantityList.add(1); 
	        }
	        
	    }
	
	
	   
	    String removeIndex = request.getParameter("removeIndex");
	    if (removeIndex != null && !removeIndex.isEmpty()) {
	        try {
	            int index = Integer.parseInt(removeIndex);
	            if (index >= 0 && index < orderNameList.size()) {
	                orderNameList.remove(index);
	                orderPriceList.remove(index);
	                orderQuantityList.remove(index);
	            }
	        } catch (NumberFormatException e) {
	        }
	    }
	%>
<form action="" class="formbody" method="post">
        <h6>Menu Items</h6>
            <div class="scrollable-table-wrapper">
                <table>
                    <tr>
					    <td width="50%">
					        <div class="nicebox">
					            <figure>
					                <img src="images/1.jpg" alt="image">
					                <figcaption style="margin: auto;">
					                    <h3>Garlic Butter Steak</h3>
					                    <span>Main Course | 150 Php</span>
					                    <p>A succulent steak marinated in garlic butter sauce and seared on a stove, and served with herbs. A plentiful and hearty main dish</p>
					                    <button type="submit" class="button addbutton" name="addButton" value="Steak">Add to Order</button>
					                </figcaption>
					            </figure>
					        </div>
					    </td>
					    <td width="50%">
					        <div class="nicebox">
					            <figure>
					                <img src="images/2.jpg" alt="image">
					                <figcaption style="margin: auto;">
					                    <h3>Ham and Cheese Pizza</h3>
					                    <span>Main Course | 120 Php</span>
					                    <p>A delicious pizza topped with savory ham, melted cheese, and tangy tomato sauce. A perfect dish to share with the family!</p>
					                    <button type="submit" class="button addbutton" name="addButton" value="Pizza">Add to Order</button>
					                </figcaption>
					            </figure>
					        </div>
					    </td>
					</tr>
					<tr>
					    <td width="50%">
					        <div class="nicebox">
					            <figure>
					                <img src="images/3.jpg" alt="image">
					                <figcaption style="margin: auto;">
					                    <h3>Quarter Pound Burger</h3>
					                    <span>Appetizer | 90 Php</span>
					                    <p>A juicy burger patty topped with fresh lettuce, tomatoes, onions, and creamy cheese, served on a sesame seed bun.</p>
					                    <button type="submit" class="button addbutton" name="addButton" value="Hamburger">Add to Order</button>
					                </figcaption>
					            </figure>
					        </div>
					    </td>
					    <td width="50%">
					        <div class="nicebox">
					            <figure>
					                <img src="images/4.jpg" alt="image">
					                <figcaption style="margin: auto;">
					                    <h3>Fried Salmon w/ Sauce</h3>
					                    <span>Main Course | 150 Php</span>
					                    <p>Fresh salmon fillet fried to perfection and served with a tangy sauce, topped with herbs to add flavour.</p>
					                    <button type="submit" class="button addbutton" name="addButton" value="Salmon">Add to Order</button>
					                </figcaption>
					            </figure>
					        </div>
					    </td>
					</tr>
					<tr>
					    <td width="50%">
					        <div class="nicebox">
					            <figure>
					                <img src="images/5.jpg" alt="image">
					                <figcaption style="margin: auto;">
					                    <h3>Shish Kebab</h3>
					                    <span>Main Course | 80 Php</span>
					                    <p>Tender pieces of marinated meat and vegetables skewered and grilled to perfection. A great meal to be eaten on the go!</p>
					                    <button type="submit" class="button addbutton" name="addButton" value="Kebab">Add to Order</button>
					                </figcaption>
					            </figure>
					        </div>
					    </td>
					    <td width="50%">
					        <div class="nicebox">
					            <figure>
					                <img src="images/6.jpg" alt="image">
					                <figcaption style="margin: auto;">
					                    <h3>Strawberry Macarons</h3>
					                    <span>Dessert | 40 Php</span>
					                    <p>Delicate Macarons filled with luscious strawberry cream, perfect for satisfying your sweet cravings, and sharing with your friends.</p>
					                    <button type="submit" class="button addbutton" name="addButton" value="Macaron">Add to Order</button>
					                </figcaption>
					            </figure>
					        </div>
					    </td>
					</tr>
					<tr>
					    <td width="50%">
					        <div class="nicebox">
					            <figure>
					                <img src="images/7.jpg" alt="image">
					                <figcaption style="margin: auto;">
					                    <h3>Strawberry Cake</h3>
					                    <span>Dessert | 60 Php</span>
					                    <p>A rich and creamy cheesecake infused with fresh strawberry flavor, topped with a sweet strawberry compote.</p>
					                    <button type="submit" class="button addbutton" name="addButton" value="Cake">Add to Order</button>
					                </figcaption>
					            </figure>
					        </div>
					    </td>
					    <td width="50%">
					        <div class="nicebox">
					            <figure>
					                <img src="images/8.jpg" alt="image">
					                <figcaption style="margin: auto;">
					                    <h3>Blueberry Pancakes</h3>
					                    <span>Breakfast | 70 Php</span>
					                    <p>Fluffy pancakes studded with juicy blueberries, drizzled with maple syrup and served with a dollop of whipped cream.</p>
					                    <button type="submit" class="button addbutton" name="addButton" value="Pancake">Add to Order</button>
					                </figcaption>
					            </figure>
					        </div>
					    </td>
					</tr>
					<tr>
					    <td width="50%">
					        <div class="nicebox">
					            <figure>
					                <img src="images/9.jpg" alt="image">
					                <figcaption style="margin: auto;">
					                    <h3>Purple Tea</h3>
					                    <span>Beverage | 30 Php</span>
					                    <p>A refreshing tea made from butterfly pea flowers, naturally colored purple and infused with a hint of lemon. A great beverage to calm you down</p>
					                    <button type="submit" class="button addbutton" name="addButton" value="Tea">Add to Order</button>
					                </figcaption>
					            </figure>
					        </div>
					    </td>
					    <td width="50%">
					        <div class="nicebox">
					            <figure>
					                <img src="images/10.jpg" alt="image">
					                <figcaption style="margin: auto;">
					                    <h3>Carrot Juice</h3>
					                    <span>Beverage | 40 Php</span>
					                    <p>Freshly squeezed carrot juice packed with vitamins and nutrients, perfect for a healthy start to your day.</p>
					                    <button type="submit" class="button addbutton" name="addButton" value="Juice">Add to Order</button>
					                </figcaption>
					            </figure>
					        </div>
					    </td>
					</tr>
				</table>
            </div>
    </form>
<div>
     <form action="" class="formbody" method="post">
        <h6 style="top: 2%;">Orders</h6>
        <div class="scrollable-table-wrapper" style="margin-left: 1vw; margin-right: 1vw; max-height: 48vh; ">
            <table style="width: 100%; border-collapse: collapse">
           <%if (orderNameList != null && !orderNameList.isEmpty()) {%>
		    <tr>
		        <th style="padding-left: 0;">Item</th>
		        <th>Price</th>
		        <th>Quantity</th>
		        <th style="padding-right: 0;">Action</th>
		    </tr>
		<% } %>
		
		<% 
		    for (int i = 0; i < orderNameList.size(); i++) {
		        int quantity = orderQuantityList.get(i); 
		%>
		<tr style="border-top: 2px solid rgb(145, 103, 158); height: 10vh;">
		    <td style="padding-left: 0; width: 5vw"><%= orderNameList.get(i) %></td>
		    <td style="width: 5vw"><%= String.format("%.2f", orderPriceList.get(i) * orderQuantityList.get(i)) %></td>
		    <td>
		        <form action="" method="post">
		            <div class="quantity-container">
		                <button type="submit" name="addQuantity" value="<%=quantity - 1%>" <% if (quantity == 1) { %>disabled<% } %>>-</button>
		                <span id="quantity_<%=i%>"><%=quantity%></span>
		                <input type="hidden" name="listIndex" value="<%= i %>">
		                <button type="submit" name="addQuantity" value="<%=quantity + 1%>">+</button>
		            </div>
		        </form>
		    </td>
		    <td style="width: 0%; padding-right: 0;">
		        <form action="" method="post">
		            <input type="hidden" name="removeIndex" value="<%= i %>">
		            <button type="submit">Remove</button>
		        </form>
		    </td>
		</tr>
		<% } %>
            </table>
            
        </div>
        	<table class="bottomform">
                <tr>
                    
                    <form action="confirmorder.jsp" method="post">
				    <table class="bottomform">
				        <tr>
				            <th>Done with your order?</th>
				            <th><button type="submit" onclick="checkout()">Checkout</button></th>
				        </tr>
				    </table>
				</form>
            </table>
    </form>
    
</div>
</body>
<script language="javascript">
    	function checkout() {
    	    // Check if the orderNameList is empty
    	    var orderNameList = <%= session.getAttribute("orderNameList") %>;
    	    if (!orderNameList || orderNameList.length === 0) {
    	        alert("You have no orders! Please add to checkout");
    	    }
    }
</script>

</html>
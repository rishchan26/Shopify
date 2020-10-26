<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopify</title>

<style>
	body {
		font-family: sans-serif;
	} 
	input[type="submit"] {
		background: green;
		border: 0px solid;
		color: white;
		padding: 20px;
		margin: 10px;
		cursor: pointer;
	}
	input:read-only {
		border: 0px solid;
	}
	td {
		padding: 20px;
	}
	form {
		padding: 20px;
	}
	th {
		padding: 20px;
		font-size: 1.2rem;
	}
	input[type="text"] {
		border: 1px solid black;
		padding: 6px;
	}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<form:form method="post" action="confirmOrder"> 
	<h1>Please confirm your order and details:</h1>
	<table>
		<h4> Your Order:</h4>
		<c:forEach items="${order.items}" var="item" varStatus="loop">
			<tr>
				<td>
					<c:out value="${item.name}"> </c:out>
				</td>
				<td>
					<c:out value="$${item.price}"> </c:out>
				</td>
				<td>
					<c:out value="${item.quantity}"> </c:out>
				</td>
			</tr>
		</c:forEach> 
	</table> 
	<table>
		<h4>Payment Details:</h4>
		<tr>
			<td>
				Credit Card Number: 
			</td>
			<td>
				<c:out value="${paymentInfo.cardNumber}"></c:out>
			</td>
		</tr>
		<tr>
			<td>
				Expiration Date: 
			</td>
			<td>
				<c:out value="${paymentInfo.expirationDate}"></c:out>
			</td>
		</tr>
		<tr>
			<td>
				CVV Code: 
			</td>
			<td>
				<c:out value="${paymentInfo.cvvCode}"></c:out>
			</td>
		</tr>
		<tr>
			<td>
				Card Holder Name: 
			</td>
			<td>
				<c:out value="${paymentInfo.cardHolderName}"></c:out>
			</td>
		</tr>
	</table>
	<table>
		<h4>Shipping Details:</h4>
		<tr>
			<td>
				Name: 
			</td>
			<td>
				<c:out value="${shippingInfo.name}"></c:out>
			</td>
		</tr>
		<tr>
			<td>
				Address Line 1: 
			</td>
			<td>
				<c:out value="${shippingInfo.addressLine1}"></c:out>
			</td>
		</tr>
		<tr>
			<td>
				Address Line 2: 
			</td>
			<td>
				<c:out value="${shippingInfo.addressLine2}"></c:out>
			</td>
		</tr>
		<tr>
			<td>
				City: 
			</td>
			<td>
				<c:out value="${shippingInfo.city}"></c:out>
			</td>
		</tr>
		<tr>
			<td>
				State: 
			</td>
			<td>
				<c:out value="${shippingInfo.state}"></c:out>
			</td>
		</tr> 
		<tr>
			<td>
				ZIP: 
			</td>
			<td>
				<c:out value="${shippingInfo.zip}"></c:out>
			</td>
		</tr>   
	</table>
	<input type="submit" value="Confirm Order">
</form:form>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopify</title>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

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
	td {
		padding: 20px;
	}
	form {
		position: relative;
		
		text-align: center;
	}
	th {
		padding: 20px;
		font-size: 1.2rem;
	}
	input[type="text"] {
		border: 1px solid black;
		padding: 6px;
		text-align: center;
	}
	input:read-only {
		border: 0px solid;
	}
	#errorMsg {
		color: red;
	}
</style>
<c:if test="${not empty quantityError}">
 	<script>alert("Not enough stock, please resubmit item quantities");</script>
</c:if>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<centre><form:form id ="orderEntry" modelAttribute="order" method="post" action="purchase/submitItems">    
	<table>
		<tr>
			<td colspan="3">
				<h1>Hi! Place your order at Shopify</h1>
			</td>
		</tr>
		<tr>
			<th>Item</th>
			<th>Price($)</th>
			<th>Enter Quantity</th>
		</tr>
		<tr>
			<td colspan="3"><p id="errorMsg"></p></td>
		</tr>
		<c:forEach items="${order.items}" var="item" varStatus="loop">
			<tr>
				<td>
					<form:input path="items[${loop.index}].name" readonly="true" />
				</td>
				<td>
					<form:input path="items[${loop.index}].price" readonly="true" />
				</td>
				<td>
					<form:input path="items[${loop.index}].quantity" onchange="checkQuantity(this.value, '${item.name}')"/>
				</td>
			</tr>
		</c:forEach>  
			<tr>
				<td colspan="3">
					<input type="submit"  value="Purchase">
				</td>  
			</tr>
	</table>
	
</form:form></centre>
<jsp:include page="footer.jsp"></jsp:include>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	var errSet = new Set();
	$("#orderEntry").submit(function(e) {
		if(errSet.size > 0) {
			e.preventDefault();	
			alert("Please check quantities")
		}
	});
	function checkQuantity(val, item) {
		if(val == "")
			val = 0;
		$.post("http://localhost:9080/Shopify/purchase/checkQuantityItems", {
			"item": item,
			"quantity": val
		})
		.done(function() {
			errSet.delete(item);
			$('#errorMsg')[0].innerHTML = "";
		})
		.fail(function(response) {
			errSet.add(item);
			$('#errorMsg')[0].innerHTML = response.responseText;
		});
	};
</script>
</html>
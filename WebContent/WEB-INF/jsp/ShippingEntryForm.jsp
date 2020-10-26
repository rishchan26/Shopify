<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/../css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script type="text/javascript">
function validate(){
    var f=document.getElementById("shippingform");
    var name=f["name"].value;
    var letters = /^[A-Za-z\s]+$/;
    var numbers = /^[0-9]+$/;
    if(!name.match(letters))
    {
    	alert("Enter a valid name");
    	return false;
    }
    var city=f["city"].value;
    if(!city.match(letters))
    {
    	alert("Enter a valid city name");
    	return false;
    }
    var state=f["state"].value;
    if(!state.match(letters))
    {
    	alert("Enter a valid state name");
    	return false;
    }
    var zip=f["zip"].value;
    if(!zip.match(/\d{5}/) && !zip.match(/\d{6}/))
    {
    	alert("Enter valid zip code");
    	//console.log(cvv.match("\d\d\d"));
    	return false;	
    }
    
    return true;
}
</script>

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
</style>
<meta charset="UTF-8">
<title>Shopify</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<form:form id="shippingform" modelAttribute="shippingInfo" method="post" action="submitShipping" onsubmit="return validate()">    
	<table>
	<tr>
		<td colspan="2">
			<h1>Enter shipping details: </h1>
		</td>
	</tr>
		<tr>
			<td>
				Name: 
			</td>
			<td>
				<form:input id="name" required="true" path="name" />
			</td>
		</tr>
		<tr>
			<td>
				Address Line 1: 
			</td>
			<td>
				<form:input required="true" path="addressLine1" />
			</td>
		</tr>
		<tr>
			<td>
				Address Line 2: 
			</td>
			<td>
				<form:input  path="addressLine2" />
			</td>
		</tr>
		<tr>
			<td>
				City: 
			</td>
			<td>
				<form:input id='city' required="true" path="city" />
			</td>
		</tr>
		<tr>
			<td>
				State: 
			</td>
			<td>
				<form:input id ="state" required="true" path="state" />
			</td>
		</tr> 
		<tr>
			<td>
				ZIP: 
			</td>
			<td>
				<form:input id ="zip" required="true" path="zip" />
			</td>
		</tr>   
		<tr>
			<td colspan="2">
				<input type="submit" value="Confirm Address">
			</td>  
		</tr>
	</table>
</form:form>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
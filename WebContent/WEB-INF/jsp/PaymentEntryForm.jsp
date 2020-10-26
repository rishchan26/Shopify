<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script type="text/javascript">
function validate(){
    var f=document.getElementById("paymentform");
    var ccn=f["ccn"].value;
    var letters = /^[A-Za-z\s]+$/;
    var numbers = /^[0-9]+$/;
    if(!ccn.match(numbers) || ccn.length!=16 )   //Credit card number of 16 digits
    {
    	alert("Enter valid credit card number");
    	return false;
    }
    var ed=f["ed"].value;
    var m=ed.charAt(0)+ed.charAt(1);
    var y=ed.charAt(3)+ed.charAt(4);
    var expiration= /^[0-9]{2}\/[0-9]{2}$/;
    if(!ed.match(expiration)||parseInt(m)<1||parseInt(m)>12|| parseInt(y)<20)
    {
    	alert("Enter valid card expiration date");
    	console.log(parseInt(y)<20);
    	return false;
    }
    var cvv=f["cvv"].value;
    if(!cvv.match(/\d{4}/) && !cvv.match(/\d{3}/))
    {
    	alert("Enter valid cvv");
    	//console.log(cvv.match("\d\d\d"));
    	return false;	
    }
    var cname=f["chn"].value;
    if(!cname.match(letters))   
    {
    	alert("Enter valid credit card holder name");
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
	input:read-only {
		border: 0px solid;
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
	}
</style>
<meta charset="UTF-8">
<title>Shopify</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<form:form id = "paymentform" modelAttribute="paymentInfo" method="post" action="submitPayment" onsubmit="return validate()">    
	<table>
		<tr>
			<td colspan="2">
				<h1>Enter payment details:</h1>
			</td>
		</tr>
		<tr>
			<td>
				Credit Card Number: 
			</td>
			<td>
				<form:input required="true" id="ccn" placeholder ="16 digit card number" path="cardNumber" />
			</td>
		</tr>
		<tr>
			<td>
				Expiration Date: 
			</td>
			<td>
				<form:input required="true" id="ed" placeholder ="MM/YY" path="expirationDate" />
			</td>
		</tr>
		<tr>
			<td>
				CVV Code: 
			</td>
			<td>
				<form:input required="true" id="cvv" placeholder ="3/4 digit CVV" path="cvvCode" />
			</td>
		</tr>
		<tr>
			<td>
				Card Holder Name: 
			</td>
			<td>
				<form:input required="true" id="chn" placeholder ="e.g. John Doe" path="cardHolderName" />
			</td>
		</tr>  
		<tr>
			<td colspan="2">
				<input type="submit" value="Add Payment Method">
			</td>  
		</tr>
	</table>
</form:form>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopify</title>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="jumbotron">
	<h1 class="display-1">Shopify</h1>
	<p class="lead">One stop shop for all your grocery needs!</p>
	<blockquote class="blockquote">
	  <p class="mb-0">Our mission is to create a world where everyone has access to the food they love and more time to enjoy it together.
	  </p>
	</blockquote>
</div>
<div class="jumbotron">
	<p class="lead">
		Our vision is to be earth's most customer-centric company; to build a place where people can come to find and discover anything they might want to buy online.
	</p>
</div>
<div class="row">
	<div class="col-sm-12 col-md-6">
		<div class="jumbotron">
			<h1>Our Services</h1>
			<ul class="homepage-list">
				<li>Shop the products you love</li>
				<li>Get same-day delivery or pickup</li>
				<li>Save time & money</li>
				<li>Deals that delight</li>
			</ul>
		</div>
	</div>
	<div class="col-sm-12 col-md-6">
		<div class="jumbotron">
			<h1>Our products</h1>
			<ul class="homepage-list">
				<li>Grocery</li>
				<li>Fresh Vegetables</li>
				<li>Dairy products</li>
				<li>Kitchenware</li>
			</ul>
			<button type="button" class="btn btn-primary"><a href="/Shopify/purchase">Start Shopping!</a></button>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</html>
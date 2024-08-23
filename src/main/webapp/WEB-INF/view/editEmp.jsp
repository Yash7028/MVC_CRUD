<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Employee</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="#">Emp Management System</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="home">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="addEmp">Edit
						Emp</a></li>

			</ul>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3 mb-3">
					<div class="card-header text-center">
					<h3>Add Emp</h3>
					<c:if test="${not empty msg}">
					<h5 class="text-success">${msg}</h5>
					<c:remove var="msg"/>
					</c:if>
					</div>
					<div class="card-body">
					<form action="${pageContext.request.contextPath}/updateEmp" method="post">
					<input type="hidden" name="id" value="${emp.id}">
					<div class="mb-3">
					<label>Enter Full Name</label>
					<input type="text" name="fullName" class="form-control" value="${emp.fullName}" >
					</div>
					<div class="mb-3">
					<label>Enter Address</label>
					<input type="text" name="address" class="form-control" value="${emp.address}">
					</div>
					<div class="mb-3">
					<label>Enter Email</label>
					<input type="text" name="email" class="form-control" value="${emp.email}">
					</div>
					<div class="mb-3">
					<label>Enter Password</label>
					<input type="text" name="password" class="form-control" value="${emp.password}" >
					</div>
					<div class="mb-3">
					<label>Enter Designation</label>
					<input type="text" name="designation" class="form-control" value="${emp.designation}">
					</div>
					<div class="mb-3">
					<label>Enter Salary</label>
					<input type="text" name="salary" class="form-control" value="${emp.salary}">
					</div>
					<button class="btn btn-primary">Submit </button>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#">Emp Management System</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="home">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="addEmp">Add Emp</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="register">Register</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="login">Login</a>
      </li>
     
    </ul>
  </div>
</nav>

<div class="container mt-3">
<div class="row">
<div class="col-md-12">
<div class="card">
<div class="card-header text-center">
<h4>All Emp Details</h4>
<c:if test="${not empty msg}">
					<h5 class="text-success">${msg}</h5>
					<c:remove var="msg"/>
					</c:if>
</div>
<div class="card-body">
<table class="table">
  <thead>
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Full Name</th>
      <th scope="col">Address</th>
      <th scope="col">Email</th>
      <th scope="col">password</th>
      <th scope="col">Designation</th>
      <th scope="col">Salary</th>
       <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach items="${empList}" var="emp">
    <tr>
      <th scope="row">${emp.id}</th>
      <td>${emp.fullName}</td>
      <td>${emp.address}</td>
      <td>${emp.email}</td>
      <td>${emp.password}</td>
      <td>${emp.designation}</td>
      <td>${emp.salary}</td>
     <td>
     <a href="editEmp/${emp.id}" class="btn btn-sm btn-primary">Edit</a>
     <a href="deleteEmp/${emp.id}" class="btn btn-sm btn-danger">Delete</a>
     </td>
    </tr>
   </c:forEach>
  </tbody>
</table>
</div>
</div>
</div>
</div>
</div>



    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
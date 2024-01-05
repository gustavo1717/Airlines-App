<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Form</title>
<style>
	.error{
	 color:red;
	}
	
	</style>
</head>
<body>
<div align="center">
<h1>User Form</h1>
<f:form action="saveUser" modelAttribute="user">
<table border="1">

<tr>
<td>Username: </td><td> <f:input path="username" value="${u.username}"/>
<f:errors path="username" cssClass="error"/></td>
</tr>

<tr>
<td>Password: </td><td> <f:input path="password"  value="${u.password}"/>
<f:errors path="" cssClass="error"/></td>
</tr>

<tr>
	<td>Role:</td>
	<td>
	<c:forEach items="${roles}" var="role">
            <label>
                <input type="radio" name="roleId" value="${role.roleId}">
                ${role.roleName}
            </label>
        </c:forEach>
	</td>
</tr>

<tr>
<td colspan="2" align="center"> <input type="submit" value="submit"></td>
</tr>

</table>
</f:form>


<p/>
<p/>
<c:if test="${not empty users}">

<table border="1">
 <tr>
	<th>User Id</th><th>Name</th><th>Password</th><th>Role</th>
</tr>
<c:forEach items="${users}" var="u">
	<tr>
		<td>${u.getUserId()}</td>
		<td>${u.getUsername()}</td>
		<td>${u.getPassword()}</td>
		<td>${role.roleName}</td>	
		
		<td>
			<a href="updateUser?userId=${u.getUserId()}">Update</a>
						|
			 <a href="deleteUser?userId=${u.getUserId()}">Delete</a>
		</td>			
	</tr>
	
		
</c:forEach>
</tr>
</table>
</c:if>

</div>
</body>
</html>
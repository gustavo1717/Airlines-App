<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"  %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Role Form</title>
<style>
.error{
 color:red;
}

</style>
</head>
<body>
<div align="center">
<h1>Role Form</h1>
<f:form  action="saveRole" method="POST" modelAttribute="role">
<table>

<tr>
<td>Role Name</td>
<td><f:input path="roleName"/></td>
<td><f:errors path="roleName" cssClass="error"/></td>
</tr>

<tr>

<td colspan="3" align="center"><input type="submit"  value="submit"/></td>

</tr>
</table>
</f:form>
</div>

<div align="center">
<c:if test="${not empty roles}">
<table border="1">
<tr>
<th>Role Id</th> <th>Role Name</th> <th>Action</th>
</tr>

<c:forEach items="${roles}" var="r">

<tr>
<td>${r.getRoleId()}</td>
<td>${r.getRoleName()}</td>
<td>
<a href="updateRole?roleId=${r.getRoleId()}">Update</a>
|
<a href="deleteRole?roleId=${r.getRoleId()}">Delete</a>
</td>
</tr>
</c:forEach>

</table>

</c:if>

</div>
</body>
</html>
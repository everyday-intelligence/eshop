<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" 
xmlns:c="http://java.sun.com/jsp/jstl/core" 
xmlns:fn="http://java.sun.com/jsp/jstl/functions" 
xmlns:spring="http://www.springframework.org/tags" 
xmlns:form="http://www.springframework.org/tags/form" 
xmlns:util="urn:jsptagdir:/WEB-INF/tags/util"
version="2.0">
    <jsp:directive.page language="java"
        contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" />
    <jsp:text>
        <![CDATA[ <?xml version="1.0" encoding="ISO-8859-1" ?> ]]>
    </jsp:text>
    <jsp:text>
        <![CDATA[ <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> ]]>
    </jsp:text>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<script  type="text/javascript">
function validatePass(p1, p2) {
    if (p1.value != p2.value || p1.value == '' || p2.value == '') {
        p2.setCustomValidity('Password incorrect');
    } else {
        p2.setCustomValidity('');
    }
}
</script>
<title>Insert title here</title>
</head>
<body>
<c:url value="${path}/user/update" var="updateLink"/>
<form:form action="${updateLink}" method="POST">
<table><tr>
	<td><form:label path="tel">tel</form:label></td>
    <td><form:input path="tel"/></td>
	</tr><tr>
	<td><form:label path="name">name</form:label></td>
	<td><form:input path="name" /></td>
	</tr><tr>
	<td><form:label path="mail">E_mail</form:label></td>
	<td><form:input path="mail" /></td>
	</tr><tr>
	<td><form:label path="login">login</form:label></td>
	<td><form:input path="login" /></td>
	</tr><tr>
	<td><form:label path="address">Adresse</form:label></td>
	<td><form:textarea path="address" /></td>
	</tr><tr>
	<td><form:label path="password">Password Actuelle</form:label></td>
	<td><form:input path="password" /></td>
	</tr><tr>
	<td></td>
	<td><input type="submit" value="Effectué"/> </td>
	</tr>
	</table>
</form:form>
</body>
</html>
</jsp:root>
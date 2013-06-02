<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ajouter une commande</title>
</head>
<body>

<form:form action="" method="POST">
<%-- 	<form:label path="qte">qte</form:label> --%>
<%-- 	<form:input path="qte" /> --%>
	<br>
	<form:label path="etat">etat</form:label>
	<form:input path="etat" />
	<br>
	<form:label path="date">date</form:label>
	<form:input path="date" />
	<br>
	
	<input type="submit" value="envoyer"/> 
</form:form>
</body>
</html>
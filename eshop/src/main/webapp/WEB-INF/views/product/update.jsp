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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
<c:url value="${path}/product/update" var="updateLink"/>
<form:form action="${updateLink}" method="POST">
	<form:label path="id">code</form:label>
	<form:input path="id"/>
	<br/>
	<form:label path="name">name</form:label>
	<form:input path="name" />
	<br/>
	<form:label path="category.name">category</form:label>
	<form:input path="category.name" />
	<br/>
	<form:label path="price">price</form:label>
	<form:input path="price" />
	<br/>
	<form:label path="couleur">couleur</form:label>
	<form:input path="couleur" />
	<br/>
	<input type="submit" value="envoyer"/> 
</form:form>
</body>
</html>
</jsp:root>
<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" 
xmlns:c="http://java.sun.com/jsp/jstl/core" 
xmlns:fn="http://java.sun.com/jsp/jstl/functions" 
xmlns:spring="http://www.springframework.org/tags" 
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
<hr/>
 <c:if test="${not empty maxPages}">
    <util:pagination maxPages="${maxPages}" page="${param.page}" size="${param.size}"/>
 </c:if>
<hr/>

Résultats de la recherche :
<br/> 
	<c:forEach items="${users}" var="user">
		name :	<a href="show/${user._id}"> ${user.name}</a>
		login : ${user.login}<br/>  
		prenom : ${user.prenom}<br/>     
		pwd : ${user.pwd}<br/> 	    
		_id : ${user._id}	    <br/> 
	<hr/>
	</c:forEach>
	
</body>
</html>
</jsp:root>

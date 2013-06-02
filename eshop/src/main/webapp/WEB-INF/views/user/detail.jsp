<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" 
xmlns:c="http://java.sun.com/jsp/jstl/core" 
xmlns:fn="http://java.sun.com/jsp/jstl/functions" 
xmlns:spring="http://www.springframework.org/tags" 
 xmlns:sec="http://www.springframework.org/security/tags"
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
<sec:authorize access="hasAnyRole('Admin','ROLE_ADMIN')">
	<a href="new">Ajouter un utilisateur</a>
<br/>
L'utilisateur dont l'identifiant est <c:out value="${user._id}"/> est<br/>
</sec:authorize> 
<sec:authorize access="hasAnyRole('Client','ROLE_USER','ROLE_VENDEUR')"><h4>Modifier le nom, l'adresse e-mail ou le mot de passe</h4></sec:authorize>
		<table ><tr><td>
		Nom: </td><td><c:out value="${user.name}" /></td>
		 </tr>  
	<tr><td>login: </td><td>	<c:out value="${user.login}"/></td></tr>
	<tr><td>	E-mail: </td><td>	<c:out value="${user.mail}"/></td></tr>
	<tr><td>password: </td><td>	<c:out value="${user.password}"/></td></tr>
	<tr><td>Adresse: 	</td><td><c:out value="${user.address}"/></td></tr>
	<tr><td></td><td></td><td>
	 <c:url value="/resources/images/modif.png" var="modif_image_url" />
 <c:url value="${path}/user/update/${user._id}" var="updateLink"/>

 <a href="${updateLink}"><img src="${modif_image_url}"/></a>
 <sec:authorize access="hasAnyRole('Admin','ROLE_ADMIN')">
 <c:url value="/resources/images/delete.png" var="delete_image_url" />
<c:url value="${path}/user/delete/${user._id}" var="deleteLink"/>
 <a href="${deleteLink}"><img src="${delete_image_url}"/></a>
 </sec:authorize>
 </td></tr>
	</table>

	
	
		<br/>		    

 <c:url value="/resources/images/update.png" var="update_image_url" />
 <c:url value="${path}/user/update/${user._id}" var="updateLink"/>

 <a href="${updateLink}"><img src="${update_image_url}"/></a>
	
</body>
</html>
</jsp:root>

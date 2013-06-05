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

	<a href="new">Ajouter une commande</a>
<br/>
<hr/>
 <c:if test="${not empty maxPages}">
    <util:pagination maxPages="${maxPages}" page="${param.page}" size="${param.size}"/>
 </c:if>
<hr/>

La liste des commandes est :
<br/> 
	<c:forEach items="${commandes}" var="commande">
		etat :	${commande.etat}<br/>
		 
		date : ${commande.date}<br/>
		user: ${commande.user.name}<br /> 
		Liste des produits commandés:<br/>
		
			 <c:forEach items="${commande.commandeUni}" var="item" varStatus="status">
       			 ${status.count}) ${item.product.name} , statut:
       			 ${item.statut} <br/>
       			 ${item.product.vendeur.name} 
   			 </c:forEach>
		somme TTC: ${commande.total}<br/>		    
		ref: ${commande._id}<br/>
		
		
		 <c:url value="delete/${commande._id}" var="deleteLink">
		 	<c:param name="page" value="${param.page}"/>
		 	<c:param name="size" value="${param.size}"/>
		 </c:url>
		 <c:url value="/resources/images/delete.png" var="delete_image_url" />
		 <a href="${deleteLink}"><img src="${delete_image_url}"/></a>
		 
		 
		 <c:url value="/resources/images/delete.png" var="delete_image_url" />
		 <a href="delete/${commande._id}" onclick="return confirm('etes vous sur de vouloir supprimer')"><img src="${delete_image_url}"/></a>
		 
		 <c:url value="/resources/images/update.png" var="update_image_url" />
		 <a href="update/${commande._id}"><img src="${update_image_url}"/></a>
	<hr/>
	</c:forEach>
	
</body>
</html>
</jsp:root>

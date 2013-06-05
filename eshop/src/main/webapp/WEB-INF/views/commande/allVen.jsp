<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" 
xmlns:c="http://java.sun.com/jsp/jstl/core" 
xmlns:fn="http://java.sun.com/jsp/jstl/functions" 
xmlns:spring="http://www.springframework.org/tags" 
xmlns:util="urn:jsptagdir:/WEB-INF/tags/util"
xmlns:sec="http://www.springframework.org/security/tags"
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

	<p align="right"><sec:authorize access="isAuthenticated()"> 
                     <a href="../resources/j_spring_security_logout"> Deconnexion</a></sec:authorize></p>

<c:if test="${empty  commandeVendeur}">
      <c:out value="vous ne disposez pas de commande pour le moment." /> 
		<br/>
		
		
		
	
</c:if>
<c:if test="${not empty  commandeVendeur}">
  
		
		
	

<h4>La liste de mes commandes est :</h4>
<br/> 
 
   
	<c:forEach items="${commandeVendeur}" var="commande">
				etat :	${commande.etat}<br/> 
				Prix totale :	${commande.total}<br/> 
				date : ${commande.date}<br/>
				User : ${commande.user.name}<br/>
			 <c:forEach items="${commande.commandeUni}" var="item" varStatus="status">
       			 
       			 <c:if test="${item.product.vendeur.mail == vendeurConcerne.mail}">
       			 ${status.count}) ${item.product.name}, ref: ${item.product._id}
       		 <c:if test="${not empty item.statut }">
       			statut: ${item.statut}
       			</c:if>
       			 </c:if>
       		
       		 
       		<a href="/eshop/commande/updateS/${commande._id}">valider la commande</a><br/>   
       			 
   			 </c:forEach>
   			 <br/>
			 
	
	<hr/>
	</c:forEach>
</c:if>
</body>
</html>
</jsp:root>

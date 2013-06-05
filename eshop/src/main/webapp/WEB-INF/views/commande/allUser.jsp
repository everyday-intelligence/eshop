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

	<a href="../cart/all">Ajouter une commande</a>
<br/>
<hr/>
<c:if test="${empty  commandUser}">
      <c:out value="vous ne disposez pas de commande , veuillez poursuivre votre achat." /> 
		<br/>
		
		<c:url value="/resources/images/poursuivre.png" var="poursuivre_image_url" />
		<a href="/eshop/product/all"><img src="${poursuivre_image_url}" /></a>
		
	
</c:if>
<c:if test="${not empty commandUser}">

		<util:pagination maxPages="${maxPages}" page="${param.page}"
			size="${param.size}" />

La liste des commandes est :
<br/> 
	<c:forEach items="${commandUser}" var="commande">
				etat :	${commande.etat}<br/> 
				Prix totale :	${commande.total}<br/> 
				date : ${commande.date}<br/>
				Liste des produits<br/>
			 <c:forEach items="${commande.commandeUni}" var="item" varStatus="status">
       			 ${status.count}) ${item.product.name}, fournisseur: ${item.product.vendeur.name},
       			  <c:if test="${not empty item.statut }">
       			statut: ${item.statut}
       			</c:if>
       			<br/>
   			 </c:forEach>
			    
	
	<hr/>
	</c:forEach>
	</c:if>
</body>
</html>
</jsp:root>

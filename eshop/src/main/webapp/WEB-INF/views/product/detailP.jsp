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
<title>detail</title>
 <link rel="stylesheet" href="../resources/css/productAll.css" />
</head>
<div id="entete">


 <div id="enteteLogo"><img src ="../resources/images/logo.eshop.gif"/></div>

</div>
<div id="main">
 <div id="menu">
	 <div id="rech"><div class="fpBloc" style="height: auto;">
	 		<div class="fpBlocTitle">Affinez votre rechreche</div>
	 		<div class="fpBlocContent" id="blcconfig" style="display: block;">
	 		<div class="fconfig text">
	 		
		<c:url value="${path}/product/searchCriteria" var="searchLink"/>
	   <form:form action="${searchLink}" method="GET" autocomplete="on">
  

   <INPUT  name="couleur" id="recherche-texte" placeholder="couleur" />

 <INPUT  name="description"  id="recherche-texte" placeholder="description"/>

  <INPUT name="name" id="recherche-texte" placeholder="nom" />
  <INPUT name="name" id="recherche-texte" placeholder="nom" />

   
   
  
     <BUTTON id="search" >search</BUTTON>
  
  
</form:form>
	 		
	 		</div>
	 		</div>
	 		</div>
	 </div>
 </div>

 <div id="contenu">

<body>


		<util:pagination maxPages="${maxPages}" page="${param.page}"
			size="${param.size}" />
	

<c:forEach items="${products}" var="product">



		<table >
		<tr><td>
		Ref: </td><td><c:out value="${product._id}" /></td>
		 </tr>  
		<tr><td>
		Nom: </td><td><c:out value="${product.price}" /></td>
		 </tr>  
	<tr><td>login: </td><td>	<c:out value="${product.category}"/></td></tr>
	<tr><td>	E-mail: </td><td>	<c:out value="${product.name}"/></td></tr>
	<tr><td>password: </td><td>	<c:out value="${product.description}"/></td></tr>
	<tr><td>Adresse: 	</td><td>
	
	<c:url value="/product/image/${product._id}/${product.photos[0]}" var="imgSrc"/>
         
         <img src="${imgSrc}"/>
	
	</td></tr>
	<tr><td></td><td></td><td>
	 <c:url value="/resources/images/modif.png" var="modif_image_url" />
 <c:url value="${path}/product/update/${product._id}" var="updateLink"/>

 <a href="${updateLink}"><img src="${modif_image_url}"/></a>

 <c:url value="/resources/images/supp.png" var="delete_image_url" />
<c:url value="${path}/product/delete/${product._id}" var="deleteLink"/>
 <a href="${deleteLink}"><img src="${delete_image_url}"/></a>

 </td></tr>
	</table>
</c:forEach>
	
	
	
</body>
</div>
 
</div>

<div id="footer">
© 2013, E-shop.com
</div>
</html>
</jsp:root>

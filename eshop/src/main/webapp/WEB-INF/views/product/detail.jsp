<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" 
xmlns:c="http://java.sun.com/jsp/jstl/core" 
xmlns:fn="http://java.sun.com/jsp/jstl/functions" 
xmlns:spring="http://www.springframework.org/tags" 
xmlns:sec="http://www.springframework.org/security/tags" 
xmlns:security="http://www.springframework.org/schema/security"
xmlns:form="http://www.springframework.org/tags/form" 
xmlns:util="urn:jsptagdir:/WEB-INF/tags/util"


version="2.0">
    <jsp:directive.page language="java"
        contentType="text/html; charset=utf-8" pageEncoding="ISO-8859-1" />
    <jsp:text>
        <![CDATA[ <?xml version="1.0" encoding="ISO-8859-1" ?> ]]>
    </jsp:text>
    <jsp:text>
        <![CDATA[ <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> ]]>
    </jsp:text>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta  charset="utf-8" />
<title>detail</title>
 <link rel="stylesheet" href="../../resources/css/productAll.css" />
  
</head>

<div id="entete">


 <div id="enteteLogo"><img src ="../../resources/images/logo.eshop.gif"/></div>

</div>
<div id="main">
 <div id="menu">
	 <div id="rech"><div class="fpBloc" style="height: auto;">
	 		<div class="fpBlocTitle">Affinez votre rechreche</div>
	 		<div class="fpBlocContent" id="blcconfig" style="display: block;">
	 		<div class="fconfig text">
	 		
		<c:url value="${path}/product/searchCriteria" var="searchLink"/>
	   <form action="${searchLink}" method="GET" autocomplete="on">
  

   <INPUT  name="couleur" id="recherche-texte" placeholder="couleur" />

 <INPUT  name="description"  id="recherche-texte" placeholder="description"/>

  <INPUT name="name" id="recherche-texte" placeholder="nom" />
  <INPUT name="name" id="recherche-texte" placeholder="nom" />

   
   
  
     <BUTTON id="search" >search</BUTTON>
  
  
</form>
	 		
	 		</div>
	 		</div>
	 		</div>
	 </div>
 </div>

 <div id="contenu">
<body>


<p align="right"><a href="../../user/new">Inscription       </a><a href="../../authentication/login">connexion</a></p>
	<h5 align="right">
			<c:url value="/resources/images/16-cart.png" var="panier_image_url" />
		<a href="/eshop/cart/all"><img src="${panier_image_url}" /></a>
	
	</h5>

<table>
      <tr>
         <td>
         <c:url value="/product/image/${product._id}/${product.photos[0]}" var="imgSrc"/>
         
         <img src="${imgSrc}"/>
			
         
         </td><td>prix</td>
         <td>${product.price}</td>
      </tr>
      
      
      <tr><td></td>
         <td>Descriptions</td>
         <td>${product.description}</td>
      </tr>
      <tr><td>
  <a href="/eshop/note/add/${product._id}">Donner une note</a></td></tr>
   </table>
   <a href="/eshop/cart/add/${product._id}">Ajouter au panier</a><br/>
		<sec:authorize access="hasAnyRole('Admin','ROLE_ADMIN')">	    
<c:url value="/resources/images/delete.png" var="delete_image_url" />
<c:url value="${path}/product/delete/${product._id}" var="deleteLink"/>
 <a href="${deleteLink}"><img src="${delete_image_url}"/></a>
 
 <c:url value="/resources/images/update.png" var="update_image_url" />
 <c:url value="${path}/product/update/${product._id}" var="updateLink"/>

 <a href="${updateLink}"><img src="${update_image_url}"/></a>
	<a href="new">Ajouter un produit</a>
	</sec:authorize>

</body>

 </div>
 
</div>

<div id="footer">
� 2013, E-shop.com
</div>
	</html>
</jsp:root>

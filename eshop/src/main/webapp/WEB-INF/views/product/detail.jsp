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
<html>
<head>
<meta  charset="utf-8" />
<title>Insert title here</title>
</head>
<body>

<br/>
<p align="right"><a href="../../user/new">Inscription       </a><a href="../../authentication/login">connexion</a></p>
	<h5 align="right">
			<c:url value="/resources/images/16-cart.png" var="panier_image_url" />
		<a href="/eshop/cart/all"><img src="${panier_image_url}" /></a>
	
	</h5>

<table>
      <tr>
         <td>
         <c:url value="uploadphototest/${product._id}/${product.photos[0]}" var="imgSrc"/>
         
         <img src="${imgSrc}"/>
			
         
         </td><td>prix</td>
         <td>${product.price}</td>
      </tr>
      
      <tr><td></td>
         <td>Couleur Disponibles</td>
         <td>${product.couleur}</td>
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
</html>
</jsp:root>

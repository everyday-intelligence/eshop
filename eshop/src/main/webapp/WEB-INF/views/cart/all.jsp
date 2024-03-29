<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" 
xmlns:c="http://java.sun.com/jsp/jstl/core" 
xmlns:fn="http://java.sun.com/jsp/jstl/functions" 
xmlns:spring="http://www.springframework.org/tags" 
xmlns:sec="http://www.springframework.org/security/tags" 
xmlns:security="http://www.springframework.org/schema/security"
xmlns:form="http://www.springframework.org/tags/form" 
xmlns:util="urn:jsptagdir:/WEB-INF/tags/util"
version="2.0">    <jsp:directive.page language="java"
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
 <link rel="stylesheet" href="../resources/css/productAll.css" />
</head>
<body>
<div id="entete">

 <div id="enteteLogo"><img src ="../resources/images/logo.eshop.gif"/></div>
<a href="/eshop/authentication/login">Connexion</a>|<a href="/eshop/user/new">Inscription</a>
		|<a href="/eshop/cart/all">Mon panier</a>|<a href="/eshop/product/all">Acceuil</a>
		<sec:authorize access="isAuthenticated()">
			|<a href="../authentication/loginsuccess">Profil      </a>|
	<a href="../resources/j_spring_security_logout">deconnexion      </a></sec:authorize>

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
 		<div id="headerC">
 					<nav id="ddmenuMst">
 					
	<!-- REchercher -->
		<div style="display: block" align="right">
		<c:url value="${path}/product/search" var="searchLink"/>
	   <form:form action="${searchLink}" method="GET"  class="form-wrapper">
   	 	 <TABLE><tr>
    	<td><INPUT   id="recinput" name="category" placeholder="Rechercher par produit" /></td>
   			<td><BUTTON id="search">ok</BUTTON></td></tr>
   		 </TABLE>
	</form:form>
</div>
 		</nav>	
 		 </div>
<h2>Votre panier </h2>
<form:form action="" method="POST">
<c:if test="${empty  shoppingCart.commandeUni}">
      <c:out value="Votre panier ne contient aucun article. Vous pouvez revenir sur notre page d'accueil en cliquant sur � Poursuivre vos achats �." /> 
		<br/>
		
		<c:url value="/resources/images/poursuivre.png" var="poursuivre_image_url" />
		<a href="/eshop/product/all"><img src="${poursuivre_image_url}" /></a>
		
	
</c:if>
<c:if test="${not empty shoppingCart.commandeUni}">
		
	
<c:forEach var="cmdU" items="${shoppingCart.commandeUni}">

Produit: ${cmdU.product.name} , Prix Unitaire:  ${cmdU.product.price},Qantite: ${cmdU.qte} 



		<c:url value="/resources/images/quantity_up.gif" var="quantity_up_image_url" />
		<a href="/eshop/cart/addP/${cmdU.product._id}"><img src="${quantity_up_image_url}" /></a>
		
		<c:url value="/resources/images/quantity_down.gif" var="quantity_down_image_url" />
		<a href="/eshop/cart/remove/${cmdU.product._id}"><img src="${quantity_down_image_url}" /></a>
		
		
		<c:url value="/resources/images/delete_cart.gif" var="delete_cart_image_url" />
       <c:url value="${path}/cart/removeAll/${cmdU.product._id}" var="deleteLink"/>
       <a href="${deleteLink}"><img src="${delete_cart_image_url}"/></a>
       
<hr/> 
 </c:forEach>

 prixTotalHT:${shoppingCart.total}<br/>
 prixTotalTTC:${shoppingCart.totalTTC}
 <br/> NB: Hors Frais de transport
 
 <a href="/eshop/commande/add/${shoppingCart}"><br/>Poursuivre l'achat</a>
</c:if>
 </form:form>
  </div>
 
</div>
<div id="footer">
� 2013, E-shop.com
</div>
</body>
</html>
</jsp:root>
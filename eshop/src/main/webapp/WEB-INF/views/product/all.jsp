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
<meta  charset="UTF-8" />
<title>product/all</title>


		<script type="text/javascript">

//survol et click souris sur les étoiles des avis utilisateurs
//------------------------------------------------------------

function remplace(elem,note,x) {
	
	document.getElementById(elem).src = '../resources/images/clipart/' + x + '-star.png';
	document.getElementById(note).value = x; //on attribue la note à l'input
}
function disableMap(map,elem,note,x) {
	
	document.getElementById(elem).src = '../resources/images/clipart/' + x + '-star.png';
	document.getElementById(elem).useMap = '';
	document.getElementById(note).value = x;
	document.getElementById(elem).style.cursor = 'pointer';
}
function enableMap(map,elem,note) {
	
	document.getElementById(elem).useMap = map+i;
	document.getElementById(elem).style.cursor = 'pointer';
	document.getElementById(note).value = '';
}

</script>
 <link rel="stylesheet" href="../resources/css/productAll.css" />
  
</head>
<body>
<div id="entete">

 <div id="enteteLogo"><img src ="../resources/images/logo.eshop.gif"/></div>
<a href="/eshop/authentication/login">Connexion</a>|<a href="/eshop/user/new">Inscription</a>
		|<a href="/eshop/cart/all">Mon panier</a>|<a href="/eshop/product/all">Acceuil</a>
		<sec:authorize  access="isAuthenticated()">
			|<a href="../authentication/loginsuccess">Compte      </a>|
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


<sec:authorize access="hasAnyRole('Admin','ROLE_ADMIN')">	<a href="new">Ajouter un produit</a></sec:authorize>

	
<table >
<tr><td>   
		</td>
		

	
	</tr>
	<tr> <td><sec:authorize access="hasAnyRole('ROLE_VENDEUR')"> <a href="../product/new">ajouter un produit</a></sec:authorize></td></tr></table>
	

<!-- ENDREchercher -->


	<div class="spar"></div>
	<c:if test="${not empty maxPages}">
		<util:pagination maxPages="${maxPages}" page="${param.page}"
			size="${param.size}" />
	</c:if>
		<div class="spar"></div>

	
	
	<c:forEach items="${products}" var="product">
	<table><tr><td>
	<c:url value="/product/image/${product._id}/${product.photos[0]}" var="imgSrc"/>
         
        <a href="show/${product._id}"> <img src="${imgSrc}"/></a></td>
			
					 
				<td>	<details >
					   <summary>Caracteristiques techniques</summary>
					   <table>
					      <tr>
					         <th>Nom</th>
					         <th>Détails</th>
					      </tr>
					      <tr>
					         <td>Prix</td>
					         <td>${product.price}</td>
					      </tr>
					      <tr>
					         <td>Category</td>
					         <td>${product.category.name}</td>
					      </tr>
					      <tr>
					         <td>Descriptions</td>
					         <td>${product.description}</td>
					      </tr>
					  
					   </table>
					</details>
		</td></tr>
	</table>
	
	   <sec:authorize access="hasAnyRole('Admin','ROLE_ADMIN')">
			vendeur : ${product.vendeur.name}<br /> 	
            This session will be visible to an admin only.<br/>


		<c:url value="delete/${product._id}" var="deleteLink">
			<c:param name="page" value="${param.page}" />
			<c:param name="size" value="${param.size}" />
		</c:url>
		<c:url value="/resources/images/delete.png" var="delete_image_url" />
		<a href="${deleteLink}"><img src="${delete_image_url}" /></a>
		
		<c:url value="/resources/images/update.png" var="update_image_url" />
		<a href="update/${product._id}"><img src="${update_image_url}" /></a>
	   </sec:authorize>
		<a href="/eshop/cart/add/${product._id}">Ajouter au panier</a><br/>
		
		
		
		
	<form name="rateForm" id="rateForm" action="" method="post">
    <p><label>Note </label><img id="avis" src="../resources/images/clipart/0-star.png" border="0" usemap="#Map" onclick="enableMap('Map','avis','note');"/></p>
     <map name="Map" id="Map">
      <area shape="rect" coords="20,0,38,20" href="#" alt="une étoile" onmouseover="remplace('avis','note',1);" onclick="disableMap('Map','avis','note',1);"/>
      <area shape="rect" coords="38,0,56,20" href="#" alt="deux étoiles" onmouseover="remplace('avis','note',2);" onclick="disableMap('Map','avis','note',2);"/>
      <area shape="rect" coords="56,0,74,20" href="#" alt="trois étoiles" onmouseover="remplace('avis','note',3);" onclick="disableMap('Map','avis','note',3);"/>
      <area shape="rect" coords="74,0,92,20" href="#" alt="quatre étoiles" onmouseover="remplace('avis','note',4);" onclick="disableMap('Map','avis','note',4);"/>
      <area shape="rect" coords="92,0,110,20" href="#" alt="cinq étoiles" onmouseover="remplace('avis','note',5);" onclick="disableMap('Map','avis','note',5);"/>
      <area shape="rect" coords="0,0,20,20" href="#" alt="zéro étoiles" onmouseover="remplace('avis','note',0);" onclick="disableMap('Map','avis','note',0);"/>
    </map>
   
</form>
		<div class="spar"></div>
		
	</c:forEach>
	



 </div>
 
</div>

<div id="footer">
© 2013, E-shop.com
</div>
</body>
	</html>
</jsp:root>

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
        contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" />
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

<STYLE type="text/css">
body { 
 
  background: #eeeeee;
  color: #444;
}
</STYLE>
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

</head>
<body>
<div style=" width:1342px; height:900px;top:0px;">
<div style=" width:1342px; height:80px; position:absolute;">
	<c:import url="/authentication/login"></c:import>
		
	</div>
		
<sec:authorize access="hasAnyRole('Admin','ROLE_ADMIN')">	<a href="new">Ajouter un produit</a></sec:authorize>
	<p align="right">
	<sec:authorize access="isAuthenticated()">
	<a href="../authentication/loginsuccess">Profil      </a>
	<a href="../resources/j_spring_security_logout">deconnexion      </a>
	</sec:authorize>
	
	</p>
	<h5 align="right">
			${count}<c:url value="/resources/images/16-cart.png" var="panier_image_url" />
		<a href="/eshop/cart/all"><img src="${panier_image_url}" /></a>
		
		<a href="../product/searchCriteria">recherche avancee</a>
	
	</h5>

	
	<!-- REchercher -->
<div>
<c:url value="${path}/product/search" var="searchLink"/>
	   <form:form action="${searchLink}" method="GET"  class="form-wrapper">
    <FIELDSET>
    <LEGEND>search Criteria</LEGEND>
    <TABLE><tr>
    <td id="td_input"><LABEL for="name">name</LABEL></td>
    <td id="td_input"><INPUT id="name" name="name" placeholder="DEll" /></td></tr>
    <tr>
    <td><LABEL for="category">category</LABEL></td>
    <td><INPUT id="category" name="category" placeholder="Ordinateur" /></td>
    </tr>
    </TABLE>
     <BUTTON id="search">search</BUTTON>
    </FIELDSET>
    	
  
</form:form>
</div>

<!-- ENDREchercher -->


	<hr />
	<c:if test="${not empty maxPages}">
		<util:pagination maxPages="${maxPages}" page="${param.page}"
			size="${param.size}" />
	</c:if>
	<hr />

	
	<script type="text/javascript">
	int i=0;
	</script>
	<c:forEach items="${products}" var="product">
	<c:url value="uploadphototest/${product._id}/${product.photos[0]}" var="imgSrc"/>
         
        <a href="show/${product._id}"> <img src="${imgSrc}"/></a><br/>
			 ${product.name}
		 
<details>
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
         <td>Couleur Disponibles</td>
         <td>${product.couleur}</td>
      </tr>
      <tr>
         <td>Descriptions</td>
         <td>${product.description}</td>
      </tr>
  
   </table>
</details>
		
		
	
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
		<hr />
		
	</c:forEach>
</div>
</body>

	</html>
</jsp:root>

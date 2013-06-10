<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>ajouter un utilisateur</title>
<script  type="text/javascript">
function validatePass(p1, p2) {
    if (p1.value != p2.value || p1.value == '' || p2.value == '') {
        p2.setCustomValidity('Password incorrect');
    } else {
        p2.setCustomValidity('');
    }
}
</script>
<style>
.error {
	color: #ff0000;
}
.errorblock{
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding:8px;
	margin:16px;
}
</style>
 <link rel="stylesheet" href="../resources/css/inscri.css" />
	<link rel="stylesheet" href="../resources/css/productAll.css" />
</head>

<div id="entete">

 <div id="enteteLogo"><img src ="../resources/images/logo.eshop.gif"/></div>
<a href="/eshop/authentication/login">Connexion</a>|<a href="/eshop/user/new">Inscription</a>
		|<a href="/eshop/cart/all">Mon panier</a>

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

<body>
<fieldset> <legend>Formulaire d'insciption </legend> 


<table>
<form:form action="" method="POST" class="form">


<tr>	<td><form:label path="name">Nom</form:label></td>
	<td><form:input path="name" /></td></tr>
	<tr>
	<td><form:label path="prenom">Prenom</form:label></td>
	<td><form:input path="prenom" /></td>
	</tr>

	<tr>
	<td><form:label path="login">login</form:label></td>
	<td><form:input path="login" /></td>
</tr>

<tr>
	<td><form:label path="password" >password</form:label></td>
	<td><form:password path="password"  id="p1"  pattern=".{8}" title="le mot de passe doit contenir 8 caracteres"/></td>
	</tr>
	<tr>
	<td><form:label path="confirmpassword" >confirmer mot de passe</form:label></td>
	<td><form:password path="confirmpassword"  id="p2" pattern=".{8}" title="le mot de passe doit contenir 8 caracteres"
        onfocus="validatePass(document.getElementById('p1'), this);"
        oninput="validatePass(document.getElementById('p1'), this);"/></td>
	</tr>
	

	
	<td><p><label>E-mail: </td>
	<td><input name=mail type=Email required pattern="^[_A-Za-z0-9-\+]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$"></label></td>
	
	<tr>
	    <td><form:label path="role" >Vous etes:</form:label></td>
		<td>
		    <form:select path="role">
			<form:option value="NONE" label="--- Select ---"/>
			<form:options items="${roleList}" />
		    </form:select>
       </td>
	</tr>
	
	<tr>
	<td><form:label path="address" >adresse</form:label></td>
	<td><form:textarea path="address" /></td>
	</tr>

	
	<tr>
	<td>
	<input type="submit" value="envoyer"/></td></tr> 
</form:form>
</table>
</fieldset>
</body>

 </div>
 
</div>

<div id="footer">
© 2013, E-shop.com
</div>
	</html>


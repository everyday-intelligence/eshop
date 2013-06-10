<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>
<%@taglib uri="http://www.springframework.org/tags/form"   prefix="form"%>

<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<style>
.errorblock {
	color: #ff0000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}


</style>
<head>
    <meta charset="utf8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title></title>
    <link rel="stylesheet" href="../resources/css/login2.css" />
    <link rel="stylesheet" href="../resources/css/productAll.css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js?ver=1.4.2"></script>
 
    <script type="text/javascript">
$(document).ready(function() {
	$(".username").focus(function() {
		$(".user-icon").css("left","-48px");
	});
	$(".username").blur(function() {
		$(".user-icon").css("left","0px");
	});
	
	$(".password").focus(function() {
		$(".pass-icon").css("left","-48px");
	});
	$(".password").blur(function() {
		$(".pass-icon").css("left","0px");
	});
});
</script>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
    
</head>


<body>

<div id="entete">

 <div id="enteteLogo"><img src ="../resources/images/logo.eshop.gif"/></div>
<a href="/eshop/authentication/login">Connexion</a>|<a href="/eshop/user/new">Inscription</a>
		|<a href="/eshop/cart/all">Mon panier</a>|<a href="/eshop/product/all">Acceuil</a>
		<sec:authorize access="hasAnyRole('Admin','ROLE_ADMIN')">
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


            
 <!--WRAPPER-->
<div id="wrapper">

	
              
	<form action="eshop/resources/j_spring_security_check" method="post" class="login-form">
<!--HEADER-->
    <div class="header">
    <!--TITLE--><h1>Login Form</h1><!--END TITLE-->
    
    </div>
    <!--END HEADER-->
	
	<!--CONTENT-->
    <div class="content">


                           
			<label for="j_username">Username</label> <input id="j_username"
				name="j_username" type="Email" required id="email" placeholder="xxxx@gmail.com"  class="input username"/>
		
                           
			<label for="j_password">Password</label> <input id="j_password"
				name="j_password" type="password" required  id="password" placeholder="Password" class="input password"/>
				 </div>
    <!--END CONTENT-->
    
				
		 <!--FOOTER-->
    <div class="footer">
		
		<input type="submit" value="Login"  id="login"  class="button"/> <input name="reset" type="reset" class="button" />
<label for="checkbox"><input type="checkbox" id="checkbox" />Remember me</label>
                      
                        <span><a href="../user/new" class="register" >inscription</a></span>
	</div></form>
    </div>
    
<!--GRADIENT--><div class="gradient"></div><!--END GRADIENT-->

    
</div></div>
	<div id="footer">
© 2013, E-shop.com
</div>
</body>


</html>

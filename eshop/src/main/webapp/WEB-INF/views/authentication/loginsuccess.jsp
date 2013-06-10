<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta charset="utf-8">
<title>log</title>


<link rel="stylesheet" href="../resources/css/menu.css" />
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lobster" />
        <link rel="stylesheet" href="../resources/css/productAll.css" />

</head>
<body><div id="entete">

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

                       <h4 align="right"> ${username}</h4> 
                  
                  
                   <nav>
            <ul class="fancyNav">
                <sec:authorize access="hasAnyRole('ROLE_USER')">
                <li id="home"><a href="/eshop/product/all" class="homeIcon">Home</a></li>
                <li id="news"><a href="/eshop/product/all">Catalogue de produits</a></li>
                <li id="about"><a href="/eshop/cart/all">Gestion de panier</a></li>
                <li id="services"><a href="/eshop/user/showU">Gestion de mon compte</a></li>
                <li id="contact"><a href="/eshop/commande/allUser">Consulter mes commandes en cours</a>
                </li>
                  
                            </sec:authorize>
                
                      
            <sec:authorize access="hasAnyRole('ROLE_VENDEUR')">
            <li id="home"><a href="/eshop/product/all" class="homeIcon">Home</a></li>
          <li id="home">  <a href="/eshop/product/all">catalogue de produits</a></li>
           <li id="home">  <a href="/eshop/user/showU"> compte</a></li>
          <li id="home">   <a href="/eshop/product/showP">mes produits</a></li>
           <li id="home"> <a href="/eshop/product/new">ajouter un produits</a></li>
           <li id="home"> <a href="/eshop/commande/allVen"> mes commandes </a></li>
             
            </sec:authorize>
            
         <sec:authorize access="hasAnyRole('Admin','ROLE_ADMIN')">
           <li id="home"><a href="/eshop/product/all" class="homeIcon">Home</a></li>
            <li id="home"> <a href="../product/new">ajouter un produits</a></li>
            <li id="home"> <a href="../product/all">Gerer le catalogue</a></li>
           <li id="home">   <a href="../user/all">Gerer les utilisateurs</a></li>
             
           <li id="home">  <a href="../commande/all"> les commandes en cours</a></li>
            
            
     </sec:authorize>
                
            </ul>
        </nav> 
                  
                  
  </div>
 
</div>
<div id="footer">
© 2013, E-shop.com
</div>
   </body>         
</html>






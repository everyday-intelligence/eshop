<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta charset="utf-8">
<title>log</title>


<link rel="stylesheet" href="../resources/css/menu.css" />
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lobster" />

</head>
<body>

                       <h4 align="right"> ${username}</h4> 
                  
                  
                   <nav>
            <ul class="fancyNav">
                <sec:authorize access="hasAnyRole('Client','ROLE_USER')">
                <li id="home"><a href="/eshop/product/all" class="homeIcon">Home</a></li>
                <li id="news"><a href="/eshop/product/all">Catalogue de produits</a></li>
                <li id="about"><a href="/eshop/cart/all">Gestion de panier</a></li>
                <li id="services"><a href="/eshop/user/showU">Gestion de mon compte</a></li>
                <li id="contact"><a href="/eshop/commande/allUser">Consulter mes commandes en cours</a>
                </li>
                  
                 <sec:authorize access="isAuthenticated()"> 
                 <li id="deconnexion">
                     <a href="../resources/j_spring_security_logout"> Deconnexion</a> </li>
              
                     
                     </sec:authorize>
            </sec:authorize>
                
                      
            <sec:authorize access="hasAnyRole('ROLE_VENDEUR')">
            <li id="home"><a href="/eshop/product/all" class="homeIcon">Home</a></li>
          <li id="home">  <a href="/eshop/product/all">catalogue de produits</a></li>
           <li id="home">  <a href="/eshop/user/showU"> compte</a></li>
          <li id="home">   <a href="/eshop/product/showP">mes produits</a></li>
           <li id="home"> <a href="/eshop/product/new">ajouter un produits</a></li>
           <li id="home"> <a href="/eshop/commande/allVen"> mes commandes </a></li>
             <sec:authorize access="isAuthenticated()"> 
                 <li id="deconnexion">
                     <a href="../resources/j_spring_security_logout"> Deconnexion</a>
                      </li>
                     </sec:authorize>
            </sec:authorize>
            
         <sec:authorize access="hasAnyRole('Admin','ROLE_ADMIN')">
           <li id="home"><a href="/eshop/product/all" class="homeIcon">Home</a></li>
            <li id="home"> <a href="../product/new">ajouter un produits</a></li>
            <li id="home"> <a href="../product/all">Gerer le catalogue</a></li>
           <li id="home">   <a href="../user/all">Gerer les utilisateurs</a></li>
             
           <li id="home">  <a href="../commande/all"> les commandes en cours</a></li>
             <sec:authorize access="isAuthenticated()"> 
                 <li id="deconnexion">
                     <a href="../resources/j_spring_security_logout"> Deconnexion</a>
                      </li>
                     </sec:authorize>
            
     </sec:authorize>
                
            </ul>
        </nav> 
                  
                  
                
            
      
   </body>         
</html>






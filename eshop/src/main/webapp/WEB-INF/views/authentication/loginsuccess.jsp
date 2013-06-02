<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta charset="utf-8">
<title>log</title>




</head>
<body>
                    <h1>Bienvenue: </h1><p align="right">
                     <sec:authorize access="isAuthenticated()"> 
                     <a href="../resources/j_spring_security_logout"> Deconnexion</a></sec:authorize>
                   
                     </p>

                   <h3> ${username}</h3> 
            <sec:authorize access="hasAnyRole('Client','ROLE_USER')">
            <a href="/eshop/product/all">Consulter le catalogue de produits</a><br>
            <a href="/eshop/cart/all">Gestion de panier</a><br>
            <a href="/eshop/user/showU">Gestion de mon compte</a><br>
            <a href="/eshop/commande/allUser">Consulter mes commandes en cours</a><br>
            </sec:authorize>
            
            <sec:authorize access="hasAnyRole('ROLE_VENDEUR')">
            <a href="/eshop/product/all">Consulter le catalogue de produits</a><br>
             <a href="/eshop/user/showU">Gestion de mon compte</a><br>
             <a href="/eshop/product/showP">Gestion de mes produits</a><br>
            <a href="/eshop/product/new">ajouter un produits</a><br>
            <a href="/eshop/commande/allVen">Consulter mes commandes relatif a mes produits</a><br>
            </sec:authorize>
            
         <sec:authorize access="hasAnyRole('Admin','ROLE_ADMIN')">
            <h2>Admin</h2>
             <a href="../product/new">ajouter un produits</a><br>
             <a href="../product/all">Gerer le catalogue</a><br>
              <a href="../user/all">Gerer les utilisateurs</a><br>
             
             <a href="../commande/all">consulter les commandes en cours</a><br>
             <hr>
     </sec:authorize>
   </body>         
</html>
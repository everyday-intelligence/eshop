<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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
    <link rel="stylesheet" href="../resources/css/login.css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js?ver=1.4.2"></script>
    <script src="../resources/js/login.js"></script>
</head>



<c:if test="${not empty error}">
	<div class="errorblock">
		Your login attempt was not successful, try again.
	
	</div>
</c:if>
<body>
   <div id="bar">
        <div id="container">
            <!-- Login Starts Here -->
            <div id="loginContainer">
                <a href="#" id="loginButton"><span>sign in</span><em></em></a>
                <a href="../user/new" id="loginButton"><span>Inscription</span><em></em></a>
                 <sec:authorize access="isAuthenticated()">
                <a href="../authentication/loginsuccess" id="loginButton"><span>Profil</span><em></em></a>
                </sec:authorize>
                <div style="clear:both"></div>
                <div id="loginBox">
	<form action="eshop/resources/j_spring_security_check" method="post" id="loginForm">

<fieldset id="body">
                            <fieldset>
			<label for="j_username">Username</label> <input id="j_username"
				name="j_username" type="Email" required id="email" placeholder="xxxx@gmail.com" />
		 </fieldset>
                            <fieldset>
			<label for="j_password">Password</label> <input id="j_password"
				name="j_password" type="password" required  id="password" placeholder="Password"/>
		 </fieldset>
		<input type="submit" value="Login"  id="login" /> <input name="reset" type="reset" />
<label for="checkbox"><input type="checkbox" id="checkbox" />Remember me</label>
                        </fieldset>
                        <span><a href="../user/new">inscription</a></span>
	</form>
    </div>
            </div>
               </div>
    </div>

	
</body>
</html>

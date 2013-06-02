<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<meta charset="utf-8" />

<!-- <link rel="stylesheet" -->
<%-- 	href="<c:url value="/resources/css/normalize.css"/>" /> --%>
<%-- <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>" /> --%>
<!-- <link rel="stylesheet" -->
<%-- 	href="<c:url value="/resources/css/bootstrap-responsive.min.css"/>" /> --%>
<!-- <link rel="stylesheet" -->
<%-- 	href="<c:url value="/resources/css/bootstrap.min.css"/>" /> --%>
<!-- <link rel="stylesheet" -->
<%-- 	href="<c:url value="/resources/css/style.css"/>" /> --%>
<%-- <script src="<c:url value="/resources/js/jquery-1.8.0.min.js" />"></script> --%>
<%-- <script src="<c:url value="/resources/js/modernizr-2.6.1.min.js"/>"></script> --%>



<!-- <link rel="shortcut icon" href="/resources/css/images/favicon.ico" /> -->
<!-- <link rel="stylesheet" -->
<%-- 	href="<c:url value="/resources/css/jquery.jscrollpane.css"/>" /> --%>

<%-- <script src="<c:url value="/resources/js/jquery-1.7.min.js" />"></script> --%>
<%-- <script src="<c:url value="/resources/js/DD_belatedPNG-min.js" />"></script> --%>
<!-- <script -->
<%-- 	src="<c:url value="/resources/js/jquery.jscrollpane.min.js" />"></script> --%>
<%-- <script src="<c:url value="/resources/js/jquery.jcarousel.js" />"></script> --%>
<%-- <script src="<c:url value="/resources/js/functions.js" />"></script> --%>
</head>
<c:if test="${not empty error}">
	<div class="errorblock">
		Your login attempt was not successful, try again.<br /> Caused :
		${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
	</div>
</c:if>
<body>
<fieldset> <legend>connexion </legend> 
<table>

<tr><td>
	<form action="eshop/resources/j_spring_security_check" method="post">

		<p>
			<label for="j_username">Username</label> <input id="j_username"
				name="j_username" type="Email" required />
		</p>
		<p>
			<label for="j_password">Password</label> <input id="j_password"
				name="j_password" type="password" required />
		</p>
		<input type="submit" value="Login" /> <input name="reset" type="reset" />

	</form>
	</td></tr>
	
</table>
</fieldset>
<a href="../user/new">inscription</a>
</body>
</html>

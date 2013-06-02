<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<%--  <link rel="stylesheet" href="<c:url value="../resources/css/normalize.css"/>"/>  --%>
<%--         <link rel="stylesheet" href="<c:url value="../resources/css/main.css"/>"/> --%>
<%--         <link rel="stylesheet" href="<c:url value="../resources/css/bootstrap-responsive.min.css"/>"/> --%>
<%--         <link rel="stylesheet" href="<c:url value="../resources/css/bootstrap.min.css"/>"/> --%>
<%--         <link rel="stylesheet" href="<c:url value="../resources/css/style.css"/>"/> --%>
<%--         <script src="<c:url value="../resources/js/jquery-1.8.0.min.js" />"></script>         --%>
<%--         <script src="<c:url value="../resources/js/modernizr-2.6.1.min.js"/>"></script> --%>
    

	
<!-- 	<link rel="shortcut icon" href="../resources/css/images/favicon.ico" /> -->
<%-- 	<link rel="stylesheet" href="<c:url value="../resources/css/jquery.jscrollpane.css"/>"/> --%>

<%-- 	 <script src="<c:url value="../resources/js/jquery-1.7.min.js" />"></script>   --%>
<%-- 	<script src="<c:url value="../resources/js/DD_belatedPNG-min.js" />"></script>   --%>
<%-- 	<script src="<c:url value="../resources/js/jquery.jscrollpane.min.js" />"></script>   --%>
<%-- 	<script src="<c:url value="../resources/js/jquery.jcarousel.js" />"></script>   --%>
<%-- 	<script src="<c:url value="../resources/js/functions.js" />"></script>   --%>
	
</head>
<body>
<fieldset> <legend>Formulaire d'insciption </legend> 


<table>
<form:form action="" method="POST">
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
	<td><form:password path="password"  id="p1"  pattern=".{8,}" title="8 characters minimum"/></td>
	</tr>
	<tr>
	<td><form:label path="confirmpassword" >confirmer mot de passe</form:label></td>
	<td><form:password path="confirmpassword"  id="p2" pattern=".{8,}" title="8 characters minimum"
        onfocus="validatePass(document.getElementById('p1'), this);"
        oninput="validatePass(document.getElementById('p1'), this);"/></td>
	</tr>
	
<!-- 	<tr> -->
<%-- 	<td><form:label path="tel" >tel</form:label></td> --%>
<%-- 	<td><form:input path="tel" /></td> --%>
<!-- 	</tr> -->
	<tr>
<%-- 	<td><form:label path="mail" >mail</form:label></td> --%>
<%-- 	<td><form:input path="mail"  /></td> --%>
	
	<td><p><label>E-mail: </td>
	<td><input name=mail type=Email required></label></p></td>
	</tr>
	<tr>
	    <td><form:label path="role" >role</form:label></td>
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
</html>
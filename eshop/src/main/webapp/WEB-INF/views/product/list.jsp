<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" 
xmlns:c="http://java.sun.com/jsp/jstl/core" 
xmlns:fn="http://java.sun.com/jsp/jstl/functions" 
xmlns:spring="http://www.springframework.org/tags" 
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>product/all</title>

<STYLE type="text/css">
.submit-button {
	background-image: url('../resources/images/bouton_recherche.png')
		no-repeat;
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

	<h2>Movies</h2>
<c:choose>
 <c:when test="${not empty products}">
 <dl class="listings">
 <c:forEach items="${products}" var="movie">
 <dt>
 <a href="/products/${movie._id}"><c:out value="${movie.Name}" /></a><br/>
 </dt>
 <dd>
 <c:out value="${movie.description}" escapeXml="true" />
 </dd>
 </c:forEach>
 </dl>
 </c:when>
 <c:otherwise>
 No movies found for query &quot;${query}&quot;.
 </c:otherwise>
</c:choose>
</body>
	</html>
</jsp:root>

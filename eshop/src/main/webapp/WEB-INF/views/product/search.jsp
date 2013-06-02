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
<title>search</title>

<STYLE type="text/css">
.submit-button {
	background-image: url('../resources/images/bouton_recherche.png')
		no-repeat;
		}
</STYLE>



</head>
<body>
	<h5 align="right"><a href="/eshop/cart/all">Mon panier</a></h5>



		<c:url value="${path}/product/search" var="searchLink"/>
	   <form:form action="${searchLink}" method="GET" autocomplete="on">
    <FIELDSET>
    <LEGEND>search Criteria</LEGEND>
    <TABLE><tr>
    <td><LABEL for="name">name</LABEL></td>
    <td><INPUT id="name" name="name" /></td>
    </tr>
    <tr>
    <td><LABEL for="category">category</LABEL></td>
    <td><INPUT id="category" name="category" /></td>
    </tr>
    </TABLE>
     <BUTTON id="search"  >search</BUTTON>
    </FIELDSET>
  
</form:form>
	<c:if test="${empty psSearch}">
   <c:out value="Please provide valid search criteria" /> 
		</c:if>
	<c:if test="${not empty psSearch}">


	<table><tr><th>name</th><th>description</th><th>price</th>
	
	<c:forEach items="${psSearch}"  var="product">
	
	<tr>
		<td>	name :	<a href="show/${product._id}"> ${product.name}</a></td>
		<td>	Description : ${product.description}<br/> 	</td>  
		<td>	price : ${product.price}<br/>  </td>
		<td>	category : ${product.category.name}<br/>  </td>
		<td><a href="/eshop/cart/add/${product._id}">Ajouter au panier</a></td>
		</tr>
		</c:forEach>
		
	</tr>
	</table>

	
	</c:if>
 

	


	</body>
	</html>
</jsp:root>

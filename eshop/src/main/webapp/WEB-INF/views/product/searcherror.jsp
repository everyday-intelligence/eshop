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
     <BUTTON id="search" >search</BUTTON>
    </FIELDSET>
  
</form:form>
<h3>produit introuvale </h3>
	</body>
	</html>
</jsp:root>

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
<SCRIPT language="javascript">
	var c, c2, ch1, ch2, ch3;

	// ajouter un champ avec son "name" propre;
	function plus() {
		c = document.getElementById('cadre');
		c2 = c.getElementsByTagName('input');
		ch1 = document.createElement('input');
		ch2 = document.createElement('input');

		ch1.setAttribute('type', 'text');
		ch1.setAttribute('name', 'couleur');
		ch1.setAttribute('readonly','readonly'); 
		ch1.setAttribute('value', 'attribut'+c2.length/2);
		ch1.setAttribute('style', 'border:none');

		ch2.setAttribute('type', 'text');
		ch2.setAttribute('name', 'description');
		ch3.setAttribute('type', 'text');
		ch3.setAttribute('name', 'name');
		c.appendChild(ch1);
		c.appendChild(ch2);
		c.appendChild(ch3);

		document.getElementById('sup').style.display = 'inline';
	}
	function moins() {
		if (c2.length > 0) {
			c.removeChild(c2[c2.length - 1]);
			c.removeChild(c2[c2.length - 1]);
		}
		if (c2.length == 0) {
			document.getElementById('sup').style.display = 'none'
		}
		;
	}
	</SCRIPT>



</head>
<body>
	<h5 align="right"><a href="/eshop/cart/all">Mon panier</a></h5>



		<c:url value="${path}/product/searchCriteria" var="searchLink"/>
	   <form:form action="${searchLink}" method="GET" autocomplete="on">
    <FIELDSET >
    <LEGEND>recherche avancee</LEGEND>
    <TABLE><tr>
    <td><LABEL for="couleur">couleur</LABEL></td>
    <td><INPUT id="couleur" name="couleur" /></td></tr>
  <tr>  <td><LABEL for="description">description</LABEL></td>
    <td><INPUT id="description" name="description" /></td></tr>
 <tr>   <td><LABEL for="name">name</LABEL></td>
    <td><INPUT id="name" name="name" /></td></tr><tr>
<td>
				<div id="cadre" style=" width: 100px"></div> <input
				type="button" value="ajouter un champ" onclick="plus()" /> <input
				type="button"  style="display: none" id="sup"
				value="supprimer un champ" onclick="moins()" /> <!-- 	<input type="button" value="add" onClick="generatetextboxes()">-->
		</td> 
    </tr>
   
    </TABLE>
     <BUTTON id="search" >search</BUTTON>
    </FIELDSET>
  
</form:form>


<c:if test="${empty psSearchCriteria}">
   <c:out value="aucun resultat correspond à cette recherche" /> 
		</c:if>
	<c:if test="${not empty psSearchCriteria}">

	<table><tr><th>name</th><th>description</th><th>price</th>
	
	<c:forEach items="${psSearchCriteria}"  var="product">
	
	<tr>
		<td>	name :	<a href="show/${product._id}"> ${product.name}</a></td>
		<td>	Description : ${product.description}<br/> 	</td>  
		<td>	price : ${product.price}<br/>  </td>
		<td>	category : ${product.category.name}<br/>  </td>
		<td>	category : ${product.couleur}<br/>  </td>
		<td><a href="/eshop/cart/add/${product._id}">Ajouter au panier</a></td>
		</tr>
		</c:forEach>
		
	</tr>
	</table>
	
	</c:if>
 

	


	</body>
	</html>
</jsp:root>

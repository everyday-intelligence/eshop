<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta charset="utf-8">
<title>ajouter un produit</title>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/jquery-1.5.2.min.js"></script>
<script src="http://code.jquery.com/jquery-ui.min.js"></script>

<style type="text/css">
div {
	padding: 8px;
}
</style>
<SCRIPT language="javascript">
	var c, c2, ch1, ch2;
	 var counter = 2;
	// ajouter un champ avec son "name" propre;
	function plus() {
		if(counter>5){
		            alert("Only 5 textboxes allow");
		             return false;
			 	}   
		c = document.getElementById('cadre');
		c2 = c.getElementsByTagName('input');
		ch1 = document.createElement('input');
		ch2 = document.createElement('input');

		ch1.setAttribute('type', 'text');
		ch1.setAttribute('name', 'description');
		//ch1.setAttribute('readonly','readonly'); 
		//ch1.setAttribute('value', 'attribut'+c2.length/2);
		ch1.setAttribute('style', 'border:none');

		ch2.setAttribute('type', 'text');
		ch2.setAttribute('name', 'description');
		c.appendChild(ch1);
		c.appendChild(ch2);

		document.getElementById('sup').style.display = 'inline';
		counter++;
	}

	// supprimer le dernier champ;
	function moins() {
		if (c2.length > 0) {
			c.removeChild(c2[c2.length - 1]);
			c.removeChild(c2[c2.length - 1]);
			counter--;
		}
		if (c2.length == 0) {
			document.getElementById('sup').style.display = 'none'
				
		}
		;
	}

	// function generatetextboxes()
	// {
	// var  i = 1;
	// my_div.innerHTML = my_div.innerHTML +"<br><input type='text' name='description'>"
	// }

	// $(document).ready(function(){

	//     var counter = 2;

	//     $("#addButton").click(function () {

	// 	if(counter>10){
	//             alert("Only 10 textboxes allow");
	//             return false;
	// 	}   

	// 	var newTextBoxDiv = $(document.createElement('div'))
	// 	     .attr("id", 'TextBoxDiv' + counter);

	// 	newTextBoxDiv.after().html('<label>description : </label>' +
	// 	      '<input type="text"  id="textbox1" value="" >');

	// 	newTextBoxDiv.appendTo("#TextBoxesGroup");

	// 	counter++;
	//      });;
	// });
	
	
	function fileSelected() {
  var file = document.getElementById('fileToUpload').files[0];
  if (file) {
    var fileSize = 0;
    if (file.size > 1024 * 1024)
      fileSize = (Math.round(file.size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
    else
      fileSize = (Math.round(file.size * 100 / 1024) / 100).toString() + 'KB';
          
    document.getElementById('fileName').innerHTML = 'Name: ' + file.name;
    document.getElementById('fileSize').innerHTML = 'Size: ' + fileSize;
    document.getElementById('fileType').innerHTML = 'Type: ' + file.type;
  }
}
</SCRIPT>

</head>
<body>
<table>
	<%-- Welcome to <c:out value="${session.sessionUser}" /> --%>
	<form:form name="form" action="" method="POST" id="frm" enctype="multipart/form-data">


		<tr>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td><form:label path="name">name</form:label></td>
			<td><form:input path="name" /></td>
		</tr>
		<tr>
			<td><form:label path="category.name">category</form:label></td>
			<td><form:input path="category.name" /></td>
		</tr>
		<tr>
			<td><form:label path="price">price</form:label></td>
			<td><form:input path="price" /></td>
		</tr>
		<tr>
			<td><form:label path="couleur">couleur</form:label></td>
			<td><form:input path="couleur" /></td>
			
		</tr>
		<tr>
			<td>image</td>
			<td>
			
				 <input type="file" name="file" />
			
			
			</td>
		</tr>
		<tr>
			<td><form:label path="description">Description</form:label></td>
			<td><form:input path="description" /></td></tr><tr>
			<td></td><td>
				<div id="cadre" style=" width: 100px"></div> <input
				type="button" value="ajouter un champ" onclick="plus()" /> <input
				type="button" style="display: none" id="sup"
				value="supprimer un champ" onclick="moins()" /> <!-- 	<input type="button" value="add" onClick="generatetextboxes()">-->
		</td> 
		</tr>
		<tr>
			<td></td>
			<td>
				<div id='my_div'></div>
			</td>
		</tr>

		<!-- 	<tr> -->
		<!-- 	<td> -->
		<!-- 	<div id='TextBoxesGroup'> -->
		<!-- 	<div id="TextBoxDiv1"> -->
		<!-- 		<label>description : </label><input type='text' id='textbox1' > -->
		<!-- 	</div> -->
		<!-- </div></td> -->
		<!-- <td><input type='button' value='Add Button' id='addButton'></td> -->
		<!-- 	</tr> -->




		<tr>
			<td><input type="submit" value="envoyer" /></td>
		</tr>
	</form:form>
</table>
</body>
</html>
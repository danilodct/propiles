<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="TITULO_SISTEMA" /></title>
<link rel="stylesheet" type="text/css" href="css/lib/jquery.ui.all.css" />
<link rel="stylesheet" type="text/css" href="css/lib/styles.css" />
<script type="text/javascript" src="js/lib/jquery.1.3.2.js"></script>
<script type="text/javascript" src="js/lib/jquery.mask.js"></script>
<script type="text/javascript" src="js/lib/jquery.datepicker.js"></script>
<script type="text/javascript" src="js/lib/scripts.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	setPaginaPrincipal();
	setMaskNumerico();
	setMaskDate("form#formInserirCadastro");
	$("input.data").datepicker();
	$("form#formInserirCadastro").submit(function(){
		var validou = true;
		if($("select#tipo").val() == "-1" && $("input#novoTipoCadastro").val() == ""){
			validou = false;
		}
		return validou;
	});
	$("a.remover").click(function(evt){
		if(!confirm("Tem certeza que deseja remover este centro de custo?")){
			evt.preventDefault();
		}
	});
});

</script>
</head>
<body>
<s:include value="../geral/cabecalho.jsp" />
<s:if test="hasActionErrors()">
	<table width="100%">
		<s:iterator value="actionErrors">
			<tr>
				<td align="center">
				<div class="error"><s:property /></div>
				</td>
			</tr>
		</s:iterator>
	</table>
</s:if>
<s:if test="hasActionMessages()">
	<table width="100%">
		<s:iterator value="actionMessages">
			<tr>
				<td align="center">
				<div class="message"><s:property /></div>
				</td>
			</tr>
		</s:iterator>
	</table>
</s:if>
<div class="centralizador">
<table class="mor">
	<tr>
		<th>Serviços</th>
	</tr>
	<tr>
		<td class="linhaMedia"></td>
	</tr>
	<tr>
		<td><a href="#" class="btAdd"><img src="img/add.png" /></a></td>
	</tr>
	<tr>
		<td class="linhaMedia"></td>
	</tr>
	<tr>
		<td>
		<span id="msgErro" class="error hidden"></span>
		<br /><br />
		<div class="formAdd hidden">
			<fieldset>
				<legend>Cadastrar Centro de Custo</legend> 
				<s:form id="formInserirCadastro" action="inserirCentroCusto" method="post" enctype="multipart/form-data">
					<table class="formAdd">
						<tr><td class="linhaPequena"></td></tr>
						<tr>
							<td class="header">Dados do Centro de Custo</td>
						</tr>
						<tr><td class="linhaPequena"></td></tr>
						<tr>
							<td><label>Nome:</label></td>
						</tr>
						<tr>
							<td>
								<s:textfield name="centroCusto.nome" cssClass="grande" />
							</td>
						</tr>
						<tr><td class="linhaMedia"></td></tr>
						<tr>
							<td>
								<div id="divAvaliacoes">
								</div>
							</td>
						</tr>
						<tr><td class="linhaMedia"></td></tr>
						<tr>
							<td><s:submit value="cadastrar" cssClass="submit" /> <input type="button" class="cancelar submit" value="cancelar" /></td>
						</tr>
					</table>
				</s:form>
			</fieldset>
		</div>
		</td>
	</tr>
</table>
<br /><br />
<table class="listagem">
	<tr>
		<th>Nome</th>
		<th>Remover</th>
	</tr>
	<%
		List<String> classes = Arrays.asList("linhaEscura", "");
		int pointer = 0;
	%>
	<s:iterator value="centrosCusto">
		<tr class="<%= classes.get(pointer % 2) %>">
			<td><a href="centroCusto?centroCusto.id=<s:property value="id" />"><s:property value="nome" /></a></td>
			<td><a class="remover" href="removerCentroCusto?centroCusto.id=<s:property value="id" />" ><img src="img/delete.gif" /></a></td>
		</tr>
	<% pointer += 1; %>
	</s:iterator>
</table>
</div>




<s:include value="../geral/rodape.jsp" />
</body>
</html>
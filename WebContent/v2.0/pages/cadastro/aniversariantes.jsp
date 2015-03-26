<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="TITULO_SISTEMA" /></title>
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/jquery.ui.css" />
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/semantic.css" />
<script type="text/javascript" src="v2.0/js/lib/jquery.ui.mask.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/jquery.semantic.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/scripts.js" ></script>
<script type="text/javascript">
$(document).ready(function(){
	setMenuAtivo("#menuAniversariantes");
	setSubMenuAtivo("#subMenuGeral");
});
</script>
</head>
<body>
<s:include value="../geral/cabecalho.jsp" />

<div class="twelve wide column">

	<div class="ui dividing  header">
		<i class="gift teal circular inverted icon"></i>
		<div class="content">
			Aniversariantes
			<div class="sub header">Clientes e colaboradores nos próximos 60 dias</div>
		</div>
	</div>

	<div class="ui hidden divider"></div>
	<div class="ui hidden divider"></div>

	<!-- INFO DOS NIVER COLABORADORES 88888888888888888888888888888888888888888888888888888888888888888888888 -->
	<h3 class="ui header">Colaboradores</h3>
	
	<!-- LISTAGEM DOS COLABORDORES 88888888888888888888888888888888888888888888888888888888888888888888888 -->
	<table class="ui celled striped teal table">
		<thead><tr><th>Nome</th><th>E-mail</th><th>Dt. de Nascimento</th></tr></thead>
		<tbody>
		<s:iterator value="colaboradores">
			<tr>
				<td><a href="colaborador?colaborador.id=<s:property value="id" />" ><s:property value="nome" /></a></td>
				<td><s:property value="email" /></td>
				<td><s:date name="dataNascimento" format="dd/MM/yyyy" /></td>
			</tr>
		</s:iterator>
		</tbody>
	</table>

	<!-- INFO DOS NIVER COLABORADORES 88888888888888888888888888888888888888888888888888888888888888888888888 -->
	<h3 class="ui header">Clientes</h3>
	
	<table class="ui celled striped teal table">
		<thead><tr><th>Nome</th><th>E-mail</th><th>Dt. de Nascimento</th></tr></thead>
		<tbody>
		<s:iterator value="clientes">
			<tr>
				<td><a href="cadastro?cadastro.id=<s:property value="id" />"><s:property value="nome" /></a></td>
				<td><s:property value="email" /></td>
				<td><s:date name="dataNascimento" format="dd/MM/yyyy" /></td>
			</tr>
		</s:iterator>
		</tbody>
	</table>

</div>

<s:include value="../geral/rodape.jsp" />
</body>
</html>
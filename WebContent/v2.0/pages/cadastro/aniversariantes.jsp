<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link rel="icon" href="http://www.propiles.com.br/img/favicon.ico" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="TITULO_SISTEMA" /></title>
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/jquery.ui.css" />
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/semantic.css" />
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/styles-extras.css" />

<script type="text/javascript" src="v2.0/js/lib/jquery.ui.mask.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/jquery.semantic.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/scripts.js" ></script>
<script type="text/javascript">
$(document).ready(function(){
	setMenuAtivo("#menuAniversariantes");
	setSubMenuAtivo("#subMenuGeral");
});
</script>
<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', 'UA-62673588-1', 'auto');ga('send', 'pageview');</script></head>
<body>
<s:include value="../geral/cabecalho.jsp" />

<div class="twelve wide column">

	<div class="ui dividing  header">
		<i class="gift <s:property value="#session.profisio_user.tenant.corFinal" /> circular inverted icon"></i>
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
	<table class="ui celled striped <s:property value="#session.profisio_user.tenant.corFinal" /> table">
		<thead><tr><th>Nome</th><th>E-mail</th><th>Dt. de Nascimento</th></tr></thead>
		<tbody>
		<s:iterator value="colaboradores">
			<tr>
				<td><a href="colaborador?colaborador.idCript=<s:property value="idCript" />" ><s:property value="nome" /></a></td>
				<td><s:property value="email" /></td>
				<td><s:date name="dataNascimento" format="dd/MM/yyyy" /></td>
			</tr>
		</s:iterator>
		</tbody>
	</table>

	<!-- INFO DOS NIVER COLABORADORES 88888888888888888888888888888888888888888888888888888888888888888888888 -->
	<h3 class="ui header">Clientes</h3>
	
	<table class="ui celled striped <s:property value="#session.profisio_user.tenant.corFinal" /> table">
		<thead><tr><th>Nome</th><th>E-mail</th><th>Dt. de Nascimento</th></tr></thead>
		<tbody>
		<s:iterator value="clientes">
			<tr>
				<td><a href="cadastro?cadastro.idCript=<s:property value="idCript" />"><s:property value="nome" /></a></td>
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
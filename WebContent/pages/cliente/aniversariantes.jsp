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
<h2>Próximos Aniversariantes</h2>
<br />
<h2>Funcionários</h2>
<table class="listagem">
	<tr>
		<th>Nome</th>
		<th>Data</th>
	</tr>
	<%
	List<String> classes = Arrays.asList("linhaEscura", "");
	int pointer = 0;
	%>
	<s:iterator value="professores">
		<tr class="<%= classes.get(pointer % 2) %>">
			<td><s:property value="nome" /></td>
			<td><s:date name="dataNascimento" format="dd/MM/yyyy" /></td>
		</tr>
	<% pointer += 1; %>
	</s:iterator>
</table>
<br /><br />
<h2>Clientes</h2>
<table class="listagem">
	<tr>
		<th>Nome</th>
		<th>E-mail</th>
		<th>Data</th>
	</tr>
	<%
		classes = Arrays.asList("linhaEscura", "");
		pointer = 0;
	%>
	<s:iterator value="clientes">
		<tr class="<%= classes.get(pointer % 2) %>">
			<td><a href="cliente?cliente.id=<s:property value="id" />"><s:property value="nome" /></a></td>
			<td><s:property value="email" /></td>
			<td><s:date name="dataNascimento" format="dd/MM/yyyy" /></td>
		</tr>
	<% pointer += 1; %>
	</s:iterator>
</table>
</div>
<s:include value="../geral/rodape.jsp" />
</body>
</html>
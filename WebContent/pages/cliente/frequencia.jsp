<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="TITULO_SISTEMA" /></title>
<link rel="stylesheet" type="text/css" href="css/lib/styles.css" />
<script type="text/javascript" src="js/lib/jquery.1.3.2.js"></script>
<script type="text/javascript" src="js/lib/jquery.mask.js"></script>
<script type="text/javascript" src="js/lib/jquery.datepicker.js"></script>
<script type="text/javascript" src="js/lib/scripts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setPaginaPrincipal();
		setMaskDate("form#formPesquisa");
		$("a.remover").click(function(evt){
			var confirmacao = true;
			if(!confirm("Tem certeza que deseja remover este item?")){
				confirmacao = false;
			}
			return confirmacao;
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
		<th>Frequências</th>
	</tr>
	<tr>
		<td class="linhaMedia"></td>
	</tr>
</table>
</div>
<br /><br />
<table class="normal">
	<tr>
		<td align="center">
			<s:form action="frequencia" id="formPesquisa">
				<label>Data incial:</label>
				<s:textfield cssClass="data pequeno" name="dataInicialStr" /> 
				<label>Data final:</label>
				<s:textfield cssClass="data pequeno" name="dataFinalStr" /> 
				<input type="submit" class="submit" value="buscar" />
			</s:form>
		</td>
	</tr>
</table>
<table class="listagem">
	<tr>
		<th>Data</th>
		<th>Cliente</th>
		<th>Modalidade</th>
		<th>Colaborador</th>
		<th>Remover</th>
	</tr>
	<s:if test="frequencias.size > 0">
	<%
		List<String> classes = Arrays.asList("linhaEscura", "");
		int pointer = 0;
	%>
	<s:iterator value="frequencias">
		<tr class="<%= classes.get(pointer % 2) %> linhaResultado">
			<td><s:date name="data" format="dd/MM/yyyy" /> às <s:date name="data" format="HH:mm" /></td>
			<td><a href="cliente?cliente.id=<s:property value="cliente.id" />"><s:property value="cliente.nome" /></a></td>
			<td><s:property value="servico.nome" /></td>
			<td><s:property value="profissional.nome" /></td>
			<td><a class="remover" href="removerFrequencia?frequencia.id=<s:property value="id" />"><img src="img/delete.gif" /></a></td>
		</tr>
	<% pointer += 1; %>
	</s:iterator>
	</s:if><s:else>
		<tr>
			<td>
				Nenhum registro encontrado.
			</td>
		</tr>
	</s:else>
</table>
<s:include value="../geral/rodape.jsp" />
</body>
</html>
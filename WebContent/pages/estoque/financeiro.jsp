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
<script type="text/javascript" src="js/lib/jquery.simplemodal-1.3.4.js"></script>
<script type="text/javascript" src="js/lib/scripts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setPaginaPrincipal();
		setMaskDate("form#formBuscar");
		setMaskNumerico("form#formVenda");
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
		<th>Estoque</th>
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
			<s:form action="financeiroVendas" id="formBuscar">
				<label>Data inicial:</label> <input type="text" class="data pequeno" name="dataInicial" value="<s:date format="dd/MM/yyyy" name="dataInicial" />" /> 
				<label>Data Final:</label> <input type="text" class="data pequeno" name="dataFinal" value="<s:date format="dd/MM/yyyy" name="dataFinal" />" /> 
				<label>Vendedor:</label>
				<s:select list="allVendedores" cssClass="medio" name="vendedor.id" listKey="id" listValue="nome"></s:select> 
				<input type="submit" class="submit" value="FILTRAR" />
			</s:form>
		</td>
	</tr>
</table>
<s:if test="dataInicial != null || dataFinal != null">
	<div class="centralizador">
		<h1>Valor das vendas neste período:<span><s:property value="valorTotal" /></span></h1>
		<h2>Porcentagem para este vendedor:<span><s:property value="valorVendedor" /></span></h2>
	</div>
</s:if>

<s:include value="../geral/rodape.jsp" />
</body>
</html>
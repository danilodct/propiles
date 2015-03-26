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
<link rel="stylesheet" type="text/css" href="css/lib/jquery.ui.all.css" />
<script type="text/javascript" src="js/lib/jquery.1.3.2.js"></script>
<script type="text/javascript" src="js/lib/jquery.mask.js"></script>
<script type="text/javascript" src="js/lib/jquery.datepicker.js"></script>
<script type="text/javascript" src="js/lib/scripts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setPaginaPrincipal();
		$("input.data").datepicker();
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
		<td>
		<div class="formAdd">
			<fieldset>
				<legend>Filtros para Gerar Relatório</legend> 
				<s:form id="formGerarRelatorio" action="relatorioFormaPagamento" method="post">
					<table class="formAdd">
						<tr><td class="linhaPequena"></td></tr>
						<tr>
							<td>
								<span id="erroAddContrato" class="error hidden"></span>
							</td>
						</tr>
						<tr>
							<td align="left">
								<table>
									<tr>
										<td><label>Data Inicial:</label></td>
										<td>&nbsp;&nbsp;</td>
										<td><label>Data Final:</label></td>
									</tr>
									<tr>
										<td><input type="text" name="dataInicialStr" class="pequeno data" value="<s:date name="dataInicial" format="dd/MM/yyyy" />" /></td>
										<td></td>
										<td><input type="text" name="dataFinalStr" class="pequeno data" value="<s:date name="dataFinal" format="dd/MM/yyyy" />" /></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td class="linhaMedia"></td></tr>
						<tr>
							<td><s:submit value="gerar relatório" cssClass="submit" /></td>
						</tr>
					</table>
				</s:form>
			</fieldset>
		</div>
		</td>
	</tr>
</table>
<br /><br />
<div class="separadorLeft">
<a href="javascript:window.print()" class="print" >
	<img src="img/print.gif" />
</a>
<h2 class="headerImpressao">
	Relatório de Formas de Pagamento
	<br />
</h2>
<br />
<h2>
	<s:if test="dataInicial != null || dataFinal != null">
		Dados
	</s:if>
	<s:if test="dataInicial != null">
		a partir da data <s:date name="dataInicial" format="dd/MM/yyyy" />
	</s:if>
	<s:if test="dataFinal != null">
		até a data <s:date name="dataFinal" format="dd/MM/yyyy" />
	</s:if>
</h2>
<table class="listagem">
	<tr>
		<th>Forma</th>
		<th>Quantidade</th>
		<th>(%)</th>
	</tr>
	<%
		List<String> classes = Arrays.asList("linhaEscura", "");
		int pointer = 0;
	%>
	<s:iterator value="relatoriosFormaPagamento">
		<tr class="<%= classes.get(pointer % 2) %>">
			<td><s:property value="tipo.valor" /></td>
			<td><s:property value="quantidade" /></td>
			<td><s:property value="%{getText('{0,number,#,##0.00}',{porcentagem})}" /></td>
		</tr>
	<% pointer += 1; %>
	</s:iterator>
</table>
</div>
</div>
<s:include value="../geral/rodape.jsp" />
</body>
</html>
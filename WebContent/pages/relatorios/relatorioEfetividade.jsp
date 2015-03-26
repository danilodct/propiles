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
				<legend>Filtros para Gerar Relatório de EFETIVIDADE</legend> 
				<s:form id="formGerarRelatorio" action="relatorioEfetividade" method="post">
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

<a href="javascript:window.print()" class="print" >
	<img src="img/print.gif" />
</a>
<h2 class="headerImpressao">
	Relatório de Clientes ativos
	<br />
</h2>
<br />
<h2>
	Novos cadastros: <s:property value="somaCadastros" /><br />
	Convertidos em clientes: <s:property value="somaEfetividade" /> (<s:property value="%{getText('{0,number,#,##0.00}',{porcentagemEfetividade})}" />%)<br />
	<s:if test="dataInicial != null">
		a partir da data <s:date name="dataInicial" format="dd/MM/yyyy" />
	</s:if>
	<s:if test="dataFinal != null">
		até a data <s:date name="dataFinal" format="dd/MM/yyyy" />
	</s:if>
	<s:if test="professor.id != -1">
		para o(a) professor(a) <s:property value="modalidade.professor.nome" />
	</s:if>
</h2>
<table class="listagem">
	<tr>
		<th>Cliente</th>
		<th>E-mail</th>
		<th>Data de cadastro</th>
		<th>Cliente</th>
		<!-- 
		<th>Modalidade</th>
		 -->
	</tr>
	<%
		List<String> classes = Arrays.asList("linhaEscura", "");
		int pointer = 0;
	%>
	<s:iterator value="clientes">
		<tr class="<%= classes.get(pointer % 2) %>">
			<td><a href="cliente?cliente.id=<s:property value="id"/>"><s:property value="nome" /></a></td>
			<td><s:property value="email" /></td>
			<td><s:date name="dataCadastro" format="dd/MM/yyyy"  /></td>
			<td>
				<s:if test="virouNovoCliente">
					<img src="img/icon-right.png" />
				</s:if>
			</td>
			<!-- 
			<td><s:property value="modalidade.valor" /></td>
			 -->
		</tr>
	<% pointer += 1; %>
	</s:iterator>
</table>
</div>
<s:include value="../geral/rodape.jsp" />
</body>
</html>
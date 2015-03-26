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
				<s:form id="formGerarRelatorio" action="relatorioAlunosAtivos" method="post">
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
									<tr>
										<td colspan="3" align="left">
											<label>Professor:</label><br />
											<s:select list="professores" name="professor.id" headerKey="-1" headerValue="TODOS" listKey="id" listValue="nome"></s:select>
										</td>
									</tr>
									<tr>
										<td colspan="3" align="left">
											<label>Serviço:</label><br />
											<s:select list="modalidades" name="servico.id" headerKey="-1" headerValue="TODOS" listKey="id" listValue="nome"></s:select>
										</td>
									</tr>
									<tr>
										<td colspan="3" align="left">
											<label>Ordenar por:</label><br />
											Cliente <input type="radio" name="ordenacao" value="cli.nome" />
											Professor <input type="radio" name="ordenacao" value="profissional.nome" />
											Data <input type="radio" name="ordenacao" value="data" />
											Modalidade <input type="radio" name="ordenacao" value="modalidade" />
										</td>
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
	Total: <s:property value="clientes.size" /> clientes 
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
		<!-- 
		<th>Data</th>
		<th>Professor</th>
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
			<!-- 
			<td>
				<s:date name="data" format="dd/MM/yyyy" />
			</td>
			<td><s:property value="profissional.nome" /></td>
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
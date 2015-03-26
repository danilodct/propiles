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
		setMaskDate("form#formInserirContaReceber");
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
				<s:form id="formGerarRelatorio" action="relatorioLucros" method="post">
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
											<s:select list="professores" name="professor.id" listKey="id" listValue="nome"></s:select>
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
</div>
<br /><br />
<div class="separadorLeft">
<a href="javascript:window.print()" class="print" >
	<img src="img/print.gif" />
</a>
<br /><br />
<s:if test="professor != null">
<h2>Dados relacionados ao Professor <s:property value="professor.nome" /></h2>
</s:if>
<h2></h2>
<br />
<h4>Total de Entradas: R$ <s:property value="%{getText('{0,number,#,##0.00}',{somaEntradaProfessor})}" /></h4>
<h4>Total para o Colaborador: R$ <s:property value="%{getText('{0,number,#,##0.00}',{somaProfessor})}" /></h4>
<h4>Total de Vendas: R$ <s:property value="%{getText('{0,number,#,##0.00}',{somaVendasProfessor})}" /></h4>
<h4>Total para o Colaborador: R$ <s:property value="%{getText('{0,number,#,##0.00}',{porcentagemVendasProfessor})}" /></h4>
________________________________________________________________________
<h2>Lucro: R$ <s:property value="%{getText('{0,number,#,##0.00}',{somaVitaCorpore})}" /></h2>
<br /><br /><br /><br />
<h2>Dados Gerais Vanity:</h2>
<h4>Total de Entradas: R$ <s:property value="%{getText('{0,number,#,##0.00}',{somaEntrada})}" /></h4>
<h4>Total de Entradas avulso: R$ <s:property value="%{getText('{0,number,#,##0.00}',{somaEntradaAvulso})}" /></h4>
<h4>Total de Vendas: R$ <s:property value="%{getText('{0,number,#,##0.00}',{somaVendas})}" /></h4>
<h4>Total de Saídas: R$ <s:property value="%{getText('{0,number,#,##0.00}',{somaSaida})}" /></h4>
<h4>Total Para Colaboradores: R$ <s:property value="%{getText('{0,number,#,##0.00}',{somaProfessores})}" /></h4>
________________________________________________________________________
<h2>Lucro Total: R$ <s:property value="%{getText('{0,number,#,##0.00}',{lucroVitaCorpore})}" /></h2>
</div>
<br /><br />
<s:include value="../geral/rodape.jsp" />
</body>
</html>
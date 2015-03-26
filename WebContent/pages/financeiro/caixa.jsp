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
		setMaskNumerico("form#formInserirContaReceber");
		$("form#formInserirContaReceber").submit(function(){
			var validou = true;
			if(($("select#tipo").val() == "-1" || $("select#tipo").val() == "Outro") && $("input#novoTipoContaReceber").val() == ""){
				validou = false;
			}
			if(validou){
				tirarVirgulaPontos("form#formInserirContaReceber");
			}
			return validou;
		});
		$("a.remover").click(function(evt){
			var confirmacao = true;
			if(!confirm("Tem certeza que deseja remover esta conta?")){
				confirmacao = false;
			}
			return confirmacao;
		});
		$("select#tipo").change(function(){
			if($(this).val() == "Outro"){
				$("div#novoTipoContaReceber").show();
			}else{
				$("div#novoTipoContaReceber").hide();
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
		<th>Caixa</th>
	</tr>
	<tr>
		<td class="linhaMedia"></td>
	</tr>
</table>
<br /><br />
<fieldset>
<legend>Pesquisar</legend>
<s:form id="formPesquisar" action="caixa" method="post">
	<table class="formAdd">
		<tr><td class="linhaPequena"></td></tr>
		<tr>
			<td align="left">
				<table>
					<tr>
						<td><label>Data Início:</label></td>
						<td>&nbsp;</td>
						<td><label>Data Fim:</label></td>
					</tr>
					<tr>
						<td><input type="text" name="dataInicialStr" class="pequeno data" value="<s:date name="dataInicial" format="dd/MM/yyyy" />" /></td>
						<td>&nbsp;</td>
						<td><input type="text" name="dataFinalStr" class="pequeno data" value="<s:date name="dataFinal" format="dd/MM/yyyy" />" /></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr><td class="linhaMedia"></td></tr>
		<tr>
			<td><s:submit value="procurar" cssClass="submit" /></td>
		</tr>
	</table>
</s:form>
</fieldset>
</div>
<br /><br />
<div class="separadorLeft">
<a href="javascript:window.print()" class="print" >
	<img src="img/print.gif" />
</a>
<h2>Saldo final: R$ <s:property value="%{getText('{0,number,#,##0.00}',{saldoCaixa})}" /> </h2>
________________________________________________________________________
<h2>
	Saldo anterior:  R$ <s:property value="%{getText('{0,number,#,##0.00}',{saldoAnteriorCaixa})}" />
</h2>
<h2>
	Entradas: R$ <s:property value="%{getText('{0,number,#,##0.00}',{entradasCaixa})}" /> 
</h2>

	<table class="listagem">
		<tr>
			<th>Cliente</th>
			<th>Modalidade</th>
			<th>Valor (R$)</th>
			<th>Data de Pagamento</th>
			<th>Forma</th>
			<!-- <th>Tipo</th>-->
			<th>Situação</th>
			<th class="remover">Remover</th>
		</tr>
		<%
			List<String> classes = Arrays.asList("linhaEscura", "");
			int pointer = 0;
		%>
		<s:if test="contasReceber.size > 0">
			<s:iterator value="contasReceber">
				<tr class="<%= classes.get(pointer % 2) %> linhaResultado">
					<td>
						<s:if test="cadastro != null">
							<s:property value="cadastro.cliente.nome" />
						</s:if>
					</td>
					<td><s:property value="cadastro.modalidade.servico.nome" /></td>
					<td><s:property value="%{getText('{0,number,#,##0.00}',{caixa})}" /></td>
					<td><s:date name="dataPagamento" format="dd/MM/yyyy" /></td>
					<td>
						<s:property value="formaPagamento.valor" />
						<s:if test="formaPagamento.qtdParcelas > 1">
							[<s:property value="ordemParcelamento" />/<s:property value="%{getText('{0,number,#,##0}',{formaPagamento.qtdParcelas})}" />]
						</s:if>
					</td>
					<!-- <td><s:property value="tipo.nome" /></td>-->
					<td><s:property value="status.valor" /></td>
					<td class="remover"><a class="remover" href="removerContaReceber?contaReceber.id=<s:property value="id" />"><img src="img/delete.gif" /></a></td>
				</tr>
			<% pointer += 1; %>
			</s:iterator>
		</s:if><s:else>
			<tr>
				<td>Nenhuma entrada!</td>
			</tr>
		</s:else>
	</table>
<h2>
	Vendas: R$ <s:property value="%{getText('{0,number,#,##0.00}',{entradasVendasCaixa})}" /> 
</h2>
	
	<table class="listagem">
		<tr>
			<th>Produto</th>
			<th>Status</th>
			<th>Valor (R$)</th>
			<th>Data de venda</th>
			<th>Vendedor</th>
			<th>Vender</th>
			<th>Remover</th>
		</tr>
		<%
			classes = Arrays.asList("linhaEscura", "");
			pointer = 0;
		%>
		<s:if test="estoques.size > 0">
			<s:iterator value="estoques">
				<tr class="<%= classes.get(pointer % 2) %> linhaResultado">
					<td><s:property value="produto.nome" /></td>
					<td><s:property value="status.valor" /></td>
					<td><s:if test="status.value == 'VENDIDO'"><s:property value="valorStr" /></s:if></td>
					<td><s:date name="data" format="dd/MM/yyyy" /></td>
					<td><s:property value="vendedor.nome" /></td>
					<td>
						<s:if test="status.value != 'VENDIDO'">
							<a class="vender submit" id="<s:property value="id" />" lang="<s:property value="produto.valorStr" />" href="#" >VENDER</a>
						</s:if>
					</td>
					<td><a class="remover" href="removerEstoque?estoque.id=<s:property value="id" />"><img src="img/delete.gif" /></a></td>
				</tr>
			<% pointer += 1; %>
			</s:iterator>
		</s:if><s:else>
			<tr>
				<td>Nenhuma venda!</td>
			</tr>
		</s:else>
	</table>


<h2>
	Saídas: R$ -<s:property value="%{getText('{0,number,#,##0.00}',{saidasCaixa})}" /> 
</h2>

	<table class="listagem">
		<tr>
			<th>Valor (R$)</th>
			<th>Classificação</th>
			<th>Tipo</th>
			<th>Mês competência</th>
			<th>Data de Pagamento</th>
			<th>Data de Vencimento</th>
			<th>Situação</th>
			<th class="remover">Remover</th>
		</tr>
		<%
			classes = Arrays.asList("linhaEscura", "");
			pointer = 0;
		%>
		<s:if test="contasPagar.size > 0">
			<s:iterator value="contasPagar">
				<tr class="<%= classes.get(pointer % 2) %> linhaResultado">
					<td><s:property value="%{getText('{0,number,#,##0.00}',{valor})}" /></td>
					<td><s:property value="tipoCusto.valor" /></td>
					<td><s:property value="tipo.nome" /></td>
					<td><s:property value="mesCompetenciaNome" /></td>
					<td><s:date name="dataPagamento" format="dd/MM/yyyy" /></td>
					<td><s:date name="dataVencimento" format="dd/MM/yyyy" /></td>
					<td><s:property value="status.valor" /></td>
					<td class="remover"><a class="remover" href="removerContaPagar?contaPagar.id=<s:property value="id" />"><img src="img/delete.gif" /></a></td>
				</tr>
			<% pointer += 1; %>
			</s:iterator>
		</s:if><s:else>
			<tr>
				<td>Nenhuma saída!</td>
			</tr>
		</s:else>
	</table>

<!-- 
<h2>
	Descontos: R$ -<s:property value="%{getText('{0,number,#,##0.00}',{descontosEntradasCaixa})}" /> 
</h2>
 -->
________________________________________________________________________
<h2>Saldo final: R$ <s:property value="%{getText('{0,number,#,##0.00}',{saldoCaixa})}" /> </h2>
</div>
<s:include value="../geral/rodape.jsp" />
</body>
</html>
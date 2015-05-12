<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link rel="icon" href="http://www.propiles.com.br/img/favicon.ico" type="image/x-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="TITULO_SISTEMA" /></title>
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/jquery.ui.css" />
<link rel="stylesheet" type="text/css" href="v2.0/css/lib/semantic.css" />

<script type="text/javascript" src="v2.0/js/lib/jquery.semantic.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/jquery.ui.mask.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/scripts.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	setMenuAtivo("#menuCaixa");
	setSubMenuAtivo("#subMenuFluxoCaixa");
	setMaskDate(".data");
});
</script>
<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', 'UA-62673588-1', 'auto');ga('send', 'pageview');</script></head>
<body>
	<s:include value="../geral/cabecalho.jsp" />

	<div class="fifteen wide column">
	
		<!-- TITULO DA PÁGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->

		<div class="ui dividing  header">
			<i class="money <s:property value="#session.profisio_user.tenant.corFinal" /> circular inverted icon"></i>
			<div class="content">
				Caixa
				<div class="sub header">Veja o extrato do seu caixa em determinado período</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<!-- AREA PESQUISA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		
		<div class="ui areaSearch centered grid" >
			<div class="wide column">
				<s:form action="caixa" cssClass="ui form fluid" >
					<div class="three fields">
						<div class="field">
							<label>Data Inicial:</label>
							<div class="ui icon input">
								<s:textfield name="dataInicialStr" cssClass="data" />
								<i class="calendar icon"></i>
							</div>
						</div>
						<div class="field">
							<label>Data Final:</label>
							<div class="ui icon input">
								<s:textfield name="dataFinalStr" cssClass="data" />
								<i class="calendar icon"></i>
							</div>
						</div>
						<div class="field">
							<label class="visibilityHidden">Botão:</label> 
							<input type="submit" class="ui <s:property value="#session.profisio_user.tenant.corFinal" /> submit button" value="Pesquisar" />
						</div>
					</div>
				</s:form>			
			</div>
		</div>
		
		<!-- INFO DE TOTAL 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<h2 class="ui horizontal header divider">
			Saldo final: R$ <s:property value="somaTotalStr" />
		</h2>
		
		<div class="ui hidden divider"></div>
		
		<!-- INFO  88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<h4 class="ui header left floated">
			<s:if test="dataInicialStr == null && dataFinalStr == null">Extrato do mês atual:</s:if>
			<s:else>
				Extrato 
				<s:if test="dataInicialStr != null">
					de <s:property value="dataInicialStr" /> 
				</s:if>
				<s:if test="dataFinalStr != null">
					até <s:property value="dataFinalStr" />
				</s:if>
				:
			</s:else>
		</h4>

		<!-- TABELA DE CONTAS A RECEBER AVULSO 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<table class="ui celled <s:property value="#session.profisio_user.tenant.corFinal" /> striped table">
			<tbody>
				<tr>
					<td>Saldo anterior</td>
					<td>R$ <s:property value="somaStr" /></td>
				</tr>
				<tr>
					<td>Total de entradas</td>
					<td>R$ <s:property value="somaEntradasStr" /></td>
				</tr>
				<tr>
					<td>Total de saídas</td>
					<td>R$ <s:property value="somaSaidasStr" /></td>
				</tr>
			</tbody>
		</table>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<!-- DETALHAMENTO  88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<h4 class="ui header left floated">Detalhamento:</h4>
		
		<!-- LEGENDA  88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="right floated column">
			<div style="width: 18px;height: 18px;border: 1px solid #D4D4D5;background-color: #EEFFE7;float: left;margin-right: 5px;"></div> 
			<div style="float:left; margin-right:10px;">= pagamentos recebidos</div>
			<div style="width: 18px;height: 18px;border: 1px solid #D4D4D5;background-color: #FFF0F0;float: left;margin-right: 5px;"></div>
			<div style="float:left; margin-right:10px;">= contas pagas</div>
			<div style="width: 18px;height: 18px;border: 1px solid #D4D4D5;background-color: #FFFBE6;float: left;margin-right: 5px;"></div>
			<div style="float:left; margin-right:10px;">= vendas feitas</div>
		</div>
		
		<table class="ui celled <s:property value="#session.profisio_user.tenant.corFinal" /> table">
			<tbody>
				<s:if test="movimentacoes.size > 0">
					<s:iterator value="movimentacoes">
						<tr 
						class="
								<s:if test="tipoMovimentacao.value == 'CONTA_RECEBER'">positive</s:if> 
								<s:elseif test="tipoMovimentacao.value == 'CONTA_PAGAR'">negative</s:elseif>
								<s:elseif test="tipoMovimentacao.value == 'VENDA'">warning</s:elseif>
							" 
						>
							<td>
								<s:date name="data" format="dd/MM/yy" /> -
								<s:property value="descricao" />
							</td>
							<td><s:property value="valorStr" /></td>
						</tr>
					</s:iterator>
				</s:if>
				<s:else>
					<tr>
						<td colspan="5">Nenhum registro encontrado.</td>
					</tr>
				</s:else>
			</tbody>
		</table>
		
	</div>
	
	<s:include value="../geral/rodape.jsp" />
</body>
</html>
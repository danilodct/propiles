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

<style type="text/css">
 @media print{
 	.ui.menu .item, .title, .add.icon, .print.icon, tr.linhaFicha.hide, form, h4, .ui.buttons{display:none;}
 	.ui.menu .item.image, form.printable, h4.ui.header{display:block !important;}
 	.ui.menu, .ui.styled.accordion{box-shadow:none;}
 }
</style>
<script type="text/javascript" src="v2.0/js/lib/jquery.semantic.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/jquery.ui.mask.js" ></script>
<script type="text/javascript" src="v2.0/js/lib/scripts.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setMenuAtivo("#menuDemonstrativo");
		setSubMenuAtivo("#subMenuRelatorios");
		setMaskDate(".data");
		setBtPrint();
		formatarRelatorio();
	});
	function formatarRelatorio(){
		var relatorio = $("input#relatorio").val();
		var meses = relatorio.split("|");
		
		for(var i = 0; i < meses.length; i += 1){
			var variaveis = meses[i].split(";");
			if(i < meses.length - 1){
				var anoMes = ((variaveis[0]).split(":"))[1];
				$("tr#linhaTitulo").append($("<th>"+anoMes+"</th>"));
				var fat = ((variaveis[1]).split(":"))[1];
				$("tr.linhaReceitasBrutas").append($("<td>R$ "+fat+"</td>"));
				var contaVar = ((variaveis[2]).split(":"))[1];
				$("tr.linhaCustoVariavelTotal").append($("<td>R$ "+contaVar+"</td>"));
				var mc = ((variaveis[3]).split(":"))[1];
				$("tr.linhaMargemContribuicao").append($("<td>R$ "+mc+"</td>"));
				var contaFix = ((variaveis[4]).split(":"))[1];
				$("tr.linhaCustosFixos").append($("<td>R$ "+contaFix+"</td>"));
				var resultado = ((variaveis[5]).split(":"))[1];
				$("tr.linhaResultado").append($("<td>R$ "+resultado+"</td>"));
			}else{
				$("tr#linhaTitulo").append($("<th>Totais</th>"));
				$("tr#linhaTitulo").append($("<th>Percentuais</th>"));
				var totalFat = ((variaveis[0]).split(":"))[1];
				$("tr.linhaReceitasBrutas").append($("<td>R$ "+totalFat+"</td>"));
				var totalVar = ((variaveis[1]).split(":"))[1];
				$("tr.linhaCustoVariavelTotal").append($("<td>R$ "+totalVar+"</td>"));
				var totalMC = ((variaveis[2]).split(":"))[1];
				$("tr.linhaMargemContribuicao").append($("<td>R$ "+totalMC+"</td>"));
				var totalFix = ((variaveis[3]).split(":"))[1];
				$("tr.linhaCustosFixos").append($("<td>R$ "+totalFix+"</td>"));
				var totalRes = ((variaveis[4]).split(":"))[1];
				$("tr.linhaResultado").append($("<td>R$ "+totalRes+"</td>"));
				var perFat = ((variaveis[5]).split(":"))[1];
				$("tr.linhaReceitasBrutas").append($("<td>"+perFat+"</td>"));
				var perVar = ((variaveis[6]).split(":"))[1];
				$("tr.linhaCustoVariavelTotal").append($("<td>"+perVar+"</td>"));
				$("#custosVariaveis").html(perVar);
				var perMC = ((variaveis[7]).split(":"))[1];
				$("tr.linhaMargemContribuicao").append($("<td>"+perMC+"</td>"));
				$("#MC").html(perMC);
				var perFix = ((variaveis[8]).split(":"))[1];
				$("tr.linhaCustosFixos").append($("<td>"+perFix+"</td>"));
				$("#custosFixos").html(perFix);
				var perRes = ((variaveis[9]).split(":"))[1];
				$("tr.linhaResultado").append($("<td>"+perRes+"</td>"));
				$("#lucratividade").html(perRes);
				//indicadores
				var perTicket = "R$ "+((variaveis[10]).split(":"))[1];
				$("#ticket").html(perTicket);
				var ponto = 0;
				if(parseFloat(perMC.replace(".", "").replace(",", ".").replace("%", "")) > 0)
					ponto = parseFloat(totalFix.replace(".", "").replace(",", "."))/parseFloat(perMC.replace(".", "").replace(",", ".").replace("%", ""));
				$("#ponto").html("R$ "+setNumberFormat(ponto*100));
			}
		}
		
	}
</script>
<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', 'UA-62673588-1', 'auto');ga('send', 'pageview');</script></head>
<body>
	<s:include value="../geral/cabecalho.jsp" />

<s:hidden name="relatorio" id="relatorio" />
<s:hidden name="qtdClientesAtivos" id="qtdClientesAtivos" />

	<div class="fifteen wide column">
	
		<!-- TITULO DA PÁGINA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui dividing  header">
			<i class="list layout <s:property value="#session.profisio_user.tenant.corFinal" /> circular inverted icon"></i>
			<div class="content">
				Demonstrativo de Resultados
				<div class="sub header">Relatório com vários parâmetros relevantes (ticket médio, faturamento bruto e líquido, custos fixos e variáveis, margem de contribuição)</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<!-- AREA PESQUISA 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<div class="ui areaSearch centered grid" >
			<div class="wide column">
				<s:form action="relatorioDRE" cssClass="ui form fluid" >
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
							<input type="submit" class="ui <s:property value="#session.profisio_user.tenant.corFinal" /> submit button" value="Gerar" />
						</div>
					</div>
				</s:form>			
			</div>
		</div>
		
	<s:if test="#session.profisio_user.tenant.accessRelatorio">	
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
	
	<s:if test="relatorio == '' ">
		<h3 class="ui horizontal header">Selecione um período para análise</h3>
	</s:if>				
		
	<s:if test="relatorio != '' ">
		<!-- ICONE DE IMPRIMIR 88888888888888888888888888888888888888888888888888888888888888888888888 -->
		<a href="#" title="Imprimir relatório" class="btPrint ui"> 
			<i class="print black large icon"></i>
		</a>
		
		<div class="ui hidden divider"></div>
		
		<div class="ui two column grid">
			<div class="column">
				<div class="ui two column grid">
					<div class="right aligned column"><strong><i class="help circle icon hint" data-html="<div style='width:150px'>Margem de Contribuição: Fat. Bruto - Custos Var.</div>" data-variation="inverted" ></i> MC:</strong></div>
					<div class="column" id="MC"></div>
				</div>
				<div class="ui two column grid">
					<div class="right aligned column"><strong><i class="help circle icon hint" data-html="<div style='width:155px'>Quanto as despesas variáveis representam do faturamento</div>" data-variation="inverted" ></i> Custos Variáveis:</strong></div>
					<div class="column" id="custosVariaveis"></div>
				</div>
				<div class="ui two column grid">
					<div class="right aligned column"><strong><i class="help circle icon hint" data-html="<div style='width:155px'>Quanto as despesas fixas representam do faturamento</div>" data-variation="inverted" ></i> Custos Fixos:</strong></div>
					<div class="column" id="custosFixos"></div>
				</div>
			</div>
			<div class="column">
				<div class="ui two column grid">
					<div class="right aligned column"><strong><i class="help circle icon hint" data-html="<div style='width:190px'>Quanto em média cada cliente gera para o faturamento mensal ($)</div>" data-variation="inverted" ></i> Ticket Médio:</strong></div>
					<div class="column" id="ticket"></div>
				</div>
				<div class="ui two column grid">
					<div class="right aligned column"><strong><i class="help circle icon hint" data-html="<div style='width:150px'>Lucro / Faturamento Bruto</div>" data-variation="inverted" ></i> Lucratividade:</strong></div>
					<div class="column" id="lucratividade"></div>
				</div>
				<%-- <div class="ui two column grid">
					<div class="right aligned column"><strong>Faturamento:</strong></div>
					<div class="column" id="faturamento">100,00%</div>
				</div> --%>
				<div class="ui two column grid">
					<div class="right aligned column"><strong><i class="help circle icon hint" data-html="<div style='width:210px'>Custos Fixos / Margem de Contribuição</div>" data-variation="inverted" ></i> Ponto de Equilíbrio:</strong></div>
					<div class="column" id="ponto"></div>
				</div>
			</div>
		</div>
		
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		<div class="ui hidden divider"></div>
		
		<table id="tabelaRelatorio" class="ui celled <s:property value="#session.profisio_user.tenant.corFinal" /> table">
			<thead>
				<tr id="linhaTitulo"><th>DRE</th></tr>
			</thead>
			<tbody>
				<tr class="linhaReceitasBrutas positive"><td><b>1. Receitas Brutas</b></td></tr>
				<tr class="linhaCustoVariavelTotal negative"><td><b>2. Custo Variável total</b></td></tr>
				<tr class="linhaMargemContribuicao positive"><td><b>3. Margem de Contribuição</b></td></tr>
				<tr class="linhaCustosFixos negative"><td><b>4. Custos Fixos</b></td></tr>
				<tr class="linhaResultado positive"><td><b>5. Resultados</b></td></tr>
			</tbody>
		</table>
		
	</s:if>
	</s:if>
	<s:else>
		<s:include value="../planos.jsp" />
	</s:else>
	</div>
	
	<s:include value="../geral/rodape.jsp" />
</body>
</html>